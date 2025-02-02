require "./../foundation.cr"
require "./../system/io.cr"

module Win32cr::Devices::BiometricFramework
  extend self
  alias PWINBIO_ASYNC_COMPLETION_CALLBACK = Proc(Win32cr::Devices::BiometricFramework::WINBIO_ASYNC_RESULT*, Void)

  alias PWINBIO_VERIFY_CALLBACK = Proc(Void*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Foundation::BOOLEAN, UInt32, Void)

  alias PWINBIO_IDENTIFY_CALLBACK = Proc(Void*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8, UInt32, Void)

  alias PWINBIO_LOCATE_SENSOR_CALLBACK = Proc(Void*, Win32cr::Foundation::HRESULT, UInt32, Void)

  alias PWINBIO_ENROLL_CAPTURE_CALLBACK = Proc(Void*, Win32cr::Foundation::HRESULT, UInt32, Void)

  alias PWINBIO_EVENT_CALLBACK = Proc(Void*, Win32cr::Foundation::HRESULT, Win32cr::Devices::BiometricFramework::WINBIO_EVENT*, Void)

  alias PWINBIO_CAPTURE_CALLBACK = Proc(Void*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Devices::BiometricFramework::WINBIO_BIR*, LibC::UIntPtrT, UInt32, Void)

  alias PIBIO_SENSOR_ATTACH_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_DETACH_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_CLEAR_CONTEXT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_QUERY_STATUS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_RESET_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_SET_MODE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_SET_INDICATOR_STATUS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_GET_INDICATOR_STATUS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_START_CAPTURE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8, Win32cr::System::IO::OVERLAPPED**, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_FINISH_CAPTURE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_BIR**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_CANCEL_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8, UInt8, UInt32*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_CONTROL_UNIT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_PIPELINE_INIT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_PIPELINE_CLEANUP_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_ACTIVATE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_DEACTIVATE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_EXTENDED_SENSOR_INFO*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, UInt8**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID, UInt8*, LibC::UIntPtrT, UInt8**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_CONNECT_SECURE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_SECURE_CONNECTION_PARAMS*, Win32cr::Devices::BiometricFramework::WINBIO_SECURE_CONNECTION_DATA**, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_START_CAPTURE_EX_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8, UInt8*, LibC::UIntPtrT, UInt8, Win32cr::System::IO::OVERLAPPED**, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_START_NOTIFY_WAKE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::System::IO::OVERLAPPED**, Win32cr::Foundation::HRESULT)

  alias PIBIO_SENSOR_FINISH_NOTIFY_WAKE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32*, Win32cr::Foundation::HRESULT)

  alias PWINBIO_QUERY_SENSOR_INTERFACE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_SENSOR_INTERFACE**, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_ATTACH_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_DETACH_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_CLEAR_CONTEXT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT*, LibC::GUID*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt8**, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_SET_HASH_ALGORITHM_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT, UInt8*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_BIR*, LibC::UIntPtrT, UInt8, UInt32*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8, Win32cr::Devices::BiometricFramework::WINBIO_BIR**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_VERIFY_FEATURE_SET_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8, Win32cr::Foundation::BOOLEAN*, UInt8**, LibC::UIntPtrT*, UInt8**, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8*, UInt8**, LibC::UIntPtrT*, UInt8**, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_CREATE_ENROLLMENT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_UPDATE_ENROLLMENT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_GET_ENROLLMENT_HASH_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8*, Win32cr::Foundation::BOOLEAN*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_COMMIT_ENROLLMENT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8, UInt8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_DISCARD_ENROLLMENT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_CONTROL_UNIT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_CONTROL_UNIT_PRIVILEGED_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_NOTIFY_POWER_CHANGE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_RESERVED_1_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_PIPELINE_INIT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_PIPELINE_CLEANUP_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_ACTIVATE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_DEACTIVATE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_QUERY_EXTENDED_INFO_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_EXTENDED_ENGINE_INFO*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_IDENTIFY_ALL_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT*, Win32cr::Devices::BiometricFramework::WINBIO_PRESENCE**, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt64, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_EXTENDED_ENROLLMENT_PARAMETERS*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_QUERY_EXTENDED_ENROLLMENT_STATUS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_EXTENDED_ENROLLMENT_STATUS*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_REFRESH_CACHE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID*, LibC::UIntPtrT, LibC::GUID*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::BOOLEAN*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_ACCOUNT_POLICY*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_CREATE_KEY_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8*, UInt32*, UInt8**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_CREATE_ENROLLMENT_AUTHENTICATED_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8*, UInt32*, UInt8**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PWINBIO_QUERY_ENGINE_INTERFACE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_ENGINE_INTERFACE**, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_ATTACH_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_DETACH_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_CLEAR_CONTEXT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_CREATE_DATABASE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID*, UInt32, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_ERASE_DATABASE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_OPEN_DATABASE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_CLOSE_DATABASE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_GET_DATA_FORMAT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID*, Win32cr::Devices::BiometricFramework::WINBIO_VERSION*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_GET_DATABASE_SIZE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_ADD_RECORD_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_RECORD*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_DELETE_RECORD_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_QUERY_BY_SUBJECT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_QUERY_BY_CONTENT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8, UInt32*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_GET_RECORD_COUNT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_FIRST_RECORD_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_NEXT_RECORD_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_GET_CURRENT_RECORD_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_RECORD*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_CONTROL_UNIT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_CONTROL_UNIT_PRIVILEGED_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_PIPELINE_INIT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_PIPELINE_CLEANUP_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_ACTIVATE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_DEACTIVATE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_EXTENDED_STORAGE_INFO*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::BOOLEAN, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_RESERVED_1_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt64*, UInt64*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_RESERVED_2_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8, Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_RECORD*, Win32cr::Foundation::HRESULT)

  alias PIBIO_STORAGE_UPDATE_RECORD_COMMIT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_RECORD*, Win32cr::Foundation::HRESULT)

  alias PWINBIO_QUERY_STORAGE_INTERFACE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_INTERFACE**, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_SET_UNIT_STATUS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_EXTENDED_UNIT_STATUS*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_VSM_CACHE_CLEAR_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_BEGIN_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_NEXT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_END_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_BEGIN_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_NEXT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_END_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_1_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_2_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_3_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_ALLOCATE_MEMORY_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_FREE_MEMORY_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Void*, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_GET_PROPERTY_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, UInt32, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8, Void**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_LOCK_AND_VALIDATE_SECURE_BUFFER_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID, Void**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_RELEASE_SECURE_BUFFER_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_VSM_QUERY_AUTHORIZED_ENROLLMENTS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, LibC::UIntPtrT*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY**, Win32cr::Foundation::HRESULT)

  alias PIBIO_FRAMEWORK_VSM_DECRYPT_SAMPLE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)

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

  enum WINBIO_SETTING_SOURCE : UInt32
    WINBIO_SETTING_SOURCE_INVALID = 0_u32
    WINBIO_SETTING_SOURCE_DEFAULT = 1_u32
    WINBIO_SETTING_SOURCE_LOCAL = 3_u32
    WINBIO_SETTING_SOURCE_POLICY = 2_u32
  end
  enum WINBIO_COMPONENT : UInt32
    WINBIO_COMPONENT_SENSOR = 1_u32
    WINBIO_COMPONENT_ENGINE = 2_u32
    WINBIO_COMPONENT_STORAGE = 3_u32
  end
  enum WINBIO_POOL : UInt32
    WINBIO_POOL_SYSTEM = 1_u32
    WINBIO_POOL_PRIVATE = 2_u32
  end
  enum WINBIO_ANTI_SPOOF_POLICY_ACTION
    WINBIO_ANTI_SPOOF_DISABLE = 0_i32
    WINBIO_ANTI_SPOOF_ENABLE = 1_i32
    WINBIO_ANTI_SPOOF_REMOVE = 2_i32
  end
  enum WINBIO_POLICY_SOURCE
    WINBIO_POLICY_UNKNOWN = 0_i32
    WINBIO_POLICY_DEFAULT = 1_i32
    WINBIO_POLICY_LOCAL = 2_i32
    WINBIO_POLICY_ADMIN = 3_i32
  end
  enum WINBIO_CREDENTIAL_TYPE
    WINBIO_CREDENTIAL_PASSWORD = 1_i32
    WINBIO_CREDENTIAL_ALL = -1_i32
  end
  enum WINBIO_CREDENTIAL_FORMAT
    WINBIO_PASSWORD_GENERIC = 1_i32
    WINBIO_PASSWORD_PACKED = 2_i32
    WINBIO_PASSWORD_PROTECTED = 3_i32
  end
  enum WINBIO_CREDENTIAL_STATE
    WINBIO_CREDENTIAL_NOT_SET = 1_i32
    WINBIO_CREDENTIAL_SET = 2_i32
  end
  enum WINBIO_ASYNC_NOTIFICATION_METHOD
    WINBIO_ASYNC_NOTIFY_NONE = 0_i32
    WINBIO_ASYNC_NOTIFY_CALLBACK = 1_i32
    WINBIO_ASYNC_NOTIFY_MESSAGE = 2_i32
    WINBIO_ASYNC_NOTIFY_MAXIMUM_VALUE = 3_i32
  end

  @[Extern]
  struct WINBIO_VERSION
    property major_version : UInt32
    property minor_version : UInt32
    def initialize(@major_version : UInt32, @minor_version : UInt32)
    end
  end

  @[Extern]
  struct WINBIO_IDENTITY
    property type__ : UInt32
    property value : Value_e__Union_

    # Nested Type Value_e__Union_
    @[Extern(union: true)]
    struct Value_e__Union_
    property null : UInt32
    property wildcard : UInt32
    property template_guid : LibC::GUID
    property account_sid : AccountSid_e__Struct_
    property secure_id : UInt8[32]

      # Nested Type AccountSid_e__Struct_
      @[Extern]
      struct AccountSid_e__Struct_
    property size : UInt32
    property data : UInt8[68]
    def initialize(@size : UInt32, @data : UInt8[68])
    end
      end

    def initialize(@null : UInt32, @wildcard : UInt32, @template_guid : LibC::GUID, @account_sid : AccountSid_e__Struct_, @secure_id : UInt8[32])
    end
    end

    def initialize(@type__ : UInt32, @value : Value_e__Union_)
    end
  end

  @[Extern]
  struct WINBIO_SECURE_CONNECTION_PARAMS
    property payload_size : UInt32
    property version : UInt16
    property flags : UInt16
    def initialize(@payload_size : UInt32, @version : UInt16, @flags : UInt16)
    end
  end

  @[Extern]
  struct WINBIO_SECURE_CONNECTION_DATA
    property size : UInt32
    property version : UInt16
    property flags : UInt16
    property model_certificate_size : UInt32
    property intermediate_ca1_size : UInt32
    property intermediate_ca2_size : UInt32
    def initialize(@size : UInt32, @version : UInt16, @flags : UInt16, @model_certificate_size : UInt32, @intermediate_ca1_size : UInt32, @intermediate_ca2_size : UInt32)
    end
  end

  @[Extern]
  struct WINBIO_BIR_DATA
    property size : UInt32
    property offset : UInt32
    def initialize(@size : UInt32, @offset : UInt32)
    end
  end

  @[Extern]
  struct WINBIO_BIR
    property header_block : Win32cr::Devices::BiometricFramework::WINBIO_BIR_DATA
    property standard_data_block : Win32cr::Devices::BiometricFramework::WINBIO_BIR_DATA
    property vendor_data_block : Win32cr::Devices::BiometricFramework::WINBIO_BIR_DATA
    property signature_block : Win32cr::Devices::BiometricFramework::WINBIO_BIR_DATA
    def initialize(@header_block : Win32cr::Devices::BiometricFramework::WINBIO_BIR_DATA, @standard_data_block : Win32cr::Devices::BiometricFramework::WINBIO_BIR_DATA, @vendor_data_block : Win32cr::Devices::BiometricFramework::WINBIO_BIR_DATA, @signature_block : Win32cr::Devices::BiometricFramework::WINBIO_BIR_DATA)
    end
  end

  @[Extern]
  struct WINBIO_REGISTERED_FORMAT
    property owner : UInt16
    property type__ : UInt16
    def initialize(@owner : UInt16, @type__ : UInt16)
    end
  end

  @[Extern]
  struct WINBIO_BIR_HEADER
    property valid_fields : UInt16
    property header_version : UInt8
    property patron_header_version : UInt8
    property data_flags : UInt8
    property type__ : UInt32
    property subtype : UInt8
    property purpose : UInt8
    property data_quality : Int8
    property creation_date : Win32cr::Foundation::LARGE_INTEGER
    property validity_period : ValidityPeriod_e__Struct_
    property biometric_data_format : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT
    property product_id : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT

    # Nested Type ValidityPeriod_e__Struct_
    @[Extern]
    struct ValidityPeriod_e__Struct_
    property begin_date : Win32cr::Foundation::LARGE_INTEGER
    property end_date : Win32cr::Foundation::LARGE_INTEGER
    def initialize(@begin_date : Win32cr::Foundation::LARGE_INTEGER, @end_date : Win32cr::Foundation::LARGE_INTEGER)
    end
    end

    def initialize(@valid_fields : UInt16, @header_version : UInt8, @patron_header_version : UInt8, @data_flags : UInt8, @type__ : UInt32, @subtype : UInt8, @purpose : UInt8, @data_quality : Int8, @creation_date : Win32cr::Foundation::LARGE_INTEGER, @validity_period : ValidityPeriod_e__Struct_, @biometric_data_format : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT, @product_id : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT)
    end
  end

  @[Extern]
  struct WINBIO_BDB_ANSI_381_HEADER
    property record_length : UInt64
    property format_identifier : UInt32
    property version_number : UInt32
    property product_id : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT
    property capture_device_id : UInt16
    property image_acquisition_level : UInt16
    property horizontal_scan_resolution : UInt16
    property vertical_scan_resolution : UInt16
    property horizontal_image_resolution : UInt16
    property vertical_image_resolution : UInt16
    property element_count : UInt8
    property scale_units : UInt8
    property pixel_depth : UInt8
    property image_compression_alg : UInt8
    property reserved : UInt16
    def initialize(@record_length : UInt64, @format_identifier : UInt32, @version_number : UInt32, @product_id : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT, @capture_device_id : UInt16, @image_acquisition_level : UInt16, @horizontal_scan_resolution : UInt16, @vertical_scan_resolution : UInt16, @horizontal_image_resolution : UInt16, @vertical_image_resolution : UInt16, @element_count : UInt8, @scale_units : UInt8, @pixel_depth : UInt8, @image_compression_alg : UInt8, @reserved : UInt16)
    end
  end

  @[Extern]
  struct WINBIO_BDB_ANSI_381_RECORD
    property block_length : UInt32
    property horizontal_line_length : UInt16
    property vertical_line_length : UInt16
    property position : UInt8
    property count_of_views : UInt8
    property view_number : UInt8
    property image_quality : UInt8
    property impression_type : UInt8
    property reserved : UInt8
    def initialize(@block_length : UInt32, @horizontal_line_length : UInt16, @vertical_line_length : UInt16, @position : UInt8, @count_of_views : UInt8, @view_number : UInt8, @image_quality : UInt8, @impression_type : UInt8, @reserved : UInt8)
    end
  end

  @[Extern]
  struct WINBIO_SECURE_BUFFER_HEADER_V1
    property type__ : UInt32
    property size : UInt32
    property flags : UInt32
    property validation_tag : UInt64
    def initialize(@type__ : UInt32, @size : UInt32, @flags : UInt32, @validation_tag : UInt64)
    end
  end

  @[Extern]
  struct WINBIO_EVENT
    property type__ : UInt32
    property parameters : Parameters_e__Union_

    # Nested Type Parameters_e__Union_
    @[Extern(union: true)]
    struct Parameters_e__Union_
    property unclaimed : Unclaimed_e__Struct_
    property unclaimed_identify : UnclaimedIdentify_e__Struct_
    property error : Error_e__Struct_

      # Nested Type UnclaimedIdentify_e__Struct_
      @[Extern]
      struct UnclaimedIdentify_e__Struct_
    property unit_id : UInt32
    property identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY
    property sub_factor : UInt8
    property reject_detail : UInt32
    def initialize(@unit_id : UInt32, @identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, @sub_factor : UInt8, @reject_detail : UInt32)
    end
      end


      # Nested Type Unclaimed_e__Struct_
      @[Extern]
      struct Unclaimed_e__Struct_
    property unit_id : UInt32
    property reject_detail : UInt32
    def initialize(@unit_id : UInt32, @reject_detail : UInt32)
    end
      end


      # Nested Type Error_e__Struct_
      @[Extern]
      struct Error_e__Struct_
    property error_code : Win32cr::Foundation::HRESULT
    def initialize(@error_code : Win32cr::Foundation::HRESULT)
    end
      end

    def initialize(@unclaimed : Unclaimed_e__Struct_, @unclaimed_identify : UnclaimedIdentify_e__Struct_, @error : Error_e__Struct_)
    end
    end

    def initialize(@type__ : UInt32, @parameters : Parameters_e__Union_)
    end
  end

  @[Extern(union: true)]
  struct WINBIO_PRESENCE_PROPERTIES
    property facial_features : FacialFeatures_e__Struct_
    property iris : Iris_e__Struct_

    # Nested Type Iris_e__Struct_
    @[Extern]
    struct Iris_e__Struct_
    property eye_bounding_box_1 : Win32cr::Foundation::RECT
    property eye_bounding_box_2 : Win32cr::Foundation::RECT
    property pupil_center_1 : Win32cr::Foundation::POINT
    property pupil_center_2 : Win32cr::Foundation::POINT
    property distance : Int32
    def initialize(@eye_bounding_box_1 : Win32cr::Foundation::RECT, @eye_bounding_box_2 : Win32cr::Foundation::RECT, @pupil_center_1 : Win32cr::Foundation::POINT, @pupil_center_2 : Win32cr::Foundation::POINT, @distance : Int32)
    end
    end


    # Nested Type FacialFeatures_e__Struct_
    @[Extern]
    struct FacialFeatures_e__Struct_
    property bounding_box : Win32cr::Foundation::RECT
    property distance : Int32
    property opaque_engine_data : OpaqueEngineData_e__Struct_

      # Nested Type OpaqueEngineData_e__Struct_
      @[Extern]
      struct OpaqueEngineData_e__Struct_
    property adapter_id : LibC::GUID
    property data : UInt32[78]
    def initialize(@adapter_id : LibC::GUID, @data : UInt32[78])
    end
      end

    def initialize(@bounding_box : Win32cr::Foundation::RECT, @distance : Int32, @opaque_engine_data : OpaqueEngineData_e__Struct_)
    end
    end

    def initialize(@facial_features : FacialFeatures_e__Struct_, @iris : Iris_e__Struct_)
    end
  end

  @[Extern]
  struct WINBIO_PRESENCE
    property factor : UInt32
    property sub_factor : UInt8
    property status : Win32cr::Foundation::HRESULT
    property reject_detail : UInt32
    property identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY
    property tracking_id : UInt64
    property ticket : UInt64
    property properties : Win32cr::Devices::BiometricFramework::WINBIO_PRESENCE_PROPERTIES
    property authorization : Authorization_e__Struct_

    # Nested Type Authorization_e__Struct_
    @[Extern]
    struct Authorization_e__Struct_
    property size : UInt32
    property data : UInt8[32]
    def initialize(@size : UInt32, @data : UInt8[32])
    end
    end

    def initialize(@factor : UInt32, @sub_factor : UInt8, @status : Win32cr::Foundation::HRESULT, @reject_detail : UInt32, @identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, @tracking_id : UInt64, @ticket : UInt64, @properties : Win32cr::Devices::BiometricFramework::WINBIO_PRESENCE_PROPERTIES, @authorization : Authorization_e__Struct_)
    end
  end

  @[Extern]
  struct WINBIO_BSP_SCHEMA
    property biometric_factor : UInt32
    property bsp_id : LibC::GUID
    property description : UInt16[256]
    property vendor : UInt16[256]
    property version : Win32cr::Devices::BiometricFramework::WINBIO_VERSION
    def initialize(@biometric_factor : UInt32, @bsp_id : LibC::GUID, @description : UInt16[256], @vendor : UInt16[256], @version : Win32cr::Devices::BiometricFramework::WINBIO_VERSION)
    end
  end

  @[Extern]
  struct WINBIO_UNIT_SCHEMA
    property unit_id : UInt32
    property pool_type : UInt32
    property biometric_factor : UInt32
    property sensor_sub_type : UInt32
    property capabilities : UInt32
    property device_instance_id : UInt16[256]
    property description : UInt16[256]
    property manufacturer : UInt16[256]
    property model : UInt16[256]
    property serial_number : UInt16[256]
    property firmware_version : Win32cr::Devices::BiometricFramework::WINBIO_VERSION
    def initialize(@unit_id : UInt32, @pool_type : UInt32, @biometric_factor : UInt32, @sensor_sub_type : UInt32, @capabilities : UInt32, @device_instance_id : UInt16[256], @description : UInt16[256], @manufacturer : UInt16[256], @model : UInt16[256], @serial_number : UInt16[256], @firmware_version : Win32cr::Devices::BiometricFramework::WINBIO_VERSION)
    end
  end

  @[Extern]
  struct WINBIO_STORAGE_SCHEMA
    property biometric_factor : UInt32
    property database_id : LibC::GUID
    property data_format : LibC::GUID
    property attributes : UInt32
    property file_path : UInt16[256]
    property connection_string : UInt16[256]
    def initialize(@biometric_factor : UInt32, @database_id : LibC::GUID, @data_format : LibC::GUID, @attributes : UInt32, @file_path : UInt16[256], @connection_string : UInt16[256])
    end
  end

  @[Extern]
  struct WINBIO_EXTENDED_SENSOR_INFO
    property generic_sensor_capabilities : UInt32
    property factor : UInt32
    property specific : Specific_e__Union_

    # Nested Type Specific_e__Union_
    @[Extern(union: true)]
    struct Specific_e__Union_
    property null : UInt32
    property facial_features : FacialFeatures_e__Struct_
    property fingerprint : Fingerprint_e__Struct_
    property iris : Iris_e__Struct_
    property voice : Voice_e__Struct_

      # Nested Type Iris_e__Struct_
      @[Extern]
      struct Iris_e__Struct_
    property frame_size : Win32cr::Foundation::RECT
    property frame_offset : Win32cr::Foundation::POINT
    property mandatory_orientation : UInt32
    def initialize(@frame_size : Win32cr::Foundation::RECT, @frame_offset : Win32cr::Foundation::POINT, @mandatory_orientation : UInt32)
    end
      end


      # Nested Type FacialFeatures_e__Struct_
      @[Extern]
      struct FacialFeatures_e__Struct_
    property frame_size : Win32cr::Foundation::RECT
    property frame_offset : Win32cr::Foundation::POINT
    property mandatory_orientation : UInt32
    property hardware_info : HardwareInfo_e__Struct_

        # Nested Type HardwareInfo_e__Struct_
        @[Extern]
        struct HardwareInfo_e__Struct_
    property color_sensor_id : UInt16[260]
    property infrared_sensor_id : UInt16[260]
    property infrared_sensor_rotation_angle : UInt32
    def initialize(@color_sensor_id : UInt16[260], @infrared_sensor_id : UInt16[260], @infrared_sensor_rotation_angle : UInt32)
    end
        end

    def initialize(@frame_size : Win32cr::Foundation::RECT, @frame_offset : Win32cr::Foundation::POINT, @mandatory_orientation : UInt32, @hardware_info : HardwareInfo_e__Struct_)
    end
      end


      # Nested Type Fingerprint_e__Struct_
      @[Extern]
      struct Fingerprint_e__Struct_
    property reserved : UInt32
    def initialize(@reserved : UInt32)
    end
      end


      # Nested Type Voice_e__Struct_
      @[Extern]
      struct Voice_e__Struct_
    property reserved : UInt32
    def initialize(@reserved : UInt32)
    end
      end

    def initialize(@null : UInt32, @facial_features : FacialFeatures_e__Struct_, @fingerprint : Fingerprint_e__Struct_, @iris : Iris_e__Struct_, @voice : Voice_e__Struct_)
    end
    end

    def initialize(@generic_sensor_capabilities : UInt32, @factor : UInt32, @specific : Specific_e__Union_)
    end
  end

  @[Extern]
  struct WINBIO_EXTENDED_ENGINE_INFO
    property generic_engine_capabilities : UInt32
    property factor : UInt32
    property specific : Specific_e__Union_

    # Nested Type Specific_e__Union_
    @[Extern(union: true)]
    struct Specific_e__Union_
    property null : UInt32
    property facial_features : FacialFeatures_e__Struct_
    property fingerprint : Fingerprint_e__Struct_
    property iris : Iris_e__Struct_
    property voice : Voice_e__Struct_

      # Nested Type Voice_e__Struct_
      @[Extern]
      struct Voice_e__Struct_
    property capabilities : UInt32
    property enrollment_requirements : EnrollmentRequirements_e__Struct_

        # Nested Type EnrollmentRequirements_e__Struct_
        @[Extern]
        struct EnrollmentRequirements_e__Struct_
    property null : UInt32
    def initialize(@null : UInt32)
    end
        end

    def initialize(@capabilities : UInt32, @enrollment_requirements : EnrollmentRequirements_e__Struct_)
    end
      end


      # Nested Type Iris_e__Struct_
      @[Extern]
      struct Iris_e__Struct_
    property capabilities : UInt32
    property enrollment_requirements : EnrollmentRequirements_e__Struct_

        # Nested Type EnrollmentRequirements_e__Struct_
        @[Extern]
        struct EnrollmentRequirements_e__Struct_
    property null : UInt32
    def initialize(@null : UInt32)
    end
        end

    def initialize(@capabilities : UInt32, @enrollment_requirements : EnrollmentRequirements_e__Struct_)
    end
      end


      # Nested Type Fingerprint_e__Struct_
      @[Extern]
      struct Fingerprint_e__Struct_
    property capabilities : UInt32
    property enrollment_requirements : EnrollmentRequirements_e__Struct_

        # Nested Type EnrollmentRequirements_e__Struct_
        @[Extern]
        struct EnrollmentRequirements_e__Struct_
    property general_samples : UInt32
    property center : UInt32
    property top_edge : UInt32
    property bottom_edge : UInt32
    property left_edge : UInt32
    property right_edge : UInt32
    def initialize(@general_samples : UInt32, @center : UInt32, @top_edge : UInt32, @bottom_edge : UInt32, @left_edge : UInt32, @right_edge : UInt32)
    end
        end

    def initialize(@capabilities : UInt32, @enrollment_requirements : EnrollmentRequirements_e__Struct_)
    end
      end


      # Nested Type FacialFeatures_e__Struct_
      @[Extern]
      struct FacialFeatures_e__Struct_
    property capabilities : UInt32
    property enrollment_requirements : EnrollmentRequirements_e__Struct_

        # Nested Type EnrollmentRequirements_e__Struct_
        @[Extern]
        struct EnrollmentRequirements_e__Struct_
    property null : UInt32
    def initialize(@null : UInt32)
    end
        end

    def initialize(@capabilities : UInt32, @enrollment_requirements : EnrollmentRequirements_e__Struct_)
    end
      end

    def initialize(@null : UInt32, @facial_features : FacialFeatures_e__Struct_, @fingerprint : Fingerprint_e__Struct_, @iris : Iris_e__Struct_, @voice : Voice_e__Struct_)
    end
    end

    def initialize(@generic_engine_capabilities : UInt32, @factor : UInt32, @specific : Specific_e__Union_)
    end
  end

  @[Extern]
  struct WINBIO_EXTENDED_STORAGE_INFO
    property generic_storage_capabilities : UInt32
    property factor : UInt32
    property specific : Specific_e__Union_

    # Nested Type Specific_e__Union_
    @[Extern(union: true)]
    struct Specific_e__Union_
    property null : UInt32
    property facial_features : FacialFeatures_e__Struct_
    property fingerprint : Fingerprint_e__Struct_
    property iris : Iris_e__Struct_
    property voice : Voice_e__Struct_

      # Nested Type Iris_e__Struct_
      @[Extern]
      struct Iris_e__Struct_
    property capabilities : UInt32
    def initialize(@capabilities : UInt32)
    end
      end


      # Nested Type FacialFeatures_e__Struct_
      @[Extern]
      struct FacialFeatures_e__Struct_
    property capabilities : UInt32
    def initialize(@capabilities : UInt32)
    end
      end


      # Nested Type Fingerprint_e__Struct_
      @[Extern]
      struct Fingerprint_e__Struct_
    property capabilities : UInt32
    def initialize(@capabilities : UInt32)
    end
      end


      # Nested Type Voice_e__Struct_
      @[Extern]
      struct Voice_e__Struct_
    property capabilities : UInt32
    def initialize(@capabilities : UInt32)
    end
      end

    def initialize(@null : UInt32, @facial_features : FacialFeatures_e__Struct_, @fingerprint : Fingerprint_e__Struct_, @iris : Iris_e__Struct_, @voice : Voice_e__Struct_)
    end
    end

    def initialize(@generic_storage_capabilities : UInt32, @factor : UInt32, @specific : Specific_e__Union_)
    end
  end

  @[Extern]
  struct WINBIO_EXTENDED_ENROLLMENT_STATUS
    property template_status : Win32cr::Foundation::HRESULT
    property reject_detail : UInt32
    property percent_complete : UInt32
    property factor : UInt32
    property sub_factor : UInt8
    property specific : Specific_e__Union_

    # Nested Type Specific_e__Union_
    @[Extern(union: true)]
    struct Specific_e__Union_
    property null : UInt32
    property facial_features : FacialFeatures_e__Struct_
    property fingerprint : Fingerprint_e__Struct_
    property iris : Iris_e__Struct_
    property voice : Voice_e__Struct_

      # Nested Type Voice_e__Struct_
      @[Extern]
      struct Voice_e__Struct_
    property reserved : UInt32
    def initialize(@reserved : UInt32)
    end
      end


      # Nested Type Iris_e__Struct_
      @[Extern]
      struct Iris_e__Struct_
    property eye_bounding_box_1 : Win32cr::Foundation::RECT
    property eye_bounding_box_2 : Win32cr::Foundation::RECT
    property pupil_center_1 : Win32cr::Foundation::POINT
    property pupil_center_2 : Win32cr::Foundation::POINT
    property distance : Int32
    property grid_point_completion_percent : UInt32
    property grid_point_index : UInt16
    property point3_d : Point3D_e__Struct_
    property stop_capture_and_show_critical_feedback : Win32cr::Foundation::BOOL

        # Nested Type Point3D_e__Struct_
        @[Extern]
        struct Point3D_e__Struct_
    property x : Float64
    property y : Float64
    property z : Float64
    def initialize(@x : Float64, @y : Float64, @z : Float64)
    end
        end

    def initialize(@eye_bounding_box_1 : Win32cr::Foundation::RECT, @eye_bounding_box_2 : Win32cr::Foundation::RECT, @pupil_center_1 : Win32cr::Foundation::POINT, @pupil_center_2 : Win32cr::Foundation::POINT, @distance : Int32, @grid_point_completion_percent : UInt32, @grid_point_index : UInt16, @point3_d : Point3D_e__Struct_, @stop_capture_and_show_critical_feedback : Win32cr::Foundation::BOOL)
    end
      end


      # Nested Type FacialFeatures_e__Struct_
      @[Extern]
      struct FacialFeatures_e__Struct_
    property bounding_box : Win32cr::Foundation::RECT
    property distance : Int32
    property opaque_engine_data : OpaqueEngineData_e__Struct_

        # Nested Type OpaqueEngineData_e__Struct_
        @[Extern]
        struct OpaqueEngineData_e__Struct_
    property adapter_id : LibC::GUID
    property data : UInt32[78]
    def initialize(@adapter_id : LibC::GUID, @data : UInt32[78])
    end
        end

    def initialize(@bounding_box : Win32cr::Foundation::RECT, @distance : Int32, @opaque_engine_data : OpaqueEngineData_e__Struct_)
    end
      end


      # Nested Type Fingerprint_e__Struct_
      @[Extern]
      struct Fingerprint_e__Struct_
    property general_samples : UInt32
    property center : UInt32
    property top_edge : UInt32
    property bottom_edge : UInt32
    property left_edge : UInt32
    property right_edge : UInt32
    def initialize(@general_samples : UInt32, @center : UInt32, @top_edge : UInt32, @bottom_edge : UInt32, @left_edge : UInt32, @right_edge : UInt32)
    end
      end

    def initialize(@null : UInt32, @facial_features : FacialFeatures_e__Struct_, @fingerprint : Fingerprint_e__Struct_, @iris : Iris_e__Struct_, @voice : Voice_e__Struct_)
    end
    end

    def initialize(@template_status : Win32cr::Foundation::HRESULT, @reject_detail : UInt32, @percent_complete : UInt32, @factor : UInt32, @sub_factor : UInt8, @specific : Specific_e__Union_)
    end
  end

  @[Extern]
  struct WINBIO_EXTENDED_UNIT_STATUS
    property availability : UInt32
    property reason_code : UInt32
    def initialize(@availability : UInt32, @reason_code : UInt32)
    end
  end

  @[Extern]
  struct WINBIO_FP_BU_STATE
    property sensor_attached : Win32cr::Foundation::BOOL
    property creation_result : Win32cr::Foundation::HRESULT
    def initialize(@sensor_attached : Win32cr::Foundation::BOOL, @creation_result : Win32cr::Foundation::HRESULT)
    end
  end

  @[Extern]
  struct WINBIO_ANTI_SPOOF_POLICY
    property action : Win32cr::Devices::BiometricFramework::WINBIO_ANTI_SPOOF_POLICY_ACTION
    property source : Win32cr::Devices::BiometricFramework::WINBIO_POLICY_SOURCE
    def initialize(@action : Win32cr::Devices::BiometricFramework::WINBIO_ANTI_SPOOF_POLICY_ACTION, @source : Win32cr::Devices::BiometricFramework::WINBIO_POLICY_SOURCE)
    end
  end

  @[Extern]
  struct WINBIO_EXTENDED_ENROLLMENT_PARAMETERS
    property size : LibC::UIntPtrT
    property sub_factor : UInt8
    def initialize(@size : LibC::UIntPtrT, @sub_factor : UInt8)
    end
  end

  @[Extern]
  struct WINBIO_ACCOUNT_POLICY
    property identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY
    property anti_spoof_behavior : Win32cr::Devices::BiometricFramework::WINBIO_ANTI_SPOOF_POLICY_ACTION
    def initialize(@identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, @anti_spoof_behavior : Win32cr::Devices::BiometricFramework::WINBIO_ANTI_SPOOF_POLICY_ACTION)
    end
  end

  @[Extern]
  struct WINBIO_PROTECTION_POLICY
    property version : UInt32
    property identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY
    property database_id : LibC::GUID
    property user_state : UInt64
    property policy_size : LibC::UIntPtrT
    property policy : UInt8[128]
    def initialize(@version : UInt32, @identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, @database_id : LibC::GUID, @user_state : UInt64, @policy_size : LibC::UIntPtrT, @policy : UInt8[128])
    end
  end

  @[Extern]
  struct WINBIO_GESTURE_METADATA
    property size : LibC::UIntPtrT
    property biometric_type : UInt32
    property match_type : UInt32
    property protection_type : UInt32
    def initialize(@size : LibC::UIntPtrT, @biometric_type : UInt32, @match_type : UInt32, @protection_type : UInt32)
    end
  end

  @[Extern]
  struct WINBIO_ASYNC_RESULT
    property session_handle : UInt32
    property operation : UInt32
    property sequence_number : UInt64
    property time_stamp : Int64
    property api_status : Win32cr::Foundation::HRESULT
    property unit_id : UInt32
    property user_data : Void*
    property parameters : Parameters_e__Union_

    # Nested Type Parameters_e__Union_
    @[Extern(union: true)]
    struct Parameters_e__Union_
    property verify : Verify_e__Struct_
    property identify : Identify_e__Struct_
    property enroll_begin : EnrollBegin_e__Struct_
    property enroll_capture : EnrollCapture_e__Struct_
    property enroll_commit : EnrollCommit_e__Struct_
    property enum_enrollments : EnumEnrollments_e__Struct_
    property capture_sample : CaptureSample_e__Struct_
    property delete_template : DeleteTemplate_e__Struct_
    property get_property : GetProperty_e__Struct_
    property set_property : SetProperty_e__Struct_
    property get_event : GetEvent_e__Struct_
    property control_unit : ControlUnit_e__Struct_
    property enum_service_providers : EnumServiceProviders_e__Struct_
    property enum_biometric_units : EnumBiometricUnits_e__Struct_
    property enum_databases : EnumDatabases_e__Struct_
    property verify_and_release_ticket : VerifyAndReleaseTicket_e__Struct_
    property identify_and_release_ticket : IdentifyAndReleaseTicket_e__Struct_
    property enroll_select : EnrollSelect_e__Struct_
    property monitor_presence : MonitorPresence_e__Struct_
    property get_protection_policy : GetProtectionPolicy_e__Struct_
    property notify_unit_status_change : NotifyUnitStatusChange_e__Struct_

      # Nested Type GetProtectionPolicy_e__Struct_
      @[Extern]
      struct GetProtectionPolicy_e__Struct_
    property identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY
    property policy : Win32cr::Devices::BiometricFramework::WINBIO_PROTECTION_POLICY
    def initialize(@identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, @policy : Win32cr::Devices::BiometricFramework::WINBIO_PROTECTION_POLICY)
    end
      end


      # Nested Type EnrollSelect_e__Struct_
      @[Extern]
      struct EnrollSelect_e__Struct_
    property selector_value : UInt64
    def initialize(@selector_value : UInt64)
    end
      end


      # Nested Type VerifyAndReleaseTicket_e__Struct_
      @[Extern]
      struct VerifyAndReleaseTicket_e__Struct_
    property match : Win32cr::Foundation::BOOLEAN
    property reject_detail : UInt32
    property ticket : UInt64
    def initialize(@match : Win32cr::Foundation::BOOLEAN, @reject_detail : UInt32, @ticket : UInt64)
    end
      end


      # Nested Type EnumBiometricUnits_e__Struct_
      @[Extern]
      struct EnumBiometricUnits_e__Struct_
    property unit_count : LibC::UIntPtrT
    property unit_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_UNIT_SCHEMA*
    def initialize(@unit_count : LibC::UIntPtrT, @unit_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_UNIT_SCHEMA*)
    end
      end


      # Nested Type ControlUnit_e__Struct_
      @[Extern]
      struct ControlUnit_e__Struct_
    property component : Win32cr::Devices::BiometricFramework::WINBIO_COMPONENT
    property control_code : UInt32
    property operation_status : UInt32
    property send_buffer : UInt8*
    property send_buffer_size : LibC::UIntPtrT
    property receive_buffer : UInt8*
    property receive_buffer_size : LibC::UIntPtrT
    property receive_data_size : LibC::UIntPtrT
    def initialize(@component : Win32cr::Devices::BiometricFramework::WINBIO_COMPONENT, @control_code : UInt32, @operation_status : UInt32, @send_buffer : UInt8*, @send_buffer_size : LibC::UIntPtrT, @receive_buffer : UInt8*, @receive_buffer_size : LibC::UIntPtrT, @receive_data_size : LibC::UIntPtrT)
    end
      end


      # Nested Type SetProperty_e__Struct_
      @[Extern]
      struct SetProperty_e__Struct_
    property property_type : UInt32
    property property_id : UInt32
    property identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY
    property sub_factor : UInt8
    property property_buffer_size : LibC::UIntPtrT
    property property_buffer : Void*
    def initialize(@property_type : UInt32, @property_id : UInt32, @identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, @sub_factor : UInt8, @property_buffer_size : LibC::UIntPtrT, @property_buffer : Void*)
    end
      end


      # Nested Type DeleteTemplate_e__Struct_
      @[Extern]
      struct DeleteTemplate_e__Struct_
    property identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY
    property sub_factor : UInt8
    def initialize(@identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, @sub_factor : UInt8)
    end
      end


      # Nested Type EnumEnrollments_e__Struct_
      @[Extern]
      struct EnumEnrollments_e__Struct_
    property identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY
    property sub_factor_count : LibC::UIntPtrT
    property sub_factor_array : UInt8*
    def initialize(@identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, @sub_factor_count : LibC::UIntPtrT, @sub_factor_array : UInt8*)
    end
      end


      # Nested Type EnrollCapture_e__Struct_
      @[Extern]
      struct EnrollCapture_e__Struct_
    property reject_detail : UInt32
    def initialize(@reject_detail : UInt32)
    end
      end


      # Nested Type Identify_e__Struct_
      @[Extern]
      struct Identify_e__Struct_
    property identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY
    property sub_factor : UInt8
    property reject_detail : UInt32
    def initialize(@identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, @sub_factor : UInt8, @reject_detail : UInt32)
    end
      end


      # Nested Type MonitorPresence_e__Struct_
      @[Extern]
      struct MonitorPresence_e__Struct_
    property change_type : UInt32
    property presence_count : LibC::UIntPtrT
    property presence_array : Win32cr::Devices::BiometricFramework::WINBIO_PRESENCE*
    def initialize(@change_type : UInt32, @presence_count : LibC::UIntPtrT, @presence_array : Win32cr::Devices::BiometricFramework::WINBIO_PRESENCE*)
    end
      end


      # Nested Type EnumDatabases_e__Struct_
      @[Extern]
      struct EnumDatabases_e__Struct_
    property storage_count : LibC::UIntPtrT
    property storage_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_SCHEMA*
    def initialize(@storage_count : LibC::UIntPtrT, @storage_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_SCHEMA*)
    end
      end


      # Nested Type GetEvent_e__Struct_
      @[Extern]
      struct GetEvent_e__Struct_
    property event : Win32cr::Devices::BiometricFramework::WINBIO_EVENT
    def initialize(@event : Win32cr::Devices::BiometricFramework::WINBIO_EVENT)
    end
      end


      # Nested Type CaptureSample_e__Struct_
      @[Extern]
      struct CaptureSample_e__Struct_
    property sample : Win32cr::Devices::BiometricFramework::WINBIO_BIR*
    property sample_size : LibC::UIntPtrT
    property reject_detail : UInt32
    def initialize(@sample : Win32cr::Devices::BiometricFramework::WINBIO_BIR*, @sample_size : LibC::UIntPtrT, @reject_detail : UInt32)
    end
      end


      # Nested Type EnrollBegin_e__Struct_
      @[Extern]
      struct EnrollBegin_e__Struct_
    property sub_factor : UInt8
    def initialize(@sub_factor : UInt8)
    end
      end


      # Nested Type NotifyUnitStatusChange_e__Struct_
      @[Extern]
      struct NotifyUnitStatusChange_e__Struct_
    property extended_status : Win32cr::Devices::BiometricFramework::WINBIO_EXTENDED_UNIT_STATUS
    def initialize(@extended_status : Win32cr::Devices::BiometricFramework::WINBIO_EXTENDED_UNIT_STATUS)
    end
      end


      # Nested Type EnumServiceProviders_e__Struct_
      @[Extern]
      struct EnumServiceProviders_e__Struct_
    property bsp_count : LibC::UIntPtrT
    property bsp_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_BSP_SCHEMA*
    def initialize(@bsp_count : LibC::UIntPtrT, @bsp_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_BSP_SCHEMA*)
    end
      end


      # Nested Type EnrollCommit_e__Struct_
      @[Extern]
      struct EnrollCommit_e__Struct_
    property identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY
    property is_new_template : Win32cr::Foundation::BOOLEAN
    def initialize(@identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, @is_new_template : Win32cr::Foundation::BOOLEAN)
    end
      end


      # Nested Type GetProperty_e__Struct_
      @[Extern]
      struct GetProperty_e__Struct_
    property property_type : UInt32
    property property_id : UInt32
    property identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY
    property sub_factor : UInt8
    property property_buffer_size : LibC::UIntPtrT
    property property_buffer : Void*
    def initialize(@property_type : UInt32, @property_id : UInt32, @identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, @sub_factor : UInt8, @property_buffer_size : LibC::UIntPtrT, @property_buffer : Void*)
    end
      end


      # Nested Type IdentifyAndReleaseTicket_e__Struct_
      @[Extern]
      struct IdentifyAndReleaseTicket_e__Struct_
    property identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY
    property sub_factor : UInt8
    property reject_detail : UInt32
    property ticket : UInt64
    def initialize(@identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, @sub_factor : UInt8, @reject_detail : UInt32, @ticket : UInt64)
    end
      end


      # Nested Type Verify_e__Struct_
      @[Extern]
      struct Verify_e__Struct_
    property match : Win32cr::Foundation::BOOLEAN
    property reject_detail : UInt32
    def initialize(@match : Win32cr::Foundation::BOOLEAN, @reject_detail : UInt32)
    end
      end

    def initialize(@verify : Verify_e__Struct_, @identify : Identify_e__Struct_, @enroll_begin : EnrollBegin_e__Struct_, @enroll_capture : EnrollCapture_e__Struct_, @enroll_commit : EnrollCommit_e__Struct_, @enum_enrollments : EnumEnrollments_e__Struct_, @capture_sample : CaptureSample_e__Struct_, @delete_template : DeleteTemplate_e__Struct_, @get_property : GetProperty_e__Struct_, @set_property : SetProperty_e__Struct_, @get_event : GetEvent_e__Struct_, @control_unit : ControlUnit_e__Struct_, @enum_service_providers : EnumServiceProviders_e__Struct_, @enum_biometric_units : EnumBiometricUnits_e__Struct_, @enum_databases : EnumDatabases_e__Struct_, @verify_and_release_ticket : VerifyAndReleaseTicket_e__Struct_, @identify_and_release_ticket : IdentifyAndReleaseTicket_e__Struct_, @enroll_select : EnrollSelect_e__Struct_, @monitor_presence : MonitorPresence_e__Struct_, @get_protection_policy : GetProtectionPolicy_e__Struct_, @notify_unit_status_change : NotifyUnitStatusChange_e__Struct_)
    end
    end

    def initialize(@session_handle : UInt32, @operation : UInt32, @sequence_number : UInt64, @time_stamp : Int64, @api_status : Win32cr::Foundation::HRESULT, @unit_id : UInt32, @user_data : Void*, @parameters : Parameters_e__Union_)
    end
  end

  @[Extern]
  struct WINIBIO_SENSOR_CONTEXT_
    def initialize()
    end
  end

  @[Extern]
  struct WINIBIO_ENGINE_CONTEXT_
    def initialize()
    end
  end

  @[Extern]
  struct WINIBIO_STORAGE_CONTEXT_
    def initialize()
    end
  end

  @[Extern]
  struct WINBIO_STORAGE_RECORD
    property identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*
    property sub_factor : UInt8
    property index_vector : UInt32*
    property index_element_count : LibC::UIntPtrT
    property template_blob : UInt8*
    property template_blob_size : LibC::UIntPtrT
    property payload_blob : UInt8*
    property payload_blob_size : LibC::UIntPtrT
    def initialize(@identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, @sub_factor : UInt8, @index_vector : UInt32*, @index_element_count : LibC::UIntPtrT, @template_blob : UInt8*, @template_blob_size : LibC::UIntPtrT, @payload_blob : UInt8*, @payload_blob_size : LibC::UIntPtrT)
    end
  end

  @[Extern]
  struct WINBIO_PIPELINE
    property sensor_handle : Win32cr::Foundation::HANDLE
    property engine_handle : Win32cr::Foundation::HANDLE
    property storage_handle : Win32cr::Foundation::HANDLE
    property sensor_interface : Win32cr::Devices::BiometricFramework::WINBIO_SENSOR_INTERFACE*
    property engine_interface : Win32cr::Devices::BiometricFramework::WINBIO_ENGINE_INTERFACE*
    property storage_interface : Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_INTERFACE*
    property sensor_context : Win32cr::Devices::BiometricFramework::WINIBIO_SENSOR_CONTEXT_*
    property engine_context : Win32cr::Devices::BiometricFramework::WINIBIO_ENGINE_CONTEXT_*
    property storage_context : Win32cr::Devices::BiometricFramework::WINIBIO_STORAGE_CONTEXT_*
    property framework_interface : Win32cr::Devices::BiometricFramework::WINBIO_FRAMEWORK_INTERFACE*
    def initialize(@sensor_handle : Win32cr::Foundation::HANDLE, @engine_handle : Win32cr::Foundation::HANDLE, @storage_handle : Win32cr::Foundation::HANDLE, @sensor_interface : Win32cr::Devices::BiometricFramework::WINBIO_SENSOR_INTERFACE*, @engine_interface : Win32cr::Devices::BiometricFramework::WINBIO_ENGINE_INTERFACE*, @storage_interface : Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_INTERFACE*, @sensor_context : Win32cr::Devices::BiometricFramework::WINIBIO_SENSOR_CONTEXT_*, @engine_context : Win32cr::Devices::BiometricFramework::WINIBIO_ENGINE_CONTEXT_*, @storage_context : Win32cr::Devices::BiometricFramework::WINIBIO_STORAGE_CONTEXT_*, @framework_interface : Win32cr::Devices::BiometricFramework::WINBIO_FRAMEWORK_INTERFACE*)
    end
  end

  @[Extern]
  struct WINBIO_ADAPTER_INTERFACE_VERSION
    property major_version : UInt16
    property minor_version : UInt16
    def initialize(@major_version : UInt16, @minor_version : UInt16)
    end
  end

  @[Extern]
  struct WINBIO_SENSOR_INTERFACE
    property version : Win32cr::Devices::BiometricFramework::WINBIO_ADAPTER_INTERFACE_VERSION
    property type__ : UInt32
    property size : LibC::UIntPtrT
    property adapter_id : LibC::GUID
    property attach : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ATTACH_FN
    property detach : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_DETACH_FN
    property clear_context : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CLEAR_CONTEXT_FN
    property query_status : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_QUERY_STATUS_FN
    property reset : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_RESET_FN
    property set_mode : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_SET_MODE_FN
    property set_indicator_status : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_SET_INDICATOR_STATUS_FN
    property get_indicator_status : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_GET_INDICATOR_STATUS_FN
    property start_capture : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_START_CAPTURE_FN
    property finish_capture : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_FINISH_CAPTURE_FN
    property export_sensor_data : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN
    property cancel : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CANCEL_FN
    property push_data_to_engine : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN
    property control_unit : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CONTROL_UNIT_FN
    property control_unit_privileged : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN
    property notify_power_change : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN
    property pipeline_init : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PIPELINE_INIT_FN
    property pipeline_cleanup : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PIPELINE_CLEANUP_FN
    property activate : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ACTIVATE_FN
    property deactivate : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_DEACTIVATE_FN
    property query_extended_info : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN
    property query_calibration_formats : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN
    property set_calibration_format : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN
    property accept_calibration_data : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN
    property async_import_raw_buffer : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN
    property async_import_secure_buffer : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN
    property query_private_sensor_type : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN
    property connect_secure : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CONNECT_SECURE_FN
    property start_capture_ex : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_START_CAPTURE_EX_FN
    property start_notify_wake : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_START_NOTIFY_WAKE_FN
    property finish_notify_wake : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_FINISH_NOTIFY_WAKE_FN
    def initialize(@version : Win32cr::Devices::BiometricFramework::WINBIO_ADAPTER_INTERFACE_VERSION, @type__ : UInt32, @size : LibC::UIntPtrT, @adapter_id : LibC::GUID, @attach : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ATTACH_FN, @detach : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_DETACH_FN, @clear_context : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CLEAR_CONTEXT_FN, @query_status : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_QUERY_STATUS_FN, @reset : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_RESET_FN, @set_mode : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_SET_MODE_FN, @set_indicator_status : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_SET_INDICATOR_STATUS_FN, @get_indicator_status : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_GET_INDICATOR_STATUS_FN, @start_capture : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_START_CAPTURE_FN, @finish_capture : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_FINISH_CAPTURE_FN, @export_sensor_data : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN, @cancel : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CANCEL_FN, @push_data_to_engine : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN, @control_unit : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CONTROL_UNIT_FN, @control_unit_privileged : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN, @notify_power_change : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN, @pipeline_init : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PIPELINE_INIT_FN, @pipeline_cleanup : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PIPELINE_CLEANUP_FN, @activate : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ACTIVATE_FN, @deactivate : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_DEACTIVATE_FN, @query_extended_info : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN, @query_calibration_formats : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN, @set_calibration_format : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN, @accept_calibration_data : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN, @async_import_raw_buffer : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN, @async_import_secure_buffer : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN, @query_private_sensor_type : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN, @connect_secure : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CONNECT_SECURE_FN, @start_capture_ex : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_START_CAPTURE_EX_FN, @start_notify_wake : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_START_NOTIFY_WAKE_FN, @finish_notify_wake : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_FINISH_NOTIFY_WAKE_FN)
    end
  end

  @[Extern]
  struct WINBIO_ENGINE_INTERFACE
    property version : Win32cr::Devices::BiometricFramework::WINBIO_ADAPTER_INTERFACE_VERSION
    property type__ : UInt32
    property size : LibC::UIntPtrT
    property adapter_id : LibC::GUID
    property attach : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_ATTACH_FN
    property detach : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_DETACH_FN
    property clear_context : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CLEAR_CONTEXT_FN
    property query_preferred_format : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN
    property query_index_vector_size : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN
    property query_hash_algorithms : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN
    property set_hash_algorithm : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_SET_HASH_ALGORITHM_FN
    property query_sample_hint : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN
    property accept_sample_data : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN
    property export_engine_data : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN
    property verify_feature_set : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_VERIFY_FEATURE_SET_FN
    property identify_feature_set : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN
    property create_enrollment : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CREATE_ENROLLMENT_FN
    property update_enrollment : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_UPDATE_ENROLLMENT_FN
    property get_enrollment_status : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN
    property get_enrollment_hash : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_GET_ENROLLMENT_HASH_FN
    property check_for_duplicate : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN
    property commit_enrollment : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_COMMIT_ENROLLMENT_FN
    property discard_enrollment : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_DISCARD_ENROLLMENT_FN
    property control_unit : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CONTROL_UNIT_FN
    property control_unit_privileged : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CONTROL_UNIT_PRIVILEGED_FN
    property notify_power_change : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_NOTIFY_POWER_CHANGE_FN
    property reserved_1 : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_RESERVED_1_FN
    property pipeline_init : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_PIPELINE_INIT_FN
    property pipeline_cleanup : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_PIPELINE_CLEANUP_FN
    property activate : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_ACTIVATE_FN
    property deactivate : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_DEACTIVATE_FN
    property query_extended_info : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_EXTENDED_INFO_FN
    property identify_all : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_IDENTIFY_ALL_FN
    property set_enrollment_selector : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN
    property set_enrollment_parameters : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN
    property query_extended_enrollment_status : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_EXTENDED_ENROLLMENT_STATUS_FN
    property refresh_cache : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_REFRESH_CACHE_FN
    property select_calibration_format : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN
    property query_calibration_data : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN
    property set_account_policy : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN
    property create_key : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CREATE_KEY_FN
    property identify_feature_set_secure : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN
    property accept_private_sensor_type_info : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN
    property create_enrollment_authenticated : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CREATE_ENROLLMENT_AUTHENTICATED_FN
    property identify_feature_set_authenticated : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN
    def initialize(@version : Win32cr::Devices::BiometricFramework::WINBIO_ADAPTER_INTERFACE_VERSION, @type__ : UInt32, @size : LibC::UIntPtrT, @adapter_id : LibC::GUID, @attach : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_ATTACH_FN, @detach : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_DETACH_FN, @clear_context : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CLEAR_CONTEXT_FN, @query_preferred_format : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN, @query_index_vector_size : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN, @query_hash_algorithms : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN, @set_hash_algorithm : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_SET_HASH_ALGORITHM_FN, @query_sample_hint : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN, @accept_sample_data : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN, @export_engine_data : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN, @verify_feature_set : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_VERIFY_FEATURE_SET_FN, @identify_feature_set : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN, @create_enrollment : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CREATE_ENROLLMENT_FN, @update_enrollment : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_UPDATE_ENROLLMENT_FN, @get_enrollment_status : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN, @get_enrollment_hash : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_GET_ENROLLMENT_HASH_FN, @check_for_duplicate : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN, @commit_enrollment : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_COMMIT_ENROLLMENT_FN, @discard_enrollment : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_DISCARD_ENROLLMENT_FN, @control_unit : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CONTROL_UNIT_FN, @control_unit_privileged : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CONTROL_UNIT_PRIVILEGED_FN, @notify_power_change : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_NOTIFY_POWER_CHANGE_FN, @reserved_1 : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_RESERVED_1_FN, @pipeline_init : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_PIPELINE_INIT_FN, @pipeline_cleanup : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_PIPELINE_CLEANUP_FN, @activate : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_ACTIVATE_FN, @deactivate : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_DEACTIVATE_FN, @query_extended_info : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_EXTENDED_INFO_FN, @identify_all : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_IDENTIFY_ALL_FN, @set_enrollment_selector : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN, @set_enrollment_parameters : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN, @query_extended_enrollment_status : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_EXTENDED_ENROLLMENT_STATUS_FN, @refresh_cache : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_REFRESH_CACHE_FN, @select_calibration_format : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN, @query_calibration_data : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN, @set_account_policy : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN, @create_key : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CREATE_KEY_FN, @identify_feature_set_secure : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN, @accept_private_sensor_type_info : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN, @create_enrollment_authenticated : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CREATE_ENROLLMENT_AUTHENTICATED_FN, @identify_feature_set_authenticated : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN)
    end
  end

  @[Extern]
  struct WINBIO_STORAGE_INTERFACE
    property version : Win32cr::Devices::BiometricFramework::WINBIO_ADAPTER_INTERFACE_VERSION
    property type__ : UInt32
    property size : LibC::UIntPtrT
    property adapter_id : LibC::GUID
    property attach : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ATTACH_FN
    property detach : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DETACH_FN
    property clear_context : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CLEAR_CONTEXT_FN
    property create_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CREATE_DATABASE_FN
    property erase_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ERASE_DATABASE_FN
    property open_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_OPEN_DATABASE_FN
    property close_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CLOSE_DATABASE_FN
    property get_data_format : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_GET_DATA_FORMAT_FN
    property get_database_size : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_GET_DATABASE_SIZE_FN
    property add_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ADD_RECORD_FN
    property delete_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DELETE_RECORD_FN
    property query_by_subject : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_QUERY_BY_SUBJECT_FN
    property query_by_content : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_QUERY_BY_CONTENT_FN
    property get_record_count : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_GET_RECORD_COUNT_FN
    property first_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_FIRST_RECORD_FN
    property next_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_NEXT_RECORD_FN
    property get_current_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_GET_CURRENT_RECORD_FN
    property control_unit : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CONTROL_UNIT_FN
    property control_unit_privileged : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CONTROL_UNIT_PRIVILEGED_FN
    property notify_power_change : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN
    property pipeline_init : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_PIPELINE_INIT_FN
    property pipeline_cleanup : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_PIPELINE_CLEANUP_FN
    property activate : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ACTIVATE_FN
    property deactivate : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DEACTIVATE_FN
    property query_extended_info : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN
    property notify_database_change : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN
    property reserved1 : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_RESERVED_1_FN
    property reserved2 : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_RESERVED_2_FN
    property update_record_begin : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN
    property update_record_commit : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_UPDATE_RECORD_COMMIT_FN
    def initialize(@version : Win32cr::Devices::BiometricFramework::WINBIO_ADAPTER_INTERFACE_VERSION, @type__ : UInt32, @size : LibC::UIntPtrT, @adapter_id : LibC::GUID, @attach : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ATTACH_FN, @detach : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DETACH_FN, @clear_context : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CLEAR_CONTEXT_FN, @create_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CREATE_DATABASE_FN, @erase_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ERASE_DATABASE_FN, @open_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_OPEN_DATABASE_FN, @close_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CLOSE_DATABASE_FN, @get_data_format : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_GET_DATA_FORMAT_FN, @get_database_size : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_GET_DATABASE_SIZE_FN, @add_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ADD_RECORD_FN, @delete_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DELETE_RECORD_FN, @query_by_subject : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_QUERY_BY_SUBJECT_FN, @query_by_content : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_QUERY_BY_CONTENT_FN, @get_record_count : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_GET_RECORD_COUNT_FN, @first_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_FIRST_RECORD_FN, @next_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_NEXT_RECORD_FN, @get_current_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_GET_CURRENT_RECORD_FN, @control_unit : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CONTROL_UNIT_FN, @control_unit_privileged : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CONTROL_UNIT_PRIVILEGED_FN, @notify_power_change : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN, @pipeline_init : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_PIPELINE_INIT_FN, @pipeline_cleanup : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_PIPELINE_CLEANUP_FN, @activate : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ACTIVATE_FN, @deactivate : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DEACTIVATE_FN, @query_extended_info : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN, @notify_database_change : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN, @reserved1 : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_RESERVED_1_FN, @reserved2 : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_RESERVED_2_FN, @update_record_begin : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN, @update_record_commit : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_UPDATE_RECORD_COMMIT_FN)
    end
  end

  @[Extern]
  struct WINBIO_FRAMEWORK_INTERFACE
    property version : Win32cr::Devices::BiometricFramework::WINBIO_ADAPTER_INTERFACE_VERSION
    property type__ : UInt32
    property size : LibC::UIntPtrT
    property adapter_id : LibC::GUID
    property set_unit_status : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_SET_UNIT_STATUS_FN
    property vsm_storage_attach : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ATTACH_FN
    property vsm_storage_detach : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DETACH_FN
    property vsm_storage_clear_context : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CLEAR_CONTEXT_FN
    property vsm_storage_create_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CREATE_DATABASE_FN
    property vsm_storage_open_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_OPEN_DATABASE_FN
    property vsm_storage_close_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CLOSE_DATABASE_FN
    property vsm_storage_delete_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DELETE_RECORD_FN
    property vsm_storage_notify_power_change : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN
    property vsm_storage_pipeline_init : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_PIPELINE_INIT_FN
    property vsm_storage_pipeline_cleanup : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_PIPELINE_CLEANUP_FN
    property vsm_storage_activate : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ACTIVATE_FN
    property vsm_storage_deactivate : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DEACTIVATE_FN
    property vsm_storage_query_extended_info : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN
    property vsm_storage_cache_clear : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_CLEAR_FN
    property vsm_storage_cache_import_begin : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_BEGIN_FN
    property vsm_storage_cache_import_next : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_NEXT_FN
    property vsm_storage_cache_import_end : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_END_FN
    property vsm_storage_cache_export_begin : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_BEGIN_FN
    property vsm_storage_cache_export_next : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_NEXT_FN
    property vsm_storage_cache_export_end : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_END_FN
    property vsm_sensor_attach : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ATTACH_FN
    property vsm_sensor_detach : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_DETACH_FN
    property vsm_sensor_clear_context : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CLEAR_CONTEXT_FN
    property vsm_sensor_push_data_to_engine : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN
    property vsm_sensor_notify_power_change : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN
    property vsm_sensor_pipeline_init : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PIPELINE_INIT_FN
    property vsm_sensor_pipeline_cleanup : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PIPELINE_CLEANUP_FN
    property vsm_sensor_activate : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ACTIVATE_FN
    property vsm_sensor_deactivate : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_DEACTIVATE_FN
    property vsm_sensor_async_import_raw_buffer : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN
    property vsm_sensor_async_import_secure_buffer : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN
    property reserved1 : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_1_FN
    property reserved2 : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_2_FN
    property reserved3 : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_3_FN
    property reserved4 : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_RESERVED_1_FN
    property reserved5 : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_RESERVED_2_FN
    property allocate_memory : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_ALLOCATE_MEMORY_FN
    property free_memory : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_FREE_MEMORY_FN
    property get_property : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_GET_PROPERTY_FN
    property lock_and_validate_secure_buffer : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_LOCK_AND_VALIDATE_SECURE_BUFFER_FN
    property release_secure_buffer : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_RELEASE_SECURE_BUFFER_FN
    property query_authorized_enrollments : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_QUERY_AUTHORIZED_ENROLLMENTS_FN
    property decrypt_sample : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_DECRYPT_SAMPLE_FN
    def initialize(@version : Win32cr::Devices::BiometricFramework::WINBIO_ADAPTER_INTERFACE_VERSION, @type__ : UInt32, @size : LibC::UIntPtrT, @adapter_id : LibC::GUID, @set_unit_status : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_SET_UNIT_STATUS_FN, @vsm_storage_attach : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ATTACH_FN, @vsm_storage_detach : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DETACH_FN, @vsm_storage_clear_context : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CLEAR_CONTEXT_FN, @vsm_storage_create_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CREATE_DATABASE_FN, @vsm_storage_open_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_OPEN_DATABASE_FN, @vsm_storage_close_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CLOSE_DATABASE_FN, @vsm_storage_delete_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DELETE_RECORD_FN, @vsm_storage_notify_power_change : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN, @vsm_storage_pipeline_init : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_PIPELINE_INIT_FN, @vsm_storage_pipeline_cleanup : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_PIPELINE_CLEANUP_FN, @vsm_storage_activate : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ACTIVATE_FN, @vsm_storage_deactivate : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DEACTIVATE_FN, @vsm_storage_query_extended_info : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN, @vsm_storage_cache_clear : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_CLEAR_FN, @vsm_storage_cache_import_begin : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_BEGIN_FN, @vsm_storage_cache_import_next : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_NEXT_FN, @vsm_storage_cache_import_end : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_END_FN, @vsm_storage_cache_export_begin : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_BEGIN_FN, @vsm_storage_cache_export_next : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_NEXT_FN, @vsm_storage_cache_export_end : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_END_FN, @vsm_sensor_attach : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ATTACH_FN, @vsm_sensor_detach : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_DETACH_FN, @vsm_sensor_clear_context : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CLEAR_CONTEXT_FN, @vsm_sensor_push_data_to_engine : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN, @vsm_sensor_notify_power_change : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN, @vsm_sensor_pipeline_init : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PIPELINE_INIT_FN, @vsm_sensor_pipeline_cleanup : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PIPELINE_CLEANUP_FN, @vsm_sensor_activate : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ACTIVATE_FN, @vsm_sensor_deactivate : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_DEACTIVATE_FN, @vsm_sensor_async_import_raw_buffer : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN, @vsm_sensor_async_import_secure_buffer : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN, @reserved1 : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_1_FN, @reserved2 : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_2_FN, @reserved3 : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_3_FN, @reserved4 : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_RESERVED_1_FN, @reserved5 : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_RESERVED_2_FN, @allocate_memory : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_ALLOCATE_MEMORY_FN, @free_memory : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_FREE_MEMORY_FN, @get_property : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_GET_PROPERTY_FN, @lock_and_validate_secure_buffer : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_LOCK_AND_VALIDATE_SECURE_BUFFER_FN, @release_secure_buffer : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_RELEASE_SECURE_BUFFER_FN, @query_authorized_enrollments : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_QUERY_AUTHORIZED_ENROLLMENTS_FN, @decrypt_sample : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_DECRYPT_SAMPLE_FN)
    end
  end

  @[Extern]
  struct WINBIO_SENSOR_ATTRIBUTES
    property payload_size : UInt32
    property win_bio_hresult : Win32cr::Foundation::HRESULT
    property win_bio_version : Win32cr::Devices::BiometricFramework::WINBIO_VERSION
    property sensor_type : UInt32
    property sensor_sub_type : UInt32
    property capabilities : UInt32
    property manufacturer_name : UInt16[256]
    property model_name : UInt16[256]
    property serial_number : UInt16[256]
    property firmware_version : Win32cr::Devices::BiometricFramework::WINBIO_VERSION
    property supported_format_entries : UInt32
    property supported_format : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT*
    def initialize(@payload_size : UInt32, @win_bio_hresult : Win32cr::Foundation::HRESULT, @win_bio_version : Win32cr::Devices::BiometricFramework::WINBIO_VERSION, @sensor_type : UInt32, @sensor_sub_type : UInt32, @capabilities : UInt32, @manufacturer_name : UInt16[256], @model_name : UInt16[256], @serial_number : UInt16[256], @firmware_version : Win32cr::Devices::BiometricFramework::WINBIO_VERSION, @supported_format_entries : UInt32, @supported_format : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT*)
    end
  end

  @[Extern]
  struct WINBIO_DATA
    property size : UInt32
    property data : UInt8*
    def initialize(@size : UInt32, @data : UInt8*)
    end
  end

  @[Extern]
  struct WINBIO_UPDATE_FIRMWARE
    property payload_size : UInt32
    property firmware_data : Win32cr::Devices::BiometricFramework::WINBIO_DATA
    def initialize(@payload_size : UInt32, @firmware_data : Win32cr::Devices::BiometricFramework::WINBIO_DATA)
    end
  end

  @[Extern]
  struct WINBIO_CALIBRATION_INFO
    property payload_size : UInt32
    property win_bio_hresult : Win32cr::Foundation::HRESULT
    property calibration_data : Win32cr::Devices::BiometricFramework::WINBIO_DATA
    def initialize(@payload_size : UInt32, @win_bio_hresult : Win32cr::Foundation::HRESULT, @calibration_data : Win32cr::Devices::BiometricFramework::WINBIO_DATA)
    end
  end

  @[Extern]
  struct WINBIO_DIAGNOSTICS
    property payload_size : UInt32
    property win_bio_hresult : Win32cr::Foundation::HRESULT
    property sensor_status : UInt32
    property vendor_diagnostics : Win32cr::Devices::BiometricFramework::WINBIO_DATA
    def initialize(@payload_size : UInt32, @win_bio_hresult : Win32cr::Foundation::HRESULT, @sensor_status : UInt32, @vendor_diagnostics : Win32cr::Devices::BiometricFramework::WINBIO_DATA)
    end
  end

  @[Extern]
  struct WINBIO_BLANK_PAYLOAD
    property payload_size : UInt32
    property win_bio_hresult : Win32cr::Foundation::HRESULT
    def initialize(@payload_size : UInt32, @win_bio_hresult : Win32cr::Foundation::HRESULT)
    end
  end

  @[Extern]
  struct WINBIO_CAPTURE_PARAMETERS
    property payload_size : UInt32
    property purpose : UInt8
    property format : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT
    property vendor_format : LibC::GUID
    property flags : UInt8
    def initialize(@payload_size : UInt32, @purpose : UInt8, @format : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT, @vendor_format : LibC::GUID, @flags : UInt8)
    end
  end

  @[Extern]
  struct WINBIO_CAPTURE_DATA
    property payload_size : UInt32
    property win_bio_hresult : Win32cr::Foundation::HRESULT
    property sensor_status : UInt32
    property reject_detail : UInt32
    property capture_data : Win32cr::Devices::BiometricFramework::WINBIO_DATA
    def initialize(@payload_size : UInt32, @win_bio_hresult : Win32cr::Foundation::HRESULT, @sensor_status : UInt32, @reject_detail : UInt32, @capture_data : Win32cr::Devices::BiometricFramework::WINBIO_DATA)
    end
  end

  @[Extern]
  struct WINBIO_SUPPORTED_ALGORITHMS
    property payload_size : UInt32
    property win_bio_hresult : Win32cr::Foundation::HRESULT
    property number_of_algorithms : UInt32
    property algorithm_data : Win32cr::Devices::BiometricFramework::WINBIO_DATA
    def initialize(@payload_size : UInt32, @win_bio_hresult : Win32cr::Foundation::HRESULT, @number_of_algorithms : UInt32, @algorithm_data : Win32cr::Devices::BiometricFramework::WINBIO_DATA)
    end
  end

  @[Extern]
  struct WINBIO_GET_INDICATOR
    property payload_size : UInt32
    property win_bio_hresult : Win32cr::Foundation::HRESULT
    property indicator_status : UInt32
    def initialize(@payload_size : UInt32, @win_bio_hresult : Win32cr::Foundation::HRESULT, @indicator_status : UInt32)
    end
  end

  @[Extern]
  struct WINBIO_SET_INDICATOR
    property payload_size : UInt32
    property indicator_status : UInt32
    def initialize(@payload_size : UInt32, @indicator_status : UInt32)
    end
  end

  @[Extern]
  struct WINBIO_PRIVATE_SENSOR_TYPE_INFO
    property payload_size : UInt32
    property win_bio_hresult : Win32cr::Foundation::HRESULT
    property private_sensor_type_info : Win32cr::Devices::BiometricFramework::WINBIO_DATA
    def initialize(@payload_size : UInt32, @win_bio_hresult : Win32cr::Foundation::HRESULT, @private_sensor_type_info : Win32cr::Devices::BiometricFramework::WINBIO_DATA)
    end
  end

  @[Extern]
  struct WINBIO_ENCRYPTED_CAPTURE_PARAMS
    property payload_size : UInt32
    property purpose : UInt8
    property format : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT
    property vendor_format : LibC::GUID
    property flags : UInt8
    property nonce_size : UInt32
    def initialize(@payload_size : UInt32, @purpose : UInt8, @format : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT, @vendor_format : LibC::GUID, @flags : UInt8, @nonce_size : UInt32)
    end
  end

  @[Extern]
  struct WINBIO_NOTIFY_WAKE
    property payload_size : UInt32
    property win_bio_hresult : Win32cr::Foundation::HRESULT
    property reason : UInt32
    def initialize(@payload_size : UInt32, @win_bio_hresult : Win32cr::Foundation::HRESULT, @reason : UInt32)
    end
  end

  def winBioEnumServiceProviders(factor : UInt32, bsp_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_BSP_SCHEMA**, bsp_count : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
    C.WinBioEnumServiceProviders(factor, bsp_schema_array, bsp_count)
  end

  def winBioEnumBiometricUnits(factor : UInt32, unit_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_UNIT_SCHEMA**, unit_count : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
    C.WinBioEnumBiometricUnits(factor, unit_schema_array, unit_count)
  end

  def winBioEnumDatabases(factor : UInt32, storage_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_SCHEMA**, storage_count : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
    C.WinBioEnumDatabases(factor, storage_schema_array, storage_count)
  end

  def winBioAsyncOpenFramework(notification_method : Win32cr::Devices::BiometricFramework::WINBIO_ASYNC_NOTIFICATION_METHOD, target_window : Win32cr::Foundation::HWND, message_code : UInt32, callback_routine : Win32cr::Devices::BiometricFramework::PWINBIO_ASYNC_COMPLETION_CALLBACK, user_data : Void*, asynchronous_open : Win32cr::Foundation::BOOL, framework_handle : UInt32*) : Win32cr::Foundation::HRESULT
    C.WinBioAsyncOpenFramework(notification_method, target_window, message_code, callback_routine, user_data, asynchronous_open, framework_handle)
  end

  def winBioCloseFramework(framework_handle : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioCloseFramework(framework_handle)
  end

  def winBioAsyncEnumServiceProviders(framework_handle : UInt32, factor : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioAsyncEnumServiceProviders(framework_handle, factor)
  end

  def winBioAsyncEnumBiometricUnits(framework_handle : UInt32, factor : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioAsyncEnumBiometricUnits(framework_handle, factor)
  end

  def winBioAsyncEnumDatabases(framework_handle : UInt32, factor : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioAsyncEnumDatabases(framework_handle, factor)
  end

  def winBioAsyncMonitorFrameworkChanges(framework_handle : UInt32, change_types : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioAsyncMonitorFrameworkChanges(framework_handle, change_types)
  end

  def winBioOpenSession(factor : UInt32, pool_type : Win32cr::Devices::BiometricFramework::WINBIO_POOL, flags : UInt32, unit_array : UInt32*, unit_count : LibC::UIntPtrT, database_id : LibC::GUID*, session_handle : UInt32*) : Win32cr::Foundation::HRESULT
    C.WinBioOpenSession(factor, pool_type, flags, unit_array, unit_count, database_id, session_handle)
  end

  def winBioAsyncOpenSession(factor : UInt32, pool_type : Win32cr::Devices::BiometricFramework::WINBIO_POOL, flags : UInt32, unit_array : UInt32*, unit_count : LibC::UIntPtrT, database_id : LibC::GUID*, notification_method : Win32cr::Devices::BiometricFramework::WINBIO_ASYNC_NOTIFICATION_METHOD, target_window : Win32cr::Foundation::HWND, message_code : UInt32, callback_routine : Win32cr::Devices::BiometricFramework::PWINBIO_ASYNC_COMPLETION_CALLBACK, user_data : Void*, asynchronous_open : Win32cr::Foundation::BOOL, session_handle : UInt32*) : Win32cr::Foundation::HRESULT
    C.WinBioAsyncOpenSession(factor, pool_type, flags, unit_array, unit_count, database_id, notification_method, target_window, message_code, callback_routine, user_data, asynchronous_open, session_handle)
  end

  def winBioCloseSession(session_handle : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioCloseSession(session_handle)
  end

  def winBioVerify(session_handle : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8, unit_id : UInt32*, match : UInt8*, reject_detail : UInt32*) : Win32cr::Foundation::HRESULT
    C.WinBioVerify(session_handle, identity, sub_factor, unit_id, match, reject_detail)
  end

  def winBioVerifyWithCallback(session_handle : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8, verify_callback : Win32cr::Devices::BiometricFramework::PWINBIO_VERIFY_CALLBACK, verify_callback_context : Void*) : Win32cr::Foundation::HRESULT
    C.WinBioVerifyWithCallback(session_handle, identity, sub_factor, verify_callback, verify_callback_context)
  end

  def winBioIdentify(session_handle : UInt32, unit_id : UInt32*, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8*, reject_detail : UInt32*) : Win32cr::Foundation::HRESULT
    C.WinBioIdentify(session_handle, unit_id, identity, sub_factor, reject_detail)
  end

  def winBioIdentifyWithCallback(session_handle : UInt32, identify_callback : Win32cr::Devices::BiometricFramework::PWINBIO_IDENTIFY_CALLBACK, identify_callback_context : Void*) : Win32cr::Foundation::HRESULT
    C.WinBioIdentifyWithCallback(session_handle, identify_callback, identify_callback_context)
  end

  def winBioWait(session_handle : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioWait(session_handle)
  end

  def winBioCancel(session_handle : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioCancel(session_handle)
  end

  def winBioLocateSensor(session_handle : UInt32, unit_id : UInt32*) : Win32cr::Foundation::HRESULT
    C.WinBioLocateSensor(session_handle, unit_id)
  end

  def winBioLocateSensorWithCallback(session_handle : UInt32, locate_callback : Win32cr::Devices::BiometricFramework::PWINBIO_LOCATE_SENSOR_CALLBACK, locate_callback_context : Void*) : Win32cr::Foundation::HRESULT
    C.WinBioLocateSensorWithCallback(session_handle, locate_callback, locate_callback_context)
  end

  def winBioEnrollBegin(session_handle : UInt32, sub_factor : UInt8, unit_id : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioEnrollBegin(session_handle, sub_factor, unit_id)
  end

  def winBioEnrollSelect(session_handle : UInt32, selector_value : UInt64) : Win32cr::Foundation::HRESULT
    C.WinBioEnrollSelect(session_handle, selector_value)
  end

  def winBioEnrollCapture(session_handle : UInt32, reject_detail : UInt32*) : Win32cr::Foundation::HRESULT
    C.WinBioEnrollCapture(session_handle, reject_detail)
  end

  def winBioEnrollCaptureWithCallback(session_handle : UInt32, enroll_callback : Win32cr::Devices::BiometricFramework::PWINBIO_ENROLL_CAPTURE_CALLBACK, enroll_callback_context : Void*) : Win32cr::Foundation::HRESULT
    C.WinBioEnrollCaptureWithCallback(session_handle, enroll_callback, enroll_callback_context)
  end

  def winBioEnrollCommit(session_handle : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, is_new_template : UInt8*) : Win32cr::Foundation::HRESULT
    C.WinBioEnrollCommit(session_handle, identity, is_new_template)
  end

  def winBioEnrollDiscard(session_handle : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioEnrollDiscard(session_handle)
  end

  def winBioEnumEnrollments(session_handle : UInt32, unit_id : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor_array : UInt8**, sub_factor_count : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
    C.WinBioEnumEnrollments(session_handle, unit_id, identity, sub_factor_array, sub_factor_count)
  end

  def winBioImproveBegin(session_handle : UInt32, unit_id : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioImproveBegin(session_handle, unit_id)
  end

  def winBioImproveEnd(session_handle : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioImproveEnd(session_handle)
  end

  def winBioRegisterEventMonitor(session_handle : UInt32, event_mask : UInt32, event_callback : Win32cr::Devices::BiometricFramework::PWINBIO_EVENT_CALLBACK, event_callback_context : Void*) : Win32cr::Foundation::HRESULT
    C.WinBioRegisterEventMonitor(session_handle, event_mask, event_callback, event_callback_context)
  end

  def winBioUnregisterEventMonitor(session_handle : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioUnregisterEventMonitor(session_handle)
  end

  def winBioMonitorPresence(session_handle : UInt32, unit_id : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioMonitorPresence(session_handle, unit_id)
  end

  def winBioCaptureSample(session_handle : UInt32, purpose : UInt8, flags : UInt8, unit_id : UInt32*, sample : Win32cr::Devices::BiometricFramework::WINBIO_BIR**, sample_size : LibC::UIntPtrT*, reject_detail : UInt32*) : Win32cr::Foundation::HRESULT
    C.WinBioCaptureSample(session_handle, purpose, flags, unit_id, sample, sample_size, reject_detail)
  end

  def winBioCaptureSampleWithCallback(session_handle : UInt32, purpose : UInt8, flags : UInt8, capture_callback : Win32cr::Devices::BiometricFramework::PWINBIO_CAPTURE_CALLBACK, capture_callback_context : Void*) : Win32cr::Foundation::HRESULT
    C.WinBioCaptureSampleWithCallback(session_handle, purpose, flags, capture_callback, capture_callback_context)
  end

  def winBioDeleteTemplate(session_handle : UInt32, unit_id : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8) : Win32cr::Foundation::HRESULT
    C.WinBioDeleteTemplate(session_handle, unit_id, identity, sub_factor)
  end

  def winBioLockUnit(session_handle : UInt32, unit_id : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioLockUnit(session_handle, unit_id)
  end

  def winBioUnlockUnit(session_handle : UInt32, unit_id : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioUnlockUnit(session_handle, unit_id)
  end

  def winBioControlUnit(session_handle : UInt32, unit_id : UInt32, component : Win32cr::Devices::BiometricFramework::WINBIO_COMPONENT, control_code : UInt32, send_buffer : UInt8*, send_buffer_size : LibC::UIntPtrT, receive_buffer : UInt8*, receive_buffer_size : LibC::UIntPtrT, receive_data_size : LibC::UIntPtrT*, operation_status : UInt32*) : Win32cr::Foundation::HRESULT
    C.WinBioControlUnit(session_handle, unit_id, component, control_code, send_buffer, send_buffer_size, receive_buffer, receive_buffer_size, receive_data_size, operation_status)
  end

  def winBioControlUnitPrivileged(session_handle : UInt32, unit_id : UInt32, component : Win32cr::Devices::BiometricFramework::WINBIO_COMPONENT, control_code : UInt32, send_buffer : UInt8*, send_buffer_size : LibC::UIntPtrT, receive_buffer : UInt8*, receive_buffer_size : LibC::UIntPtrT, receive_data_size : LibC::UIntPtrT*, operation_status : UInt32*) : Win32cr::Foundation::HRESULT
    C.WinBioControlUnitPrivileged(session_handle, unit_id, component, control_code, send_buffer, send_buffer_size, receive_buffer, receive_buffer_size, receive_data_size, operation_status)
  end

  def winBioGetProperty(session_handle : UInt32, property_type : UInt32, property_id : UInt32, unit_id : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8, property_buffer : Void**, property_buffer_size : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
    C.WinBioGetProperty(session_handle, property_type, property_id, unit_id, identity, sub_factor, property_buffer, property_buffer_size)
  end

  def winBioSetProperty(session_handle : UInt32, property_type : UInt32, property_id : UInt32, unit_id : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8, property_buffer : Void*, property_buffer_size : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT
    C.WinBioSetProperty(session_handle, property_type, property_id, unit_id, identity, sub_factor, property_buffer, property_buffer_size)
  end

  def winBioFree(address : Void*) : Win32cr::Foundation::HRESULT
    C.WinBioFree(address)
  end

  def winBioSetCredential(type__ : Win32cr::Devices::BiometricFramework::WINBIO_CREDENTIAL_TYPE, credential : UInt8*, credential_size : LibC::UIntPtrT, format : Win32cr::Devices::BiometricFramework::WINBIO_CREDENTIAL_FORMAT) : Win32cr::Foundation::HRESULT
    C.WinBioSetCredential(type__, credential, credential_size, format)
  end

  def winBioRemoveCredential(identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, type__ : Win32cr::Devices::BiometricFramework::WINBIO_CREDENTIAL_TYPE) : Win32cr::Foundation::HRESULT
    C.WinBioRemoveCredential(identity, type__)
  end

  def winBioRemoveAllCredentials : Win32cr::Foundation::HRESULT
    C.WinBioRemoveAllCredentials
  end

  def winBioRemoveAllDomainCredentials : Win32cr::Foundation::HRESULT
    C.WinBioRemoveAllDomainCredentials
  end

  def winBioGetCredentialState(identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, type__ : Win32cr::Devices::BiometricFramework::WINBIO_CREDENTIAL_TYPE, credential_state : Win32cr::Devices::BiometricFramework::WINBIO_CREDENTIAL_STATE*) : Win32cr::Foundation::HRESULT
    C.WinBioGetCredentialState(identity, type__, credential_state)
  end

  def winBioLogonIdentifiedUser(session_handle : UInt32) : Win32cr::Foundation::HRESULT
    C.WinBioLogonIdentifiedUser(session_handle)
  end

  def winBioGetEnrolledFactors(account_owner : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, enrolled_factors : UInt32*) : Win32cr::Foundation::HRESULT
    C.WinBioGetEnrolledFactors(account_owner, enrolled_factors)
  end

  def winBioGetEnabledSetting(value : UInt8*, source : Win32cr::Devices::BiometricFramework::WINBIO_SETTING_SOURCE*) : Void
    C.WinBioGetEnabledSetting(value, source)
  end

  def winBioGetLogonSetting(value : UInt8*, source : Win32cr::Devices::BiometricFramework::WINBIO_SETTING_SOURCE*) : Void
    C.WinBioGetLogonSetting(value, source)
  end

  def winBioGetDomainLogonSetting(value : UInt8*, source : Win32cr::Devices::BiometricFramework::WINBIO_SETTING_SOURCE*) : Void
    C.WinBioGetDomainLogonSetting(value, source)
  end

  def winBioAcquireFocus : Win32cr::Foundation::HRESULT
    C.WinBioAcquireFocus
  end

  def winBioReleaseFocus : Win32cr::Foundation::HRESULT
    C.WinBioReleaseFocus
  end

  @[Link("winbio")]
  lib C
    # :nodoc:
    fun WinBioEnumServiceProviders(factor : UInt32, bsp_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_BSP_SCHEMA**, bsp_count : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioEnumBiometricUnits(factor : UInt32, unit_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_UNIT_SCHEMA**, unit_count : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioEnumDatabases(factor : UInt32, storage_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_SCHEMA**, storage_count : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioAsyncOpenFramework(notification_method : Win32cr::Devices::BiometricFramework::WINBIO_ASYNC_NOTIFICATION_METHOD, target_window : Win32cr::Foundation::HWND, message_code : UInt32, callback_routine : Win32cr::Devices::BiometricFramework::PWINBIO_ASYNC_COMPLETION_CALLBACK, user_data : Void*, asynchronous_open : Win32cr::Foundation::BOOL, framework_handle : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioCloseFramework(framework_handle : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioAsyncEnumServiceProviders(framework_handle : UInt32, factor : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioAsyncEnumBiometricUnits(framework_handle : UInt32, factor : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioAsyncEnumDatabases(framework_handle : UInt32, factor : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioAsyncMonitorFrameworkChanges(framework_handle : UInt32, change_types : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioOpenSession(factor : UInt32, pool_type : Win32cr::Devices::BiometricFramework::WINBIO_POOL, flags : UInt32, unit_array : UInt32*, unit_count : LibC::UIntPtrT, database_id : LibC::GUID*, session_handle : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioAsyncOpenSession(factor : UInt32, pool_type : Win32cr::Devices::BiometricFramework::WINBIO_POOL, flags : UInt32, unit_array : UInt32*, unit_count : LibC::UIntPtrT, database_id : LibC::GUID*, notification_method : Win32cr::Devices::BiometricFramework::WINBIO_ASYNC_NOTIFICATION_METHOD, target_window : Win32cr::Foundation::HWND, message_code : UInt32, callback_routine : Win32cr::Devices::BiometricFramework::PWINBIO_ASYNC_COMPLETION_CALLBACK, user_data : Void*, asynchronous_open : Win32cr::Foundation::BOOL, session_handle : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioCloseSession(session_handle : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioVerify(session_handle : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8, unit_id : UInt32*, match : UInt8*, reject_detail : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioVerifyWithCallback(session_handle : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8, verify_callback : Win32cr::Devices::BiometricFramework::PWINBIO_VERIFY_CALLBACK, verify_callback_context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioIdentify(session_handle : UInt32, unit_id : UInt32*, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8*, reject_detail : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioIdentifyWithCallback(session_handle : UInt32, identify_callback : Win32cr::Devices::BiometricFramework::PWINBIO_IDENTIFY_CALLBACK, identify_callback_context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioWait(session_handle : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioCancel(session_handle : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioLocateSensor(session_handle : UInt32, unit_id : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioLocateSensorWithCallback(session_handle : UInt32, locate_callback : Win32cr::Devices::BiometricFramework::PWINBIO_LOCATE_SENSOR_CALLBACK, locate_callback_context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioEnrollBegin(session_handle : UInt32, sub_factor : UInt8, unit_id : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioEnrollSelect(session_handle : UInt32, selector_value : UInt64) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioEnrollCapture(session_handle : UInt32, reject_detail : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioEnrollCaptureWithCallback(session_handle : UInt32, enroll_callback : Win32cr::Devices::BiometricFramework::PWINBIO_ENROLL_CAPTURE_CALLBACK, enroll_callback_context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioEnrollCommit(session_handle : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, is_new_template : UInt8*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioEnrollDiscard(session_handle : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioEnumEnrollments(session_handle : UInt32, unit_id : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor_array : UInt8**, sub_factor_count : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioImproveBegin(session_handle : UInt32, unit_id : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioImproveEnd(session_handle : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioRegisterEventMonitor(session_handle : UInt32, event_mask : UInt32, event_callback : Win32cr::Devices::BiometricFramework::PWINBIO_EVENT_CALLBACK, event_callback_context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioUnregisterEventMonitor(session_handle : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioMonitorPresence(session_handle : UInt32, unit_id : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioCaptureSample(session_handle : UInt32, purpose : UInt8, flags : UInt8, unit_id : UInt32*, sample : Win32cr::Devices::BiometricFramework::WINBIO_BIR**, sample_size : LibC::UIntPtrT*, reject_detail : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioCaptureSampleWithCallback(session_handle : UInt32, purpose : UInt8, flags : UInt8, capture_callback : Win32cr::Devices::BiometricFramework::PWINBIO_CAPTURE_CALLBACK, capture_callback_context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioDeleteTemplate(session_handle : UInt32, unit_id : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioLockUnit(session_handle : UInt32, unit_id : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioUnlockUnit(session_handle : UInt32, unit_id : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioControlUnit(session_handle : UInt32, unit_id : UInt32, component : Win32cr::Devices::BiometricFramework::WINBIO_COMPONENT, control_code : UInt32, send_buffer : UInt8*, send_buffer_size : LibC::UIntPtrT, receive_buffer : UInt8*, receive_buffer_size : LibC::UIntPtrT, receive_data_size : LibC::UIntPtrT*, operation_status : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioControlUnitPrivileged(session_handle : UInt32, unit_id : UInt32, component : Win32cr::Devices::BiometricFramework::WINBIO_COMPONENT, control_code : UInt32, send_buffer : UInt8*, send_buffer_size : LibC::UIntPtrT, receive_buffer : UInt8*, receive_buffer_size : LibC::UIntPtrT, receive_data_size : LibC::UIntPtrT*, operation_status : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioGetProperty(session_handle : UInt32, property_type : UInt32, property_id : UInt32, unit_id : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8, property_buffer : Void**, property_buffer_size : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioSetProperty(session_handle : UInt32, property_type : UInt32, property_id : UInt32, unit_id : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8, property_buffer : Void*, property_buffer_size : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioFree(address : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioSetCredential(type__ : Win32cr::Devices::BiometricFramework::WINBIO_CREDENTIAL_TYPE, credential : UInt8*, credential_size : LibC::UIntPtrT, format : Win32cr::Devices::BiometricFramework::WINBIO_CREDENTIAL_FORMAT) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioRemoveCredential(identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, type__ : Win32cr::Devices::BiometricFramework::WINBIO_CREDENTIAL_TYPE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioRemoveAllCredentials : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioRemoveAllDomainCredentials : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioGetCredentialState(identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, type__ : Win32cr::Devices::BiometricFramework::WINBIO_CREDENTIAL_TYPE, credential_state : Win32cr::Devices::BiometricFramework::WINBIO_CREDENTIAL_STATE*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioLogonIdentifiedUser(session_handle : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioGetEnrolledFactors(account_owner : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, enrolled_factors : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioGetEnabledSetting(value : UInt8*, source : Win32cr::Devices::BiometricFramework::WINBIO_SETTING_SOURCE*) : Void

    # :nodoc:
    fun WinBioGetLogonSetting(value : UInt8*, source : Win32cr::Devices::BiometricFramework::WINBIO_SETTING_SOURCE*) : Void

    # :nodoc:
    fun WinBioGetDomainLogonSetting(value : UInt8*, source : Win32cr::Devices::BiometricFramework::WINBIO_SETTING_SOURCE*) : Void

    # :nodoc:
    fun WinBioAcquireFocus : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun WinBioReleaseFocus : Win32cr::Foundation::HRESULT

  end
end