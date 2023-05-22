require "../foundation.cr"
require "../system/io.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:winbio.dll")]
lib LibWin32
  WINBIO_MAX_STRING_LEN = 256_u32
  WINBIO_SCP_VERSION_1 = 1_u32
  WINBIO_SCP_RANDOM_SIZE_V1 = 32_u32
  WINBIO_SCP_DIGEST_SIZE_V1 = 32_u32
  WINBIO_SCP_CURVE_FIELD_SIZE_V1 = 32_u32
  WINBIO_SCP_PUBLIC_KEY_SIZE_V1 = 65_u32
  WINBIO_SCP_PRIVATE_KEY_SIZE_V1 = 32_u32
  WINBIO_SCP_SIGNATURE_SIZE_V1 = 64_u32
  WINBIO_SCP_ENCRYPTION_BLOCK_SIZE_V1 = 16_u32
  WINBIO_SCP_ENCRYPTION_KEY_SIZE_V1 = 32_u32
  WINBIO_BIR_ALIGN_SIZE = 8_u32
  WINBIO_BIR_ALGIN_SIZE = 8_u32
  FACILITY_WINBIO = 9_u32
  FACILITY_NONE = 0_u32
  WINBIO_E_UNSUPPORTED_FACTOR = -2146861055_i32
  WINBIO_E_INVALID_UNIT = -2146861054_i32
  WINBIO_E_UNKNOWN_ID = -2146861053_i32
  WINBIO_E_CANCELED = -2146861052_i32
  WINBIO_E_NO_MATCH = -2146861051_i32
  WINBIO_E_CAPTURE_ABORTED = -2146861050_i32
  WINBIO_E_ENROLLMENT_IN_PROGRESS = -2146861049_i32
  WINBIO_E_BAD_CAPTURE = -2146861048_i32
  WINBIO_E_INVALID_CONTROL_CODE = -2146861047_i32
  WINBIO_E_DATA_COLLECTION_IN_PROGRESS = -2146861045_i32
  WINBIO_E_UNSUPPORTED_DATA_FORMAT = -2146861044_i32
  WINBIO_E_UNSUPPORTED_DATA_TYPE = -2146861043_i32
  WINBIO_E_UNSUPPORTED_PURPOSE = -2146861042_i32
  WINBIO_E_INVALID_DEVICE_STATE = -2146861041_i32
  WINBIO_E_DEVICE_BUSY = -2146861040_i32
  WINBIO_E_DATABASE_CANT_CREATE = -2146861039_i32
  WINBIO_E_DATABASE_CANT_OPEN = -2146861038_i32
  WINBIO_E_DATABASE_CANT_CLOSE = -2146861037_i32
  WINBIO_E_DATABASE_CANT_ERASE = -2146861036_i32
  WINBIO_E_DATABASE_CANT_FIND = -2146861035_i32
  WINBIO_E_DATABASE_ALREADY_EXISTS = -2146861034_i32
  WINBIO_E_DATABASE_FULL = -2146861032_i32
  WINBIO_E_DATABASE_LOCKED = -2146861031_i32
  WINBIO_E_DATABASE_CORRUPTED = -2146861030_i32
  WINBIO_E_DATABASE_NO_SUCH_RECORD = -2146861029_i32
  WINBIO_E_DUPLICATE_ENROLLMENT = -2146861028_i32
  WINBIO_E_DATABASE_READ_ERROR = -2146861027_i32
  WINBIO_E_DATABASE_WRITE_ERROR = -2146861026_i32
  WINBIO_E_DATABASE_NO_RESULTS = -2146861025_i32
  WINBIO_E_DATABASE_NO_MORE_RECORDS = -2146861024_i32
  WINBIO_E_DATABASE_EOF = -2146861023_i32
  WINBIO_E_DATABASE_BAD_INDEX_VECTOR = -2146861022_i32
  WINBIO_E_INCORRECT_BSP = -2146861020_i32
  WINBIO_E_INCORRECT_SENSOR_POOL = -2146861019_i32
  WINBIO_E_NO_CAPTURE_DATA = -2146861018_i32
  WINBIO_E_INVALID_SENSOR_MODE = -2146861017_i32
  WINBIO_E_LOCK_VIOLATION = -2146861014_i32
  WINBIO_E_DUPLICATE_TEMPLATE = -2146861013_i32
  WINBIO_E_INVALID_OPERATION = -2146861012_i32
  WINBIO_E_SESSION_BUSY = -2146861011_i32
  WINBIO_E_CRED_PROV_DISABLED = -2146861008_i32
  WINBIO_E_CRED_PROV_NO_CREDENTIAL = -2146861007_i32
  WINBIO_E_DISABLED = -2146861006_i32
  WINBIO_E_CONFIGURATION_FAILURE = -2146861005_i32
  WINBIO_E_SENSOR_UNAVAILABLE = -2146861004_i32
  WINBIO_E_SAS_ENABLED = -2146861003_i32
  WINBIO_E_DEVICE_FAILURE = -2146861002_i32
  WINBIO_E_FAST_USER_SWITCH_DISABLED = -2146861001_i32
  WINBIO_E_NOT_ACTIVE_CONSOLE = -2146861000_i32
  WINBIO_E_EVENT_MONITOR_ACTIVE = -2146860999_i32
  WINBIO_E_INVALID_PROPERTY_TYPE = -2146860998_i32
  WINBIO_E_INVALID_PROPERTY_ID = -2146860997_i32
  WINBIO_E_UNSUPPORTED_PROPERTY = -2146860996_i32
  WINBIO_E_ADAPTER_INTEGRITY_FAILURE = -2146860995_i32
  WINBIO_E_INCORRECT_SESSION_TYPE = -2146860994_i32
  WINBIO_E_SESSION_HANDLE_CLOSED = -2146860993_i32
  WINBIO_E_DEADLOCK_DETECTED = -2146860992_i32
  WINBIO_E_NO_PREBOOT_IDENTITY = -2146860991_i32
  WINBIO_E_MAX_ERROR_COUNT_EXCEEDED = -2146860990_i32
  WINBIO_E_AUTO_LOGON_DISABLED = -2146860989_i32
  WINBIO_E_INVALID_TICKET = -2146860988_i32
  WINBIO_E_TICKET_QUOTA_EXCEEDED = -2146860987_i32
  WINBIO_E_DATA_PROTECTION_FAILURE = -2146860986_i32
  WINBIO_E_CRED_PROV_SECURITY_LOCKOUT = -2146860985_i32
  WINBIO_E_UNSUPPORTED_POOL_TYPE = -2146860984_i32
  WINBIO_E_SELECTION_REQUIRED = -2146860983_i32
  WINBIO_E_PRESENCE_MONITOR_ACTIVE = -2146860982_i32
  WINBIO_E_INVALID_SUBFACTOR = -2146860981_i32
  WINBIO_E_INVALID_CALIBRATION_FORMAT_ARRAY = -2146860980_i32
  WINBIO_E_NO_SUPPORTED_CALIBRATION_FORMAT = -2146860979_i32
  WINBIO_E_UNSUPPORTED_SENSOR_CALIBRATION_FORMAT = -2146860978_i32
  WINBIO_E_CALIBRATION_BUFFER_TOO_SMALL = -2146860977_i32
  WINBIO_E_CALIBRATION_BUFFER_TOO_LARGE = -2146860976_i32
  WINBIO_E_CALIBRATION_BUFFER_INVALID = -2146860975_i32
  WINBIO_E_INVALID_KEY_IDENTIFIER = -2146860974_i32
  WINBIO_E_KEY_CREATION_FAILED = -2146860973_i32
  WINBIO_E_KEY_IDENTIFIER_BUFFER_TOO_SMALL = -2146860972_i32
  WINBIO_E_PROPERTY_UNAVAILABLE = -2146860971_i32
  WINBIO_E_POLICY_PROTECTION_UNAVAILABLE = -2146860970_i32
  WINBIO_E_INSECURE_SENSOR = -2146860969_i32
  WINBIO_E_INVALID_BUFFER_ID = -2146860968_i32
  WINBIO_E_INVALID_BUFFER = -2146860967_i32
  WINBIO_E_TRUSTLET_INTEGRITY_FAIL = -2146860966_i32
  WINBIO_E_ENROLLMENT_CANCELED_BY_SUSPEND = -2146860965_i32
  WINBIO_I_MORE_DATA = 589825_i32
  WINBIO_I_EXTENDED_STATUS_INFORMATION = 589826_i32
  GUID_DEVINTERFACE_BIOMETRIC_READER = "e2b5183a-99ea-4cc3-ad6b-80ca8d715b80"
  IOCTL_BIOMETRIC_VENDOR = 4464640_u32
  WINBIO_WBDI_MAJOR_VERSION = 1_u32
  WINBIO_WBDI_MINOR_VERSION = 0_u32

  type WINIBIO_SENSOR_CONTEXT = Void
  type WINIBIO_ENGINE_CONTEXT = Void
  type WINIBIO_STORAGE_CONTEXT = Void

  alias PWINBIO_ASYNC_COMPLETION_CALLBACK = Proc(WINBIO_ASYNC_RESULT*, Void)
  alias PWINBIO_VERIFY_CALLBACK = Proc(Void*, HRESULT, UInt32, BOOLEAN, UInt32, Void)
  alias PWINBIO_IDENTIFY_CALLBACK = Proc(Void*, HRESULT, UInt32, WINBIO_IDENTITY*, UInt8, UInt32, Void)
  alias PWINBIO_LOCATE_SENSOR_CALLBACK = Proc(Void*, HRESULT, UInt32, Void)
  alias PWINBIO_ENROLL_CAPTURE_CALLBACK = Proc(Void*, HRESULT, UInt32, Void)
  alias PWINBIO_EVENT_CALLBACK = Proc(Void*, HRESULT, WINBIO_EVENT*, Void)
  alias PWINBIO_CAPTURE_CALLBACK = Proc(Void*, HRESULT, UInt32, WINBIO_BIR*, LibC::UINT_PTR, UInt32, Void)
  alias PIBIO_SENSOR_ATTACH_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_SENSOR_DETACH_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_SENSOR_CLEAR_CONTEXT_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_SENSOR_QUERY_STATUS_FN = Proc(WINBIO_PIPELINE*, UInt32*, HRESULT)
  alias PIBIO_SENSOR_RESET_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_SENSOR_SET_MODE_FN = Proc(WINBIO_PIPELINE*, UInt32, HRESULT)
  alias PIBIO_SENSOR_SET_INDICATOR_STATUS_FN = Proc(WINBIO_PIPELINE*, UInt32, HRESULT)
  alias PIBIO_SENSOR_GET_INDICATOR_STATUS_FN = Proc(WINBIO_PIPELINE*, UInt32*, HRESULT)
  alias PIBIO_SENSOR_START_CAPTURE_FN = Proc(WINBIO_PIPELINE*, UInt8, OVERLAPPED**, HRESULT)
  alias PIBIO_SENSOR_FINISH_CAPTURE_FN = Proc(WINBIO_PIPELINE*, UInt32*, HRESULT)
  alias PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN = Proc(WINBIO_PIPELINE*, WINBIO_BIR**, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_SENSOR_CANCEL_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN = Proc(WINBIO_PIPELINE*, UInt8, UInt8, UInt32*, HRESULT)
  alias PIBIO_SENSOR_CONTROL_UNIT_FN = Proc(WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UINT_PTR, UInt8*, LibC::UINT_PTR, LibC::UINT_PTR*, UInt32*, HRESULT)
  alias PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN = Proc(WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UINT_PTR, UInt8*, LibC::UINT_PTR, LibC::UINT_PTR*, UInt32*, HRESULT)
  alias PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN = Proc(WINBIO_PIPELINE*, UInt32, HRESULT)
  alias PIBIO_SENSOR_PIPELINE_INIT_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_SENSOR_PIPELINE_CLEANUP_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_SENSOR_ACTIVATE_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_SENSOR_DEACTIVATE_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN = Proc(WINBIO_PIPELINE*, WINBIO_EXTENDED_SENSOR_INFO*, LibC::UINT_PTR, HRESULT)
  alias PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN = Proc(WINBIO_PIPELINE*, Guid*, LibC::UINT_PTR, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN = Proc(WINBIO_PIPELINE*, Guid*, HRESULT)
  alias PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN = Proc(WINBIO_PIPELINE*, UInt8*, LibC::UINT_PTR, HRESULT)
  alias PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN = Proc(WINBIO_PIPELINE*, UInt8*, LibC::UINT_PTR, UInt8**, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN = Proc(WINBIO_PIPELINE*, Guid, UInt8*, LibC::UINT_PTR, UInt8**, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN = Proc(WINBIO_PIPELINE*, UInt8*, LibC::UINT_PTR, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_SENSOR_CONNECT_SECURE_FN = Proc(WINBIO_PIPELINE*, WINBIO_SECURE_CONNECTION_PARAMS*, WINBIO_SECURE_CONNECTION_DATA**, HRESULT)
  alias PIBIO_SENSOR_START_CAPTURE_EX_FN = Proc(WINBIO_PIPELINE*, UInt8, UInt8*, LibC::UINT_PTR, UInt8, OVERLAPPED**, HRESULT)
  alias PIBIO_SENSOR_START_NOTIFY_WAKE_FN = Proc(WINBIO_PIPELINE*, OVERLAPPED**, HRESULT)
  alias PIBIO_SENSOR_FINISH_NOTIFY_WAKE_FN = Proc(WINBIO_PIPELINE*, UInt32*, HRESULT)
  alias PWINBIO_QUERY_SENSOR_INTERFACE_FN = Proc(WINBIO_SENSOR_INTERFACE**, HRESULT)
  alias PIBIO_ENGINE_ATTACH_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_ENGINE_DETACH_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_ENGINE_CLEAR_CONTEXT_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN = Proc(WINBIO_PIPELINE*, WINBIO_REGISTERED_FORMAT*, Guid*, HRESULT)
  alias PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN = Proc(WINBIO_PIPELINE*, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN = Proc(WINBIO_PIPELINE*, LibC::UINT_PTR*, LibC::UINT_PTR*, UInt8**, HRESULT)
  alias PIBIO_ENGINE_SET_HASH_ALGORITHM_FN = Proc(WINBIO_PIPELINE*, LibC::UINT_PTR, UInt8*, HRESULT)
  alias PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN = Proc(WINBIO_PIPELINE*, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN = Proc(WINBIO_PIPELINE*, WINBIO_BIR*, LibC::UINT_PTR, UInt8, UInt32*, HRESULT)
  alias PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN = Proc(WINBIO_PIPELINE*, UInt8, WINBIO_BIR**, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_ENGINE_VERIFY_FEATURE_SET_FN = Proc(WINBIO_PIPELINE*, WINBIO_IDENTITY*, UInt8, BOOLEAN*, UInt8**, LibC::UINT_PTR*, UInt8**, LibC::UINT_PTR*, UInt32*, HRESULT)
  alias PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN = Proc(WINBIO_PIPELINE*, WINBIO_IDENTITY*, UInt8*, UInt8**, LibC::UINT_PTR*, UInt8**, LibC::UINT_PTR*, UInt32*, HRESULT)
  alias PIBIO_ENGINE_CREATE_ENROLLMENT_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_ENGINE_UPDATE_ENROLLMENT_FN = Proc(WINBIO_PIPELINE*, UInt32*, HRESULT)
  alias PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN = Proc(WINBIO_PIPELINE*, UInt32*, HRESULT)
  alias PIBIO_ENGINE_GET_ENROLLMENT_HASH_FN = Proc(WINBIO_PIPELINE*, UInt8**, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN = Proc(WINBIO_PIPELINE*, WINBIO_IDENTITY*, UInt8*, BOOLEAN*, HRESULT)
  alias PIBIO_ENGINE_COMMIT_ENROLLMENT_FN = Proc(WINBIO_PIPELINE*, WINBIO_IDENTITY*, UInt8, UInt8*, LibC::UINT_PTR, HRESULT)
  alias PIBIO_ENGINE_DISCARD_ENROLLMENT_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_ENGINE_CONTROL_UNIT_FN = Proc(WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UINT_PTR, UInt8*, LibC::UINT_PTR, LibC::UINT_PTR*, UInt32*, HRESULT)
  alias PIBIO_ENGINE_CONTROL_UNIT_PRIVILEGED_FN = Proc(WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UINT_PTR, UInt8*, LibC::UINT_PTR, LibC::UINT_PTR*, UInt32*, HRESULT)
  alias PIBIO_ENGINE_NOTIFY_POWER_CHANGE_FN = Proc(WINBIO_PIPELINE*, UInt32, HRESULT)
  alias PIBIO_ENGINE_RESERVED_1_FN = Proc(WINBIO_PIPELINE*, WINBIO_IDENTITY*, HRESULT)
  alias PIBIO_ENGINE_PIPELINE_INIT_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_ENGINE_PIPELINE_CLEANUP_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_ENGINE_ACTIVATE_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_ENGINE_DEACTIVATE_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_ENGINE_QUERY_EXTENDED_INFO_FN = Proc(WINBIO_PIPELINE*, WINBIO_EXTENDED_ENGINE_INFO*, LibC::UINT_PTR, HRESULT)
  alias PIBIO_ENGINE_IDENTIFY_ALL_FN = Proc(WINBIO_PIPELINE*, LibC::UINT_PTR*, WINBIO_PRESENCE**, HRESULT)
  alias PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN = Proc(WINBIO_PIPELINE*, UInt64, HRESULT)
  alias PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN = Proc(WINBIO_PIPELINE*, WINBIO_EXTENDED_ENROLLMENT_PARAMETERS*, HRESULT)
  alias PIBIO_ENGINE_QUERY_EXTENDED_ENROLLMENT_STATUS_FN = Proc(WINBIO_PIPELINE*, WINBIO_EXTENDED_ENROLLMENT_STATUS*, LibC::UINT_PTR, HRESULT)
  alias PIBIO_ENGINE_REFRESH_CACHE_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN = Proc(WINBIO_PIPELINE*, Guid*, LibC::UINT_PTR, Guid*, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN = Proc(WINBIO_PIPELINE*, BOOLEAN*, UInt8*, LibC::UINT_PTR*, LibC::UINT_PTR, HRESULT)
  alias PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN = Proc(WINBIO_PIPELINE*, WINBIO_ACCOUNT_POLICY*, LibC::UINT_PTR, HRESULT)
  alias PIBIO_ENGINE_CREATE_KEY_FN = Proc(WINBIO_PIPELINE*, UInt8*, LibC::UINT_PTR, UInt8*, LibC::UINT_PTR, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN = Proc(WINBIO_PIPELINE*, UInt8*, LibC::UINT_PTR, UInt8*, LibC::UINT_PTR, WINBIO_IDENTITY*, UInt8*, UInt32*, UInt8**, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN = Proc(WINBIO_PIPELINE*, UInt8*, LibC::UINT_PTR, HRESULT)
  alias PIBIO_ENGINE_CREATE_ENROLLMENT_AUTHENTICATED_FN = Proc(WINBIO_PIPELINE*, UInt8**, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN = Proc(WINBIO_PIPELINE*, UInt8*, LibC::UINT_PTR, WINBIO_IDENTITY*, UInt8*, UInt32*, UInt8**, LibC::UINT_PTR*, HRESULT)
  alias PWINBIO_QUERY_ENGINE_INTERFACE_FN = Proc(WINBIO_ENGINE_INTERFACE**, HRESULT)
  alias PIBIO_STORAGE_ATTACH_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_STORAGE_DETACH_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_STORAGE_CLEAR_CONTEXT_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_STORAGE_CREATE_DATABASE_FN = Proc(WINBIO_PIPELINE*, Guid*, UInt32, Guid*, LibC::LPWSTR, LibC::LPWSTR, LibC::UINT_PTR, LibC::UINT_PTR, HRESULT)
  alias PIBIO_STORAGE_ERASE_DATABASE_FN = Proc(WINBIO_PIPELINE*, Guid*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  alias PIBIO_STORAGE_OPEN_DATABASE_FN = Proc(WINBIO_PIPELINE*, Guid*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  alias PIBIO_STORAGE_CLOSE_DATABASE_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_STORAGE_GET_DATA_FORMAT_FN = Proc(WINBIO_PIPELINE*, Guid*, WINBIO_VERSION*, HRESULT)
  alias PIBIO_STORAGE_GET_DATABASE_SIZE_FN = Proc(WINBIO_PIPELINE*, LibC::UINT_PTR*, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_STORAGE_ADD_RECORD_FN = Proc(WINBIO_PIPELINE*, WINBIO_STORAGE_RECORD*, HRESULT)
  alias PIBIO_STORAGE_DELETE_RECORD_FN = Proc(WINBIO_PIPELINE*, WINBIO_IDENTITY*, UInt8, HRESULT)
  alias PIBIO_STORAGE_QUERY_BY_SUBJECT_FN = Proc(WINBIO_PIPELINE*, WINBIO_IDENTITY*, UInt8, HRESULT)
  alias PIBIO_STORAGE_QUERY_BY_CONTENT_FN = Proc(WINBIO_PIPELINE*, UInt8, UInt32*, LibC::UINT_PTR, HRESULT)
  alias PIBIO_STORAGE_GET_RECORD_COUNT_FN = Proc(WINBIO_PIPELINE*, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_STORAGE_FIRST_RECORD_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_STORAGE_NEXT_RECORD_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_STORAGE_GET_CURRENT_RECORD_FN = Proc(WINBIO_PIPELINE*, WINBIO_STORAGE_RECORD*, HRESULT)
  alias PIBIO_STORAGE_CONTROL_UNIT_FN = Proc(WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UINT_PTR, UInt8*, LibC::UINT_PTR, LibC::UINT_PTR*, UInt32*, HRESULT)
  alias PIBIO_STORAGE_CONTROL_UNIT_PRIVILEGED_FN = Proc(WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UINT_PTR, UInt8*, LibC::UINT_PTR, LibC::UINT_PTR*, UInt32*, HRESULT)
  alias PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN = Proc(WINBIO_PIPELINE*, UInt32, HRESULT)
  alias PIBIO_STORAGE_PIPELINE_INIT_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_STORAGE_PIPELINE_CLEANUP_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_STORAGE_ACTIVATE_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_STORAGE_DEACTIVATE_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN = Proc(WINBIO_PIPELINE*, WINBIO_EXTENDED_STORAGE_INFO*, LibC::UINT_PTR, HRESULT)
  alias PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN = Proc(WINBIO_PIPELINE*, BOOLEAN, HRESULT)
  alias PIBIO_STORAGE_RESERVED_1_FN = Proc(WINBIO_PIPELINE*, WINBIO_IDENTITY*, UInt64*, UInt64*, HRESULT)
  alias PIBIO_STORAGE_RESERVED_2_FN = Proc(WINBIO_PIPELINE*, WINBIO_IDENTITY*, HRESULT)
  alias PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN = Proc(WINBIO_PIPELINE*, WINBIO_IDENTITY*, UInt8, WINBIO_STORAGE_RECORD*, HRESULT)
  alias PIBIO_STORAGE_UPDATE_RECORD_COMMIT_FN = Proc(WINBIO_PIPELINE*, WINBIO_STORAGE_RECORD*, HRESULT)
  alias PWINBIO_QUERY_STORAGE_INTERFACE_FN = Proc(WINBIO_STORAGE_INTERFACE**, HRESULT)
  alias PIBIO_FRAMEWORK_SET_UNIT_STATUS_FN = Proc(WINBIO_PIPELINE*, WINBIO_EXTENDED_UNIT_STATUS*, LibC::UINT_PTR, HRESULT)
  alias PIBIO_FRAMEWORK_VSM_CACHE_CLEAR_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_BEGIN_FN = Proc(WINBIO_PIPELINE*, LibC::UINT_PTR, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_NEXT_FN = Proc(WINBIO_PIPELINE*, UInt8*, LibC::UINT_PTR, HRESULT)
  alias PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_END_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_BEGIN_FN = Proc(WINBIO_PIPELINE*, LibC::UINT_PTR*, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_NEXT_FN = Proc(WINBIO_PIPELINE*, UInt8*, LibC::UINT_PTR, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_END_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_1_FN = Proc(WINBIO_PIPELINE*, LibC::UINT_PTR, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_2_FN = Proc(WINBIO_PIPELINE*, UInt8*, LibC::UINT_PTR, HRESULT)
  alias PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_3_FN = Proc(WINBIO_PIPELINE*, HRESULT)
  alias PIBIO_FRAMEWORK_ALLOCATE_MEMORY_FN = Proc(WINBIO_PIPELINE*, LibC::UINT_PTR, Void**, HRESULT)
  alias PIBIO_FRAMEWORK_FREE_MEMORY_FN = Proc(WINBIO_PIPELINE*, Void*, HRESULT)
  alias PIBIO_FRAMEWORK_GET_PROPERTY_FN = Proc(WINBIO_PIPELINE*, UInt32, UInt32, WINBIO_IDENTITY*, UInt8, Void**, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_FRAMEWORK_LOCK_AND_VALIDATE_SECURE_BUFFER_FN = Proc(WINBIO_PIPELINE*, Guid, Void**, LibC::UINT_PTR*, HRESULT)
  alias PIBIO_FRAMEWORK_RELEASE_SECURE_BUFFER_FN = Proc(WINBIO_PIPELINE*, Guid, HRESULT)
  alias PIBIO_FRAMEWORK_VSM_QUERY_AUTHORIZED_ENROLLMENTS_FN = Proc(WINBIO_PIPELINE*, WINBIO_IDENTITY*, LibC::UINT_PTR*, WINBIO_IDENTITY**, HRESULT)
  alias PIBIO_FRAMEWORK_VSM_DECRYPT_SAMPLE_FN = Proc(WINBIO_PIPELINE*, UInt8*, LibC::UINT_PTR, UInt8*, LibC::UINT_PTR, UInt8*, LibC::UINT_PTR, HRESULT)


  enum WINBIO_SETTING_SOURCE : UInt32
    WINBIO_SETTING_SOURCE_INVALID = 0
    WINBIO_SETTING_SOURCE_DEFAULT = 1
    WINBIO_SETTING_SOURCE_LOCAL = 3
    WINBIO_SETTING_SOURCE_POLICY = 2
  end

  enum WINBIO_COMPONENT : UInt32
    WINBIO_COMPONENT_SENSOR = 1
    WINBIO_COMPONENT_ENGINE = 2
    WINBIO_COMPONENT_STORAGE = 3
  end

  enum WINBIO_POOL : UInt32
    WINBIO_POOL_SYSTEM = 1
    WINBIO_POOL_PRIVATE = 2
  end

  enum WINBIO_ANTI_SPOOF_POLICY_ACTION : Int32
    WINBIO_ANTI_SPOOF_DISABLE = 0
    WINBIO_ANTI_SPOOF_ENABLE = 1
    WINBIO_ANTI_SPOOF_REMOVE = 2
  end

  enum WINBIO_POLICY_SOURCE : Int32
    WINBIO_POLICY_UNKNOWN = 0
    WINBIO_POLICY_DEFAULT = 1
    WINBIO_POLICY_LOCAL = 2
    WINBIO_POLICY_ADMIN = 3
  end

  enum WINBIO_CREDENTIAL_TYPE : Int32
    WINBIO_CREDENTIAL_PASSWORD = 1
    WINBIO_CREDENTIAL_ALL = -1
  end

  enum WINBIO_CREDENTIAL_FORMAT : Int32
    WINBIO_PASSWORD_GENERIC = 1
    WINBIO_PASSWORD_PACKED = 2
    WINBIO_PASSWORD_PROTECTED = 3
  end

  enum WINBIO_CREDENTIAL_STATE : Int32
    WINBIO_CREDENTIAL_NOT_SET = 1
    WINBIO_CREDENTIAL_SET = 2
  end

  enum WINBIO_ASYNC_NOTIFICATION_METHOD : Int32
    WINBIO_ASYNC_NOTIFY_NONE = 0
    WINBIO_ASYNC_NOTIFY_CALLBACK = 1
    WINBIO_ASYNC_NOTIFY_MESSAGE = 2
    WINBIO_ASYNC_NOTIFY_MAXIMUM_VALUE = 3
  end

union WINBIO_IDENTITY_Value_e__Union
  null : UInt32
  wildcard : UInt32
  template_guid : Guid
  account_sid : WINBIO_IDENTITY_Value_e__Union_AccountSid_e__Struct
  secure_id : UInt8[32]*
end
union WINBIO_EVENT_Parameters_e__Union
  unclaimed : WINBIO_EVENT_Parameters_e__Union_Unclaimed_e__Struct
  unclaimed_identify : WINBIO_EVENT_Parameters_e__Union_UnclaimedIdentify_e__Struct
  error : WINBIO_EVENT_Parameters_e__Union_Error_e__Struct
end
union WINBIO_PRESENCE_PROPERTIES
  facial_features : WINBIO_PRESENCE_PROPERTIES_FacialFeatures_e__Struct
  iris : WINBIO_PRESENCE_PROPERTIES_Iris_e__Struct
end
union WINBIO_EXTENDED_SENSOR_INFO_Specific_e__Union
  null : UInt32
  facial_features : WINBIO_EXTENDED_SENSOR_INFO_Specific_e__Union_FacialFeatures_e__Struct
  fingerprint : WINBIO_EXTENDED_SENSOR_INFO_Specific_e__Union_Fingerprint_e__Struct
  iris : WINBIO_EXTENDED_SENSOR_INFO_Specific_e__Union_Iris_e__Struct
  voice : WINBIO_EXTENDED_SENSOR_INFO_Specific_e__Union_Voice_e__Struct
end
union WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union
  null : UInt32
  facial_features : WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union_FacialFeatures_e__Struct
  fingerprint : WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union_Fingerprint_e__Struct
  iris : WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union_Iris_e__Struct
  voice : WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union_Voice_e__Struct
end
union WINBIO_EXTENDED_STORAGE_INFO_Specific_e__Union
  null : UInt32
  facial_features : WINBIO_EXTENDED_STORAGE_INFO_Specific_e__Union_FacialFeatures_e__Struct
  fingerprint : WINBIO_EXTENDED_STORAGE_INFO_Specific_e__Union_Fingerprint_e__Struct
  iris : WINBIO_EXTENDED_STORAGE_INFO_Specific_e__Union_Iris_e__Struct
  voice : WINBIO_EXTENDED_STORAGE_INFO_Specific_e__Union_Voice_e__Struct
end
union WINBIO_EXTENDED_ENROLLMENT_STATUS_Specific_e__Union
  null : UInt32
  facial_features : WINBIO_EXTENDED_ENROLLMENT_STATUS_Specific_e__Union_FacialFeatures_e__Struct
  fingerprint : WINBIO_EXTENDED_ENROLLMENT_STATUS_Specific_e__Union_Fingerprint_e__Struct
  iris : WINBIO_EXTENDED_ENROLLMENT_STATUS_Specific_e__Union_Iris_e__Struct
  voice : WINBIO_EXTENDED_ENROLLMENT_STATUS_Specific_e__Union_Voice_e__Struct
end
union WINBIO_ASYNC_RESULT_Parameters_e__Union
  verify : WINBIO_ASYNC_RESULT_Parameters_e__Union_Verify_e__Struct
  identify : WINBIO_ASYNC_RESULT_Parameters_e__Union_Identify_e__Struct
  enroll_begin : WINBIO_ASYNC_RESULT_Parameters_e__Union_EnrollBegin_e__Struct
  enroll_capture : WINBIO_ASYNC_RESULT_Parameters_e__Union_EnrollCapture_e__Struct
  enroll_commit : WINBIO_ASYNC_RESULT_Parameters_e__Union_EnrollCommit_e__Struct
  enum_enrollments : WINBIO_ASYNC_RESULT_Parameters_e__Union_EnumEnrollments_e__Struct
  capture_sample : WINBIO_ASYNC_RESULT_Parameters_e__Union_CaptureSample_e__Struct
  delete_template : WINBIO_ASYNC_RESULT_Parameters_e__Union_DeleteTemplate_e__Struct
  get_property : WINBIO_ASYNC_RESULT_Parameters_e__Union_GetProperty_e__Struct
  set_property : WINBIO_ASYNC_RESULT_Parameters_e__Union_SetProperty_e__Struct
  get_event : WINBIO_ASYNC_RESULT_Parameters_e__Union_GetEvent_e__Struct
  control_unit : WINBIO_ASYNC_RESULT_Parameters_e__Union_ControlUnit_e__Struct
  enum_service_providers : WINBIO_ASYNC_RESULT_Parameters_e__Union_EnumServiceProviders_e__Struct
  enum_biometric_units : WINBIO_ASYNC_RESULT_Parameters_e__Union_EnumBiometricUnits_e__Struct
  enum_databases : WINBIO_ASYNC_RESULT_Parameters_e__Union_EnumDatabases_e__Struct
  verify_and_release_ticket : WINBIO_ASYNC_RESULT_Parameters_e__Union_VerifyAndReleaseTicket_e__Struct
  identify_and_release_ticket : WINBIO_ASYNC_RESULT_Parameters_e__Union_IdentifyAndReleaseTicket_e__Struct
  enroll_select : WINBIO_ASYNC_RESULT_Parameters_e__Union_EnrollSelect_e__Struct
  monitor_presence : WINBIO_ASYNC_RESULT_Parameters_e__Union_MonitorPresence_e__Struct
  get_protection_policy : WINBIO_ASYNC_RESULT_Parameters_e__Union_GetProtectionPolicy_e__Struct
  notify_unit_status_change : WINBIO_ASYNC_RESULT_Parameters_e__Union_NotifyUnitStatusChange_e__Struct
end

  struct WINBIO_VERSION
    major_version : UInt32
    minor_version : UInt32
  end
  struct WINBIO_IDENTITY
    type : UInt32
    value : WINBIO_IDENTITY_Value_e__Union
  end
  struct WINBIO_IDENTITY_Value_e__Union_AccountSid_e__Struct
    size : UInt32
    data : UInt8[68]*
  end
  struct WINBIO_SECURE_CONNECTION_PARAMS
    payload_size : UInt32
    version : UInt16
    flags : UInt16
  end
  struct WINBIO_SECURE_CONNECTION_DATA
    size : UInt32
    version : UInt16
    flags : UInt16
    model_certificate_size : UInt32
    intermediate_ca1_size : UInt32
    intermediate_ca2_size : UInt32
  end
  struct WINBIO_BIR_DATA
    size : UInt32
    offset : UInt32
  end
  struct WINBIO_BIR
    header_block : WINBIO_BIR_DATA
    standard_data_block : WINBIO_BIR_DATA
    vendor_data_block : WINBIO_BIR_DATA
    signature_block : WINBIO_BIR_DATA
  end
  struct WINBIO_REGISTERED_FORMAT
    owner : UInt16
    type : UInt16
  end
  struct WINBIO_BIR_HEADER
    valid_fields : UInt16
    header_version : UInt8
    patron_header_version : UInt8
    data_flags : UInt8
    type : UInt32
    subtype : UInt8
    purpose : UInt8
    data_quality : Int8
    creation_date : LARGE_INTEGER
    validity_period : WINBIO_BIR_HEADER_ValidityPeriod_e__Struct
    biometric_data_format : WINBIO_REGISTERED_FORMAT
    product_id : WINBIO_REGISTERED_FORMAT
  end
  struct WINBIO_BIR_HEADER_ValidityPeriod_e__Struct
    begin_date : LARGE_INTEGER
    end_date : LARGE_INTEGER
  end
  struct WINBIO_BDB_ANSI_381_HEADER
    record_length : UInt64
    format_identifier : UInt32
    version_number : UInt32
    product_id : WINBIO_REGISTERED_FORMAT
    capture_device_id : UInt16
    image_acquisition_level : UInt16
    horizontal_scan_resolution : UInt16
    vertical_scan_resolution : UInt16
    horizontal_image_resolution : UInt16
    vertical_image_resolution : UInt16
    element_count : UInt8
    scale_units : UInt8
    pixel_depth : UInt8
    image_compression_alg : UInt8
    reserved : UInt16
  end
  struct WINBIO_BDB_ANSI_381_RECORD
    block_length : UInt32
    horizontal_line_length : UInt16
    vertical_line_length : UInt16
    position : UInt8
    count_of_views : UInt8
    view_number : UInt8
    image_quality : UInt8
    impression_type : UInt8
    reserved : UInt8
  end
  struct WINBIO_SECURE_BUFFER_HEADER_V1
    type : UInt32
    size : UInt32
    flags : UInt32
    validation_tag : UInt64
  end
  struct WINBIO_EVENT
    type : UInt32
    parameters : WINBIO_EVENT_Parameters_e__Union
  end
  struct WINBIO_EVENT_Parameters_e__Union_UnclaimedIdentify_e__Struct
    unit_id : UInt32
    identity : WINBIO_IDENTITY
    sub_factor : UInt8
    reject_detail : UInt32
  end
  struct WINBIO_EVENT_Parameters_e__Union_Unclaimed_e__Struct
    unit_id : UInt32
    reject_detail : UInt32
  end
  struct WINBIO_EVENT_Parameters_e__Union_Error_e__Struct
    error_code : HRESULT
  end
  struct WINBIO_PRESENCE_PROPERTIES_Iris_e__Struct
    eye_bounding_box_1 : RECT
    eye_bounding_box_2 : RECT
    pupil_center_1 : POINT
    pupil_center_2 : POINT
    distance : Int32
  end
  struct WINBIO_PRESENCE_PROPERTIES_FacialFeatures_e__Struct
    bounding_box : RECT
    distance : Int32
    opaque_engine_data : WINBIO_PRESENCE_PROPERTIES_FacialFeatures_e__Struct_OpaqueEngineData_e__Struct
  end
  struct WINBIO_PRESENCE_PROPERTIES_FacialFeatures_e__Struct_OpaqueEngineData_e__Struct
    adapter_id : Guid
    data : UInt32[78]*
  end
  struct WINBIO_PRESENCE
    factor : UInt32
    sub_factor : UInt8
    status : HRESULT
    reject_detail : UInt32
    identity : WINBIO_IDENTITY
    tracking_id : UInt64
    ticket : UInt64
    properties : WINBIO_PRESENCE_PROPERTIES
    authorization : WINBIO_PRESENCE_Authorization_e__Struct
  end
  struct WINBIO_PRESENCE_Authorization_e__Struct
    size : UInt32
    data : UInt8[32]*
  end
  struct WINBIO_BSP_SCHEMA
    biometric_factor : UInt32
    bsp_id : Guid
    description : UInt16[256]*
    vendor : UInt16[256]*
    version : WINBIO_VERSION
  end
  struct WINBIO_UNIT_SCHEMA
    unit_id : UInt32
    pool_type : UInt32
    biometric_factor : UInt32
    sensor_sub_type : UInt32
    capabilities : UInt32
    device_instance_id : UInt16[256]*
    description : UInt16[256]*
    manufacturer : UInt16[256]*
    model : UInt16[256]*
    serial_number : UInt16[256]*
    firmware_version : WINBIO_VERSION
  end
  struct WINBIO_STORAGE_SCHEMA
    biometric_factor : UInt32
    database_id : Guid
    data_format : Guid
    attributes : UInt32
    file_path : UInt16[256]*
    connection_string : UInt16[256]*
  end
  struct WINBIO_EXTENDED_SENSOR_INFO
    generic_sensor_capabilities : UInt32
    factor : UInt32
    specific : WINBIO_EXTENDED_SENSOR_INFO_Specific_e__Union
  end
  struct WINBIO_EXTENDED_SENSOR_INFO_Specific_e__Union_Iris_e__Struct
    frame_size : RECT
    frame_offset : POINT
    mandatory_orientation : UInt32
  end
  struct WINBIO_EXTENDED_SENSOR_INFO_Specific_e__Union_FacialFeatures_e__Struct
    frame_size : RECT
    frame_offset : POINT
    mandatory_orientation : UInt32
    hardware_info : WINBIO_EXTENDED_SENSOR_INFO_Specific_e__Union_FacialFeatures_e__Struct_HardwareInfo_e__Struct
  end
  struct WINBIO_EXTENDED_SENSOR_INFO_Specific_e__Union_FacialFeatures_e__Struct_HardwareInfo_e__Struct
    color_sensor_id : Char[260]*
    infrared_sensor_id : Char[260]*
    infrared_sensor_rotation_angle : UInt32
  end
  struct WINBIO_EXTENDED_SENSOR_INFO_Specific_e__Union_Fingerprint_e__Struct
    reserved : UInt32
  end
  struct WINBIO_EXTENDED_SENSOR_INFO_Specific_e__Union_Voice_e__Struct
    reserved : UInt32
  end
  struct WINBIO_EXTENDED_ENGINE_INFO
    generic_engine_capabilities : UInt32
    factor : UInt32
    specific : WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union
  end
  struct WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union_Voice_e__Struct
    capabilities : UInt32
    enrollment_requirements : WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union_Voice_e__Struct_EnrollmentRequirements_e__Struct
  end
  struct WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union_Voice_e__Struct_EnrollmentRequirements_e__Struct
    null : UInt32
  end
  struct WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union_Iris_e__Struct
    capabilities : UInt32
    enrollment_requirements : WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union_Iris_e__Struct_EnrollmentRequirements_e__Struct
  end
  struct WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union_Iris_e__Struct_EnrollmentRequirements_e__Struct
    null : UInt32
  end
  struct WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union_Fingerprint_e__Struct
    capabilities : UInt32
    enrollment_requirements : WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union_Fingerprint_e__Struct_EnrollmentRequirements_e__Struct
  end
  struct WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union_Fingerprint_e__Struct_EnrollmentRequirements_e__Struct
    general_samples : UInt32
    center : UInt32
    top_edge : UInt32
    bottom_edge : UInt32
    left_edge : UInt32
    right_edge : UInt32
  end
  struct WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union_FacialFeatures_e__Struct
    capabilities : UInt32
    enrollment_requirements : WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union_FacialFeatures_e__Struct_EnrollmentRequirements_e__Struct
  end
  struct WINBIO_EXTENDED_ENGINE_INFO_Specific_e__Union_FacialFeatures_e__Struct_EnrollmentRequirements_e__Struct
    null : UInt32
  end
  struct WINBIO_EXTENDED_STORAGE_INFO
    generic_storage_capabilities : UInt32
    factor : UInt32
    specific : WINBIO_EXTENDED_STORAGE_INFO_Specific_e__Union
  end
  struct WINBIO_EXTENDED_STORAGE_INFO_Specific_e__Union_Iris_e__Struct
    capabilities : UInt32
  end
  struct WINBIO_EXTENDED_STORAGE_INFO_Specific_e__Union_FacialFeatures_e__Struct
    capabilities : UInt32
  end
  struct WINBIO_EXTENDED_STORAGE_INFO_Specific_e__Union_Fingerprint_e__Struct
    capabilities : UInt32
  end
  struct WINBIO_EXTENDED_STORAGE_INFO_Specific_e__Union_Voice_e__Struct
    capabilities : UInt32
  end
  struct WINBIO_EXTENDED_ENROLLMENT_STATUS
    template_status : HRESULT
    reject_detail : UInt32
    percent_complete : UInt32
    factor : UInt32
    sub_factor : UInt8
    specific : WINBIO_EXTENDED_ENROLLMENT_STATUS_Specific_e__Union
  end
  struct WINBIO_EXTENDED_ENROLLMENT_STATUS_Specific_e__Union_Voice_e__Struct
    reserved : UInt32
  end
  struct WINBIO_EXTENDED_ENROLLMENT_STATUS_Specific_e__Union_Iris_e__Struct
    eye_bounding_box_1 : RECT
    eye_bounding_box_2 : RECT
    pupil_center_1 : POINT
    pupil_center_2 : POINT
    distance : Int32
    grid_point_completion_percent : UInt32
    grid_point_index : UInt16
    point3_d : WINBIO_EXTENDED_ENROLLMENT_STATUS_Specific_e__Union_Iris_e__Struct_Point3D_e__Struct
    stop_capture_and_show_critical_feedback : LibC::BOOL
  end
  struct WINBIO_EXTENDED_ENROLLMENT_STATUS_Specific_e__Union_Iris_e__Struct_Point3D_e__Struct
    x : Float64
    y : Float64
    z : Float64
  end
  struct WINBIO_EXTENDED_ENROLLMENT_STATUS_Specific_e__Union_FacialFeatures_e__Struct
    bounding_box : RECT
    distance : Int32
    opaque_engine_data : WINBIO_EXTENDED_ENROLLMENT_STATUS_Specific_e__Union_FacialFeatures_e__Struct_OpaqueEngineData_e__Struct
  end
  struct WINBIO_EXTENDED_ENROLLMENT_STATUS_Specific_e__Union_FacialFeatures_e__Struct_OpaqueEngineData_e__Struct
    adapter_id : Guid
    data : UInt32[78]*
  end
  struct WINBIO_EXTENDED_ENROLLMENT_STATUS_Specific_e__Union_Fingerprint_e__Struct
    general_samples : UInt32
    center : UInt32
    top_edge : UInt32
    bottom_edge : UInt32
    left_edge : UInt32
    right_edge : UInt32
  end
  struct WINBIO_EXTENDED_UNIT_STATUS
    availability : UInt32
    reason_code : UInt32
  end
  struct WINBIO_FP_BU_STATE
    sensor_attached : LibC::BOOL
    creation_result : HRESULT
  end
  struct WINBIO_ANTI_SPOOF_POLICY
    action : WINBIO_ANTI_SPOOF_POLICY_ACTION
    source : WINBIO_POLICY_SOURCE
  end
  struct WINBIO_EXTENDED_ENROLLMENT_PARAMETERS
    size : LibC::UINT_PTR
    sub_factor : UInt8
  end
  struct WINBIO_ACCOUNT_POLICY
    identity : WINBIO_IDENTITY
    anti_spoof_behavior : WINBIO_ANTI_SPOOF_POLICY_ACTION
  end
  struct WINBIO_PROTECTION_POLICY
    version : UInt32
    identity : WINBIO_IDENTITY
    database_id : Guid
    user_state : UInt64
    policy_size : LibC::UINT_PTR
    policy : UInt8[128]*
  end
  struct WINBIO_GESTURE_METADATA
    size : LibC::UINT_PTR
    biometric_type : UInt32
    match_type : UInt32
    protection_type : UInt32
  end
  struct WINBIO_ASYNC_RESULT
    session_handle : UInt32
    operation : UInt32
    sequence_number : UInt64
    time_stamp : Int64
    api_status : HRESULT
    unit_id : UInt32
    user_data : Void*
    parameters : WINBIO_ASYNC_RESULT_Parameters_e__Union
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_GetProtectionPolicy_e__Struct
    identity : WINBIO_IDENTITY
    policy : WINBIO_PROTECTION_POLICY
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_EnrollSelect_e__Struct
    selector_value : UInt64
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_VerifyAndReleaseTicket_e__Struct
    match : BOOLEAN
    reject_detail : UInt32
    ticket : UInt64
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_EnumBiometricUnits_e__Struct
    unit_count : LibC::UINT_PTR
    unit_schema_array : WINBIO_UNIT_SCHEMA*
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_ControlUnit_e__Struct
    component : WINBIO_COMPONENT
    control_code : UInt32
    operation_status : UInt32
    send_buffer : UInt8*
    send_buffer_size : LibC::UINT_PTR
    receive_buffer : UInt8*
    receive_buffer_size : LibC::UINT_PTR
    receive_data_size : LibC::UINT_PTR
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_SetProperty_e__Struct
    property_type : UInt32
    property_id : UInt32
    identity : WINBIO_IDENTITY
    sub_factor : UInt8
    property_buffer_size : LibC::UINT_PTR
    property_buffer : Void*
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_DeleteTemplate_e__Struct
    identity : WINBIO_IDENTITY
    sub_factor : UInt8
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_EnumEnrollments_e__Struct
    identity : WINBIO_IDENTITY
    sub_factor_count : LibC::UINT_PTR
    sub_factor_array : UInt8*
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_EnrollCapture_e__Struct
    reject_detail : UInt32
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_Identify_e__Struct
    identity : WINBIO_IDENTITY
    sub_factor : UInt8
    reject_detail : UInt32
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_MonitorPresence_e__Struct
    change_type : UInt32
    presence_count : LibC::UINT_PTR
    presence_array : WINBIO_PRESENCE*
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_EnumDatabases_e__Struct
    storage_count : LibC::UINT_PTR
    storage_schema_array : WINBIO_STORAGE_SCHEMA*
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_GetEvent_e__Struct
    event : WINBIO_EVENT
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_CaptureSample_e__Struct
    sample : WINBIO_BIR*
    sample_size : LibC::UINT_PTR
    reject_detail : UInt32
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_EnrollBegin_e__Struct
    sub_factor : UInt8
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_NotifyUnitStatusChange_e__Struct
    extended_status : WINBIO_EXTENDED_UNIT_STATUS
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_EnumServiceProviders_e__Struct
    bsp_count : LibC::UINT_PTR
    bsp_schema_array : WINBIO_BSP_SCHEMA*
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_EnrollCommit_e__Struct
    identity : WINBIO_IDENTITY
    is_new_template : BOOLEAN
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_GetProperty_e__Struct
    property_type : UInt32
    property_id : UInt32
    identity : WINBIO_IDENTITY
    sub_factor : UInt8
    property_buffer_size : LibC::UINT_PTR
    property_buffer : Void*
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_IdentifyAndReleaseTicket_e__Struct
    identity : WINBIO_IDENTITY
    sub_factor : UInt8
    reject_detail : UInt32
    ticket : UInt64
  end
  struct WINBIO_ASYNC_RESULT_Parameters_e__Union_Verify_e__Struct
    match : BOOLEAN
    reject_detail : UInt32
  end
  struct WINBIO_STORAGE_RECORD
    identity : WINBIO_IDENTITY*
    sub_factor : UInt8
    index_vector : UInt32*
    index_element_count : LibC::UINT_PTR
    template_blob : UInt8*
    template_blob_size : LibC::UINT_PTR
    payload_blob : UInt8*
    payload_blob_size : LibC::UINT_PTR
  end
  struct WINBIO_PIPELINE
    sensor_handle : LibC::HANDLE
    engine_handle : LibC::HANDLE
    storage_handle : LibC::HANDLE
    sensor_interface : WINBIO_SENSOR_INTERFACE*
    engine_interface : WINBIO_ENGINE_INTERFACE*
    storage_interface : WINBIO_STORAGE_INTERFACE*
    sensor_context : WINIBIO_SENSOR_CONTEXT*
    engine_context : WINIBIO_ENGINE_CONTEXT*
    storage_context : WINIBIO_STORAGE_CONTEXT*
    framework_interface : WINBIO_FRAMEWORK_INTERFACE*
  end
  struct WINBIO_ADAPTER_INTERFACE_VERSION
    major_version : UInt16
    minor_version : UInt16
  end
  struct WINBIO_SENSOR_INTERFACE
    version : WINBIO_ADAPTER_INTERFACE_VERSION
    type : UInt32
    size : LibC::UINT_PTR
    adapter_id : Guid
    attach : PIBIO_SENSOR_ATTACH_FN
    detach : PIBIO_SENSOR_DETACH_FN
    clear_context : PIBIO_SENSOR_CLEAR_CONTEXT_FN
    query_status : PIBIO_SENSOR_QUERY_STATUS_FN
    reset : PIBIO_SENSOR_RESET_FN
    set_mode : PIBIO_SENSOR_SET_MODE_FN
    set_indicator_status : PIBIO_SENSOR_SET_INDICATOR_STATUS_FN
    get_indicator_status : PIBIO_SENSOR_GET_INDICATOR_STATUS_FN
    start_capture : PIBIO_SENSOR_START_CAPTURE_FN
    finish_capture : PIBIO_SENSOR_FINISH_CAPTURE_FN
    export_sensor_data : PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN
    cancel : PIBIO_SENSOR_CANCEL_FN
    push_data_to_engine : PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN
    control_unit : PIBIO_SENSOR_CONTROL_UNIT_FN
    control_unit_privileged : PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN
    notify_power_change : PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN
    pipeline_init : PIBIO_SENSOR_PIPELINE_INIT_FN
    pipeline_cleanup : PIBIO_SENSOR_PIPELINE_CLEANUP_FN
    activate : PIBIO_SENSOR_ACTIVATE_FN
    deactivate : PIBIO_SENSOR_DEACTIVATE_FN
    query_extended_info : PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN
    query_calibration_formats : PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN
    set_calibration_format : PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN
    accept_calibration_data : PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN
    async_import_raw_buffer : PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN
    async_import_secure_buffer : PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN
    query_private_sensor_type : PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN
    connect_secure : PIBIO_SENSOR_CONNECT_SECURE_FN
    start_capture_ex : PIBIO_SENSOR_START_CAPTURE_EX_FN
    start_notify_wake : PIBIO_SENSOR_START_NOTIFY_WAKE_FN
    finish_notify_wake : PIBIO_SENSOR_FINISH_NOTIFY_WAKE_FN
  end
  struct WINBIO_ENGINE_INTERFACE
    version : WINBIO_ADAPTER_INTERFACE_VERSION
    type : UInt32
    size : LibC::UINT_PTR
    adapter_id : Guid
    attach : PIBIO_ENGINE_ATTACH_FN
    detach : PIBIO_ENGINE_DETACH_FN
    clear_context : PIBIO_ENGINE_CLEAR_CONTEXT_FN
    query_preferred_format : PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN
    query_index_vector_size : PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN
    query_hash_algorithms : PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN
    set_hash_algorithm : PIBIO_ENGINE_SET_HASH_ALGORITHM_FN
    query_sample_hint : PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN
    accept_sample_data : PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN
    export_engine_data : PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN
    verify_feature_set : PIBIO_ENGINE_VERIFY_FEATURE_SET_FN
    identify_feature_set : PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN
    create_enrollment : PIBIO_ENGINE_CREATE_ENROLLMENT_FN
    update_enrollment : PIBIO_ENGINE_UPDATE_ENROLLMENT_FN
    get_enrollment_status : PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN
    get_enrollment_hash : PIBIO_ENGINE_GET_ENROLLMENT_HASH_FN
    check_for_duplicate : PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN
    commit_enrollment : PIBIO_ENGINE_COMMIT_ENROLLMENT_FN
    discard_enrollment : PIBIO_ENGINE_DISCARD_ENROLLMENT_FN
    control_unit : PIBIO_ENGINE_CONTROL_UNIT_FN
    control_unit_privileged : PIBIO_ENGINE_CONTROL_UNIT_PRIVILEGED_FN
    notify_power_change : PIBIO_ENGINE_NOTIFY_POWER_CHANGE_FN
    reserved_1 : PIBIO_ENGINE_RESERVED_1_FN
    pipeline_init : PIBIO_ENGINE_PIPELINE_INIT_FN
    pipeline_cleanup : PIBIO_ENGINE_PIPELINE_CLEANUP_FN
    activate : PIBIO_ENGINE_ACTIVATE_FN
    deactivate : PIBIO_ENGINE_DEACTIVATE_FN
    query_extended_info : PIBIO_ENGINE_QUERY_EXTENDED_INFO_FN
    identify_all : PIBIO_ENGINE_IDENTIFY_ALL_FN
    set_enrollment_selector : PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN
    set_enrollment_parameters : PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN
    query_extended_enrollment_status : PIBIO_ENGINE_QUERY_EXTENDED_ENROLLMENT_STATUS_FN
    refresh_cache : PIBIO_ENGINE_REFRESH_CACHE_FN
    select_calibration_format : PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN
    query_calibration_data : PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN
    set_account_policy : PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN
    create_key : PIBIO_ENGINE_CREATE_KEY_FN
    identify_feature_set_secure : PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN
    accept_private_sensor_type_info : PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN
    create_enrollment_authenticated : PIBIO_ENGINE_CREATE_ENROLLMENT_AUTHENTICATED_FN
    identify_feature_set_authenticated : PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN
  end
  struct WINBIO_STORAGE_INTERFACE
    version : WINBIO_ADAPTER_INTERFACE_VERSION
    type : UInt32
    size : LibC::UINT_PTR
    adapter_id : Guid
    attach : PIBIO_STORAGE_ATTACH_FN
    detach : PIBIO_STORAGE_DETACH_FN
    clear_context : PIBIO_STORAGE_CLEAR_CONTEXT_FN
    create_database : PIBIO_STORAGE_CREATE_DATABASE_FN
    erase_database : PIBIO_STORAGE_ERASE_DATABASE_FN
    open_database : PIBIO_STORAGE_OPEN_DATABASE_FN
    close_database : PIBIO_STORAGE_CLOSE_DATABASE_FN
    get_data_format : PIBIO_STORAGE_GET_DATA_FORMAT_FN
    get_database_size : PIBIO_STORAGE_GET_DATABASE_SIZE_FN
    add_record : PIBIO_STORAGE_ADD_RECORD_FN
    delete_record : PIBIO_STORAGE_DELETE_RECORD_FN
    query_by_subject : PIBIO_STORAGE_QUERY_BY_SUBJECT_FN
    query_by_content : PIBIO_STORAGE_QUERY_BY_CONTENT_FN
    get_record_count : PIBIO_STORAGE_GET_RECORD_COUNT_FN
    first_record : PIBIO_STORAGE_FIRST_RECORD_FN
    next_record : PIBIO_STORAGE_NEXT_RECORD_FN
    get_current_record : PIBIO_STORAGE_GET_CURRENT_RECORD_FN
    control_unit : PIBIO_STORAGE_CONTROL_UNIT_FN
    control_unit_privileged : PIBIO_STORAGE_CONTROL_UNIT_PRIVILEGED_FN
    notify_power_change : PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN
    pipeline_init : PIBIO_STORAGE_PIPELINE_INIT_FN
    pipeline_cleanup : PIBIO_STORAGE_PIPELINE_CLEANUP_FN
    activate : PIBIO_STORAGE_ACTIVATE_FN
    deactivate : PIBIO_STORAGE_DEACTIVATE_FN
    query_extended_info : PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN
    notify_database_change : PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN
    reserved1 : PIBIO_STORAGE_RESERVED_1_FN
    reserved2 : PIBIO_STORAGE_RESERVED_2_FN
    update_record_begin : PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN
    update_record_commit : PIBIO_STORAGE_UPDATE_RECORD_COMMIT_FN
  end
  struct WINBIO_FRAMEWORK_INTERFACE
    version : WINBIO_ADAPTER_INTERFACE_VERSION
    type : UInt32
    size : LibC::UINT_PTR
    adapter_id : Guid
    set_unit_status : PIBIO_FRAMEWORK_SET_UNIT_STATUS_FN
    vsm_storage_attach : PIBIO_STORAGE_ATTACH_FN
    vsm_storage_detach : PIBIO_STORAGE_DETACH_FN
    vsm_storage_clear_context : PIBIO_STORAGE_CLEAR_CONTEXT_FN
    vsm_storage_create_database : PIBIO_STORAGE_CREATE_DATABASE_FN
    vsm_storage_open_database : PIBIO_STORAGE_OPEN_DATABASE_FN
    vsm_storage_close_database : PIBIO_STORAGE_CLOSE_DATABASE_FN
    vsm_storage_delete_record : PIBIO_STORAGE_DELETE_RECORD_FN
    vsm_storage_notify_power_change : PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN
    vsm_storage_pipeline_init : PIBIO_STORAGE_PIPELINE_INIT_FN
    vsm_storage_pipeline_cleanup : PIBIO_STORAGE_PIPELINE_CLEANUP_FN
    vsm_storage_activate : PIBIO_STORAGE_ACTIVATE_FN
    vsm_storage_deactivate : PIBIO_STORAGE_DEACTIVATE_FN
    vsm_storage_query_extended_info : PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN
    vsm_storage_cache_clear : PIBIO_FRAMEWORK_VSM_CACHE_CLEAR_FN
    vsm_storage_cache_import_begin : PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_BEGIN_FN
    vsm_storage_cache_import_next : PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_NEXT_FN
    vsm_storage_cache_import_end : PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_END_FN
    vsm_storage_cache_export_begin : PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_BEGIN_FN
    vsm_storage_cache_export_next : PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_NEXT_FN
    vsm_storage_cache_export_end : PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_END_FN
    vsm_sensor_attach : PIBIO_SENSOR_ATTACH_FN
    vsm_sensor_detach : PIBIO_SENSOR_DETACH_FN
    vsm_sensor_clear_context : PIBIO_SENSOR_CLEAR_CONTEXT_FN
    vsm_sensor_push_data_to_engine : PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN
    vsm_sensor_notify_power_change : PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN
    vsm_sensor_pipeline_init : PIBIO_SENSOR_PIPELINE_INIT_FN
    vsm_sensor_pipeline_cleanup : PIBIO_SENSOR_PIPELINE_CLEANUP_FN
    vsm_sensor_activate : PIBIO_SENSOR_ACTIVATE_FN
    vsm_sensor_deactivate : PIBIO_SENSOR_DEACTIVATE_FN
    vsm_sensor_async_import_raw_buffer : PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN
    vsm_sensor_async_import_secure_buffer : PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN
    reserved1 : PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_1_FN
    reserved2 : PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_2_FN
    reserved3 : PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_3_FN
    reserved4 : PIBIO_STORAGE_RESERVED_1_FN
    reserved5 : PIBIO_STORAGE_RESERVED_2_FN
    allocate_memory : PIBIO_FRAMEWORK_ALLOCATE_MEMORY_FN
    free_memory : PIBIO_FRAMEWORK_FREE_MEMORY_FN
    get_property : PIBIO_FRAMEWORK_GET_PROPERTY_FN
    lock_and_validate_secure_buffer : PIBIO_FRAMEWORK_LOCK_AND_VALIDATE_SECURE_BUFFER_FN
    release_secure_buffer : PIBIO_FRAMEWORK_RELEASE_SECURE_BUFFER_FN
    query_authorized_enrollments : PIBIO_FRAMEWORK_VSM_QUERY_AUTHORIZED_ENROLLMENTS_FN
    decrypt_sample : PIBIO_FRAMEWORK_VSM_DECRYPT_SAMPLE_FN
  end
  struct WINBIO_SENSOR_ATTRIBUTES
    payload_size : UInt32
    win_bio_hresult : HRESULT
    win_bio_version : WINBIO_VERSION
    sensor_type : UInt32
    sensor_sub_type : UInt32
    capabilities : UInt32
    manufacturer_name : UInt16[256]*
    model_name : UInt16[256]*
    serial_number : UInt16[256]*
    firmware_version : WINBIO_VERSION
    supported_format_entries : UInt32
    supported_format : WINBIO_REGISTERED_FORMAT[0]*
  end
  struct WINBIO_DATA
    size : UInt32
    data : UInt8[0]*
  end
  struct WINBIO_UPDATE_FIRMWARE
    payload_size : UInt32
    firmware_data : WINBIO_DATA
  end
  struct WINBIO_CALIBRATION_INFO
    payload_size : UInt32
    win_bio_hresult : HRESULT
    calibration_data : WINBIO_DATA
  end
  struct WINBIO_DIAGNOSTICS
    payload_size : UInt32
    win_bio_hresult : HRESULT
    sensor_status : UInt32
    vendor_diagnostics : WINBIO_DATA
  end
  struct WINBIO_BLANK_PAYLOAD
    payload_size : UInt32
    win_bio_hresult : HRESULT
  end
  struct WINBIO_CAPTURE_PARAMETERS
    payload_size : UInt32
    purpose : UInt8
    format : WINBIO_REGISTERED_FORMAT
    vendor_format : Guid
    flags : UInt8
  end
  struct WINBIO_CAPTURE_DATA
    payload_size : UInt32
    win_bio_hresult : HRESULT
    sensor_status : UInt32
    reject_detail : UInt32
    capture_data : WINBIO_DATA
  end
  struct WINBIO_SUPPORTED_ALGORITHMS
    payload_size : UInt32
    win_bio_hresult : HRESULT
    number_of_algorithms : UInt32
    algorithm_data : WINBIO_DATA
  end
  struct WINBIO_GET_INDICATOR
    payload_size : UInt32
    win_bio_hresult : HRESULT
    indicator_status : UInt32
  end
  struct WINBIO_SET_INDICATOR
    payload_size : UInt32
    indicator_status : UInt32
  end
  struct WINBIO_PRIVATE_SENSOR_TYPE_INFO
    payload_size : UInt32
    win_bio_hresult : HRESULT
    private_sensor_type_info : WINBIO_DATA
  end
  struct WINBIO_ENCRYPTED_CAPTURE_PARAMS
    payload_size : UInt32
    purpose : UInt8
    format : WINBIO_REGISTERED_FORMAT
    vendor_format : Guid
    flags : UInt8
    nonce_size : UInt32
  end
  struct WINBIO_NOTIFY_WAKE
    payload_size : UInt32
    win_bio_hresult : HRESULT
    reason : UInt32
  end


  # Params # factor : UInt32 [In],bspschemaarray : WINBIO_BSP_SCHEMA** [In],bspcount : LibC::UINT_PTR* [In]
  fun WinBioEnumServiceProviders(factor : UInt32, bspschemaarray : WINBIO_BSP_SCHEMA**, bspcount : LibC::UINT_PTR*) : HRESULT

  # Params # factor : UInt32 [In],unitschemaarray : WINBIO_UNIT_SCHEMA** [In],unitcount : LibC::UINT_PTR* [In]
  fun WinBioEnumBiometricUnits(factor : UInt32, unitschemaarray : WINBIO_UNIT_SCHEMA**, unitcount : LibC::UINT_PTR*) : HRESULT

  # Params # factor : UInt32 [In],storageschemaarray : WINBIO_STORAGE_SCHEMA** [In],storagecount : LibC::UINT_PTR* [In]
  fun WinBioEnumDatabases(factor : UInt32, storageschemaarray : WINBIO_STORAGE_SCHEMA**, storagecount : LibC::UINT_PTR*) : HRESULT

  # Params # notificationmethod : WINBIO_ASYNC_NOTIFICATION_METHOD [In],targetwindow : LibC::HANDLE [In],messagecode : UInt32 [In],callbackroutine : PWINBIO_ASYNC_COMPLETION_CALLBACK [In],userdata : Void* [In],asynchronousopen : LibC::BOOL [In],frameworkhandle : UInt32* [In]
  fun WinBioAsyncOpenFramework(notificationmethod : WINBIO_ASYNC_NOTIFICATION_METHOD, targetwindow : LibC::HANDLE, messagecode : UInt32, callbackroutine : PWINBIO_ASYNC_COMPLETION_CALLBACK, userdata : Void*, asynchronousopen : LibC::BOOL, frameworkhandle : UInt32*) : HRESULT

  # Params # frameworkhandle : UInt32 [In]
  fun WinBioCloseFramework(frameworkhandle : UInt32) : HRESULT

  # Params # frameworkhandle : UInt32 [In],factor : UInt32 [In]
  fun WinBioAsyncEnumServiceProviders(frameworkhandle : UInt32, factor : UInt32) : HRESULT

  # Params # frameworkhandle : UInt32 [In],factor : UInt32 [In]
  fun WinBioAsyncEnumBiometricUnits(frameworkhandle : UInt32, factor : UInt32) : HRESULT

  # Params # frameworkhandle : UInt32 [In],factor : UInt32 [In]
  fun WinBioAsyncEnumDatabases(frameworkhandle : UInt32, factor : UInt32) : HRESULT

  # Params # frameworkhandle : UInt32 [In],changetypes : UInt32 [In]
  fun WinBioAsyncMonitorFrameworkChanges(frameworkhandle : UInt32, changetypes : UInt32) : HRESULT

  # Params # factor : UInt32 [In],pooltype : WINBIO_POOL [In],flags : UInt32 [In],unitarray : UInt32* [In],unitcount : LibC::UINT_PTR [In],databaseid : Guid* [In],sessionhandle : UInt32* [In]
  fun WinBioOpenSession(factor : UInt32, pooltype : WINBIO_POOL, flags : UInt32, unitarray : UInt32*, unitcount : LibC::UINT_PTR, databaseid : Guid*, sessionhandle : UInt32*) : HRESULT

  # Params # factor : UInt32 [In],pooltype : WINBIO_POOL [In],flags : UInt32 [In],unitarray : UInt32* [In],unitcount : LibC::UINT_PTR [In],databaseid : Guid* [In],notificationmethod : WINBIO_ASYNC_NOTIFICATION_METHOD [In],targetwindow : LibC::HANDLE [In],messagecode : UInt32 [In],callbackroutine : PWINBIO_ASYNC_COMPLETION_CALLBACK [In],userdata : Void* [In],asynchronousopen : LibC::BOOL [In],sessionhandle : UInt32* [In]
  fun WinBioAsyncOpenSession(factor : UInt32, pooltype : WINBIO_POOL, flags : UInt32, unitarray : UInt32*, unitcount : LibC::UINT_PTR, databaseid : Guid*, notificationmethod : WINBIO_ASYNC_NOTIFICATION_METHOD, targetwindow : LibC::HANDLE, messagecode : UInt32, callbackroutine : PWINBIO_ASYNC_COMPLETION_CALLBACK, userdata : Void*, asynchronousopen : LibC::BOOL, sessionhandle : UInt32*) : HRESULT

  # Params # sessionhandle : UInt32 [In]
  fun WinBioCloseSession(sessionhandle : UInt32) : HRESULT

  # Params # sessionhandle : UInt32 [In],identity : WINBIO_IDENTITY* [In],subfactor : UInt8 [In],unitid : UInt32* [In],match : UInt8* [In],rejectdetail : UInt32* [In]
  fun WinBioVerify(sessionhandle : UInt32, identity : WINBIO_IDENTITY*, subfactor : UInt8, unitid : UInt32*, match : UInt8*, rejectdetail : UInt32*) : HRESULT

  # Params # sessionhandle : UInt32 [In],identity : WINBIO_IDENTITY* [In],subfactor : UInt8 [In],verifycallback : PWINBIO_VERIFY_CALLBACK [In],verifycallbackcontext : Void* [In]
  fun WinBioVerifyWithCallback(sessionhandle : UInt32, identity : WINBIO_IDENTITY*, subfactor : UInt8, verifycallback : PWINBIO_VERIFY_CALLBACK, verifycallbackcontext : Void*) : HRESULT

  # Params # sessionhandle : UInt32 [In],unitid : UInt32* [In],identity : WINBIO_IDENTITY* [In],subfactor : UInt8* [In],rejectdetail : UInt32* [In]
  fun WinBioIdentify(sessionhandle : UInt32, unitid : UInt32*, identity : WINBIO_IDENTITY*, subfactor : UInt8*, rejectdetail : UInt32*) : HRESULT

  # Params # sessionhandle : UInt32 [In],identifycallback : PWINBIO_IDENTIFY_CALLBACK [In],identifycallbackcontext : Void* [In]
  fun WinBioIdentifyWithCallback(sessionhandle : UInt32, identifycallback : PWINBIO_IDENTIFY_CALLBACK, identifycallbackcontext : Void*) : HRESULT

  # Params # sessionhandle : UInt32 [In]
  fun WinBioWait(sessionhandle : UInt32) : HRESULT

  # Params # sessionhandle : UInt32 [In]
  fun WinBioCancel(sessionhandle : UInt32) : HRESULT

  # Params # sessionhandle : UInt32 [In],unitid : UInt32* [In]
  fun WinBioLocateSensor(sessionhandle : UInt32, unitid : UInt32*) : HRESULT

  # Params # sessionhandle : UInt32 [In],locatecallback : PWINBIO_LOCATE_SENSOR_CALLBACK [In],locatecallbackcontext : Void* [In]
  fun WinBioLocateSensorWithCallback(sessionhandle : UInt32, locatecallback : PWINBIO_LOCATE_SENSOR_CALLBACK, locatecallbackcontext : Void*) : HRESULT

  # Params # sessionhandle : UInt32 [In],subfactor : UInt8 [In],unitid : UInt32 [In]
  fun WinBioEnrollBegin(sessionhandle : UInt32, subfactor : UInt8, unitid : UInt32) : HRESULT

  # Params # sessionhandle : UInt32 [In],selectorvalue : UInt64 [In]
  fun WinBioEnrollSelect(sessionhandle : UInt32, selectorvalue : UInt64) : HRESULT

  # Params # sessionhandle : UInt32 [In],rejectdetail : UInt32* [In]
  fun WinBioEnrollCapture(sessionhandle : UInt32, rejectdetail : UInt32*) : HRESULT

  # Params # sessionhandle : UInt32 [In],enrollcallback : PWINBIO_ENROLL_CAPTURE_CALLBACK [In],enrollcallbackcontext : Void* [In]
  fun WinBioEnrollCaptureWithCallback(sessionhandle : UInt32, enrollcallback : PWINBIO_ENROLL_CAPTURE_CALLBACK, enrollcallbackcontext : Void*) : HRESULT

  # Params # sessionhandle : UInt32 [In],identity : WINBIO_IDENTITY* [In],isnewtemplate : UInt8* [In]
  fun WinBioEnrollCommit(sessionhandle : UInt32, identity : WINBIO_IDENTITY*, isnewtemplate : UInt8*) : HRESULT

  # Params # sessionhandle : UInt32 [In]
  fun WinBioEnrollDiscard(sessionhandle : UInt32) : HRESULT

  # Params # sessionhandle : UInt32 [In],unitid : UInt32 [In],identity : WINBIO_IDENTITY* [In],subfactorarray : UInt8** [In],subfactorcount : LibC::UINT_PTR* [In]
  fun WinBioEnumEnrollments(sessionhandle : UInt32, unitid : UInt32, identity : WINBIO_IDENTITY*, subfactorarray : UInt8**, subfactorcount : LibC::UINT_PTR*) : HRESULT

  # Params # sessionhandle : UInt32 [In],unitid : UInt32 [In]
  fun WinBioImproveBegin(sessionhandle : UInt32, unitid : UInt32) : HRESULT

  # Params # sessionhandle : UInt32 [In]
  fun WinBioImproveEnd(sessionhandle : UInt32) : HRESULT

  # Params # sessionhandle : UInt32 [In],eventmask : UInt32 [In],eventcallback : PWINBIO_EVENT_CALLBACK [In],eventcallbackcontext : Void* [In]
  fun WinBioRegisterEventMonitor(sessionhandle : UInt32, eventmask : UInt32, eventcallback : PWINBIO_EVENT_CALLBACK, eventcallbackcontext : Void*) : HRESULT

  # Params # sessionhandle : UInt32 [In]
  fun WinBioUnregisterEventMonitor(sessionhandle : UInt32) : HRESULT

  # Params # sessionhandle : UInt32 [In],unitid : UInt32 [In]
  fun WinBioMonitorPresence(sessionhandle : UInt32, unitid : UInt32) : HRESULT

  # Params # sessionhandle : UInt32 [In],purpose : UInt8 [In],flags : UInt8 [In],unitid : UInt32* [In],sample : WINBIO_BIR** [In],samplesize : LibC::UINT_PTR* [In],rejectdetail : UInt32* [In]
  fun WinBioCaptureSample(sessionhandle : UInt32, purpose : UInt8, flags : UInt8, unitid : UInt32*, sample : WINBIO_BIR**, samplesize : LibC::UINT_PTR*, rejectdetail : UInt32*) : HRESULT

  # Params # sessionhandle : UInt32 [In],purpose : UInt8 [In],flags : UInt8 [In],capturecallback : PWINBIO_CAPTURE_CALLBACK [In],capturecallbackcontext : Void* [In]
  fun WinBioCaptureSampleWithCallback(sessionhandle : UInt32, purpose : UInt8, flags : UInt8, capturecallback : PWINBIO_CAPTURE_CALLBACK, capturecallbackcontext : Void*) : HRESULT

  # Params # sessionhandle : UInt32 [In],unitid : UInt32 [In],identity : WINBIO_IDENTITY* [In],subfactor : UInt8 [In]
  fun WinBioDeleteTemplate(sessionhandle : UInt32, unitid : UInt32, identity : WINBIO_IDENTITY*, subfactor : UInt8) : HRESULT

  # Params # sessionhandle : UInt32 [In],unitid : UInt32 [In]
  fun WinBioLockUnit(sessionhandle : UInt32, unitid : UInt32) : HRESULT

  # Params # sessionhandle : UInt32 [In],unitid : UInt32 [In]
  fun WinBioUnlockUnit(sessionhandle : UInt32, unitid : UInt32) : HRESULT

  # Params # sessionhandle : UInt32 [In],unitid : UInt32 [In],component : WINBIO_COMPONENT [In],controlcode : UInt32 [In],sendbuffer : UInt8* [In],sendbuffersize : LibC::UINT_PTR [In],receivebuffer : UInt8* [In],receivebuffersize : LibC::UINT_PTR [In],receivedatasize : LibC::UINT_PTR* [In],operationstatus : UInt32* [In]
  fun WinBioControlUnit(sessionhandle : UInt32, unitid : UInt32, component : WINBIO_COMPONENT, controlcode : UInt32, sendbuffer : UInt8*, sendbuffersize : LibC::UINT_PTR, receivebuffer : UInt8*, receivebuffersize : LibC::UINT_PTR, receivedatasize : LibC::UINT_PTR*, operationstatus : UInt32*) : HRESULT

  # Params # sessionhandle : UInt32 [In],unitid : UInt32 [In],component : WINBIO_COMPONENT [In],controlcode : UInt32 [In],sendbuffer : UInt8* [In],sendbuffersize : LibC::UINT_PTR [In],receivebuffer : UInt8* [In],receivebuffersize : LibC::UINT_PTR [In],receivedatasize : LibC::UINT_PTR* [In],operationstatus : UInt32* [In]
  fun WinBioControlUnitPrivileged(sessionhandle : UInt32, unitid : UInt32, component : WINBIO_COMPONENT, controlcode : UInt32, sendbuffer : UInt8*, sendbuffersize : LibC::UINT_PTR, receivebuffer : UInt8*, receivebuffersize : LibC::UINT_PTR, receivedatasize : LibC::UINT_PTR*, operationstatus : UInt32*) : HRESULT

  # Params # sessionhandle : UInt32 [In],propertytype : UInt32 [In],propertyid : UInt32 [In],unitid : UInt32 [In],identity : WINBIO_IDENTITY* [In],subfactor : UInt8 [In],propertybuffer : Void** [In],propertybuffersize : LibC::UINT_PTR* [In]
  fun WinBioGetProperty(sessionhandle : UInt32, propertytype : UInt32, propertyid : UInt32, unitid : UInt32, identity : WINBIO_IDENTITY*, subfactor : UInt8, propertybuffer : Void**, propertybuffersize : LibC::UINT_PTR*) : HRESULT

  # Params # sessionhandle : UInt32 [In],propertytype : UInt32 [In],propertyid : UInt32 [In],unitid : UInt32 [In],identity : WINBIO_IDENTITY* [In],subfactor : UInt8 [In],propertybuffer : Void* [In],propertybuffersize : LibC::UINT_PTR [In]
  fun WinBioSetProperty(sessionhandle : UInt32, propertytype : UInt32, propertyid : UInt32, unitid : UInt32, identity : WINBIO_IDENTITY*, subfactor : UInt8, propertybuffer : Void*, propertybuffersize : LibC::UINT_PTR) : HRESULT

  # Params # address : Void* [In]
  fun WinBioFree(address : Void*) : HRESULT

  # Params # type : WINBIO_CREDENTIAL_TYPE [In],credential : UInt8* [In],credentialsize : LibC::UINT_PTR [In],format : WINBIO_CREDENTIAL_FORMAT [In]
  fun WinBioSetCredential(type : WINBIO_CREDENTIAL_TYPE, credential : UInt8*, credentialsize : LibC::UINT_PTR, format : WINBIO_CREDENTIAL_FORMAT) : HRESULT

  # Params # identity : WINBIO_IDENTITY [In],type : WINBIO_CREDENTIAL_TYPE [In]
  fun WinBioRemoveCredential(identity : WINBIO_IDENTITY, type : WINBIO_CREDENTIAL_TYPE) : HRESULT

  # Params # 
  fun WinBioRemoveAllCredentials : HRESULT

  # Params # 
  fun WinBioRemoveAllDomainCredentials : HRESULT

  # Params # identity : WINBIO_IDENTITY [In],type : WINBIO_CREDENTIAL_TYPE [In],credentialstate : WINBIO_CREDENTIAL_STATE* [In]
  fun WinBioGetCredentialState(identity : WINBIO_IDENTITY, type : WINBIO_CREDENTIAL_TYPE, credentialstate : WINBIO_CREDENTIAL_STATE*) : HRESULT

  # Params # sessionhandle : UInt32 [In]
  fun WinBioLogonIdentifiedUser(sessionhandle : UInt32) : HRESULT

  # Params # accountowner : WINBIO_IDENTITY* [In],enrolledfactors : UInt32* [In]
  fun WinBioGetEnrolledFactors(accountowner : WINBIO_IDENTITY*, enrolledfactors : UInt32*) : HRESULT

  # Params # value : UInt8* [In],source : WINBIO_SETTING_SOURCE* [In]
  fun WinBioGetEnabledSetting(value : UInt8*, source : WINBIO_SETTING_SOURCE*)

  # Params # value : UInt8* [In],source : WINBIO_SETTING_SOURCE* [In]
  fun WinBioGetLogonSetting(value : UInt8*, source : WINBIO_SETTING_SOURCE*)

  # Params # value : UInt8* [In],source : WINBIO_SETTING_SOURCE* [In]
  fun WinBioGetDomainLogonSetting(value : UInt8*, source : WINBIO_SETTING_SOURCE*)

  # Params # 
  fun WinBioAcquireFocus : HRESULT

  # Params # 
  fun WinBioReleaseFocus : HRESULT
end
