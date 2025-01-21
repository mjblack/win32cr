require "./../foundation.cr"
require "./../system/io.cr"

module Win32cr::Devices::BiometricFramework
  alias PWINBIO_ASYNC_COMPLETION_CALLBACK = Proc(Win32cr::Devices::BiometricFramework::WINBIO_ASYNC_RESULT*, Void)*

  alias PWINBIO_VERIFY_CALLBACK = Proc(Void*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Foundation::BOOLEAN, UInt32, Void)*

  alias PWINBIO_IDENTIFY_CALLBACK = Proc(Void*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8, UInt32, Void)*

  alias PWINBIO_LOCATE_SENSOR_CALLBACK = Proc(Void*, Win32cr::Foundation::HRESULT, UInt32, Void)*

  alias PWINBIO_ENROLL_CAPTURE_CALLBACK = Proc(Void*, Win32cr::Foundation::HRESULT, UInt32, Void)*

  alias PWINBIO_EVENT_CALLBACK = Proc(Void*, Win32cr::Foundation::HRESULT, Win32cr::Devices::BiometricFramework::WINBIO_EVENT*, Void)*

  alias PWINBIO_CAPTURE_CALLBACK = Proc(Void*, Win32cr::Foundation::HRESULT, UInt32, Win32cr::Devices::BiometricFramework::WINBIO_BIR*, LibC::UIntPtrT, UInt32, Void)*

  alias PIBIO_SENSOR_ATTACH_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_DETACH_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_CLEAR_CONTEXT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_QUERY_STATUS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_RESET_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_SET_MODE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_SET_INDICATOR_STATUS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_GET_INDICATOR_STATUS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_START_CAPTURE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8, Win32cr::System::IO::OVERLAPPED**, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_FINISH_CAPTURE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_BIR**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_CANCEL_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8, UInt8, UInt32*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_CONTROL_UNIT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_PIPELINE_INIT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_PIPELINE_CLEANUP_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_ACTIVATE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_DEACTIVATE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_EXTENDED_SENSOR_INFO*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, UInt8**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID, UInt8*, LibC::UIntPtrT, UInt8**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_CONNECT_SECURE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_SECURE_CONNECTION_PARAMS*, Win32cr::Devices::BiometricFramework::WINBIO_SECURE_CONNECTION_DATA**, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_START_CAPTURE_EX_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8, UInt8*, LibC::UIntPtrT, UInt8, Win32cr::System::IO::OVERLAPPED**, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_START_NOTIFY_WAKE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::System::IO::OVERLAPPED**, Win32cr::Foundation::HRESULT)*

  alias PIBIO_SENSOR_FINISH_NOTIFY_WAKE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32*, Win32cr::Foundation::HRESULT)*

  alias PWINBIO_QUERY_SENSOR_INTERFACE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_SENSOR_INTERFACE**, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_ATTACH_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_DETACH_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_CLEAR_CONTEXT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT*, LibC::GUID*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT*, LibC::UIntPtrT*, UInt8**, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_SET_HASH_ALGORITHM_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT, UInt8*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_BIR*, LibC::UIntPtrT, UInt8, UInt32*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8, Win32cr::Devices::BiometricFramework::WINBIO_BIR**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_VERIFY_FEATURE_SET_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8, Win32cr::Foundation::BOOLEAN*, UInt8**, LibC::UIntPtrT*, UInt8**, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8*, UInt8**, LibC::UIntPtrT*, UInt8**, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_CREATE_ENROLLMENT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_UPDATE_ENROLLMENT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_GET_ENROLLMENT_HASH_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8*, Win32cr::Foundation::BOOLEAN*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_COMMIT_ENROLLMENT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8, UInt8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_DISCARD_ENROLLMENT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_CONTROL_UNIT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_CONTROL_UNIT_PRIVILEGED_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_NOTIFY_POWER_CHANGE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_RESERVED_1_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_PIPELINE_INIT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_PIPELINE_CLEANUP_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_ACTIVATE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_DEACTIVATE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_QUERY_EXTENDED_INFO_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_EXTENDED_ENGINE_INFO*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_IDENTIFY_ALL_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT*, Win32cr::Devices::BiometricFramework::WINBIO_PRESENCE**, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt64, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_EXTENDED_ENROLLMENT_PARAMETERS*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_QUERY_EXTENDED_ENROLLMENT_STATUS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_EXTENDED_ENROLLMENT_STATUS*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_REFRESH_CACHE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID*, LibC::UIntPtrT, LibC::GUID*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::BOOLEAN*, UInt8*, LibC::UIntPtrT*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_ACCOUNT_POLICY*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_CREATE_KEY_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8*, UInt32*, UInt8**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_CREATE_ENROLLMENT_AUTHENTICATED_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8*, UInt32*, UInt8**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PWINBIO_QUERY_ENGINE_INTERFACE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_ENGINE_INTERFACE**, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_ATTACH_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_DETACH_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_CLEAR_CONTEXT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_CREATE_DATABASE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID*, UInt32, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_ERASE_DATABASE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_OPEN_DATABASE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_CLOSE_DATABASE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_GET_DATA_FORMAT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID*, Win32cr::Devices::BiometricFramework::WINBIO_VERSION*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_GET_DATABASE_SIZE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_ADD_RECORD_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_RECORD*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_DELETE_RECORD_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_QUERY_BY_SUBJECT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_QUERY_BY_CONTENT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8, UInt32*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_GET_RECORD_COUNT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_FIRST_RECORD_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_NEXT_RECORD_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_GET_CURRENT_RECORD_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_RECORD*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_CONTROL_UNIT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_CONTROL_UNIT_PRIVILEGED_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, UInt32*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_PIPELINE_INIT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_PIPELINE_CLEANUP_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_ACTIVATE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_DEACTIVATE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_EXTENDED_STORAGE_INFO*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::BOOLEAN, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_RESERVED_1_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt64*, UInt64*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_RESERVED_2_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8, Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_RECORD*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_STORAGE_UPDATE_RECORD_COMMIT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_RECORD*, Win32cr::Foundation::HRESULT)*

  alias PWINBIO_QUERY_STORAGE_INTERFACE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_INTERFACE**, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_SET_UNIT_STATUS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_EXTENDED_UNIT_STATUS*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_VSM_CACHE_CLEAR_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_BEGIN_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_NEXT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_END_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_BEGIN_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_NEXT_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_END_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_1_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_2_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_3_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_ALLOCATE_MEMORY_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::UIntPtrT, Void**, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_FREE_MEMORY_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Void*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_GET_PROPERTY_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt32, UInt32, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, UInt8, Void**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_LOCK_AND_VALIDATE_SECURE_BUFFER_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID, Void**, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_RELEASE_SECURE_BUFFER_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, LibC::GUID, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_VSM_QUERY_AUTHORIZED_ENROLLMENTS_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, LibC::UIntPtrT*, Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY**, Win32cr::Foundation::HRESULT)*

  alias PIBIO_FRAMEWORK_VSM_DECRYPT_SAMPLE_FN = Proc(Win32cr::Devices::BiometricFramework::WINBIO_PIPELINE*, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, UInt8*, LibC::UIntPtrT, Win32cr::Foundation::HRESULT)*

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
  record WINBIO_VERSION,
    major_version : UInt32,
    minor_version : UInt32

  @[Extern]
  record WINBIO_IDENTITY,
    type__ : UInt32,
    value : Value_e__Union_ do

    # Nested Type Value_e__Union_
    @[Extern(union: true)]
    record Value_e__Union_,
      null : UInt32,
      wildcard : UInt32,
      template_guid : LibC::GUID,
      account_sid : AccountSid_e__Struct_,
      secure_id : UInt8[32] do

      # Nested Type AccountSid_e__Struct_
      @[Extern]
      record AccountSid_e__Struct_,
        size : UInt32,
        data : UInt8[68]

    end

  end

  @[Extern]
  record WINBIO_SECURE_CONNECTION_PARAMS,
    payload_size : UInt32,
    version : UInt16,
    flags : UInt16

  @[Extern]
  record WINBIO_SECURE_CONNECTION_DATA,
    size : UInt32,
    version : UInt16,
    flags : UInt16,
    model_certificate_size : UInt32,
    intermediate_ca1_size : UInt32,
    intermediate_ca2_size : UInt32

  @[Extern]
  record WINBIO_BIR_DATA,
    size : UInt32,
    offset : UInt32

  @[Extern]
  record WINBIO_BIR,
    header_block : Win32cr::Devices::BiometricFramework::WINBIO_BIR_DATA,
    standard_data_block : Win32cr::Devices::BiometricFramework::WINBIO_BIR_DATA,
    vendor_data_block : Win32cr::Devices::BiometricFramework::WINBIO_BIR_DATA,
    signature_block : Win32cr::Devices::BiometricFramework::WINBIO_BIR_DATA

  @[Extern]
  record WINBIO_REGISTERED_FORMAT,
    owner : UInt16,
    type__ : UInt16

  @[Extern]
  record WINBIO_BIR_HEADER,
    valid_fields : UInt16,
    header_version : UInt8,
    patron_header_version : UInt8,
    data_flags : UInt8,
    type__ : UInt32,
    subtype : UInt8,
    purpose : UInt8,
    data_quality : Int8,
    creation_date : Win32cr::Foundation::LARGE_INTEGER,
    validity_period : ValidityPeriod_e__Struct_,
    biometric_data_format : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT,
    product_id : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT do

    # Nested Type ValidityPeriod_e__Struct_
    @[Extern]
    record ValidityPeriod_e__Struct_,
      begin_date : Win32cr::Foundation::LARGE_INTEGER,
      end_date : Win32cr::Foundation::LARGE_INTEGER

  end

  @[Extern]
  record WINBIO_BDB_ANSI_381_HEADER,
    record_length : UInt64,
    format_identifier : UInt32,
    version_number : UInt32,
    product_id : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT,
    capture_device_id : UInt16,
    image_acquisition_level : UInt16,
    horizontal_scan_resolution : UInt16,
    vertical_scan_resolution : UInt16,
    horizontal_image_resolution : UInt16,
    vertical_image_resolution : UInt16,
    element_count : UInt8,
    scale_units : UInt8,
    pixel_depth : UInt8,
    image_compression_alg : UInt8,
    reserved : UInt16

  @[Extern]
  record WINBIO_BDB_ANSI_381_RECORD,
    block_length : UInt32,
    horizontal_line_length : UInt16,
    vertical_line_length : UInt16,
    position : UInt8,
    count_of_views : UInt8,
    view_number : UInt8,
    image_quality : UInt8,
    impression_type : UInt8,
    reserved : UInt8

  @[Extern]
  record WINBIO_SECURE_BUFFER_HEADER_V1,
    type__ : UInt32,
    size : UInt32,
    flags : UInt32,
    validation_tag : UInt64

  @[Extern]
  record WINBIO_EVENT,
    type__ : UInt32,
    parameters : Parameters_e__Union_ do

    # Nested Type Parameters_e__Union_
    @[Extern(union: true)]
    record Parameters_e__Union_,
      unclaimed : Unclaimed_e__Struct_,
      unclaimed_identify : UnclaimedIdentify_e__Struct_,
      error : Error_e__Struct_ do

      # Nested Type UnclaimedIdentify_e__Struct_
      @[Extern]
      record UnclaimedIdentify_e__Struct_,
        unit_id : UInt32,
        identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY,
        sub_factor : UInt8,
        reject_detail : UInt32


      # Nested Type Unclaimed_e__Struct_
      @[Extern]
      record Unclaimed_e__Struct_,
        unit_id : UInt32,
        reject_detail : UInt32


      # Nested Type Error_e__Struct_
      @[Extern]
      record Error_e__Struct_,
        error_code : Win32cr::Foundation::HRESULT

    end

  end

  @[Extern(union: true)]
  record WINBIO_PRESENCE_PROPERTIES,
    facial_features : FacialFeatures_e__Struct_,
    iris : Iris_e__Struct_ do

    # Nested Type Iris_e__Struct_
    @[Extern]
    record Iris_e__Struct_,
      eye_bounding_box_1 : Win32cr::Foundation::RECT,
      eye_bounding_box_2 : Win32cr::Foundation::RECT,
      pupil_center_1 : Win32cr::Foundation::POINT,
      pupil_center_2 : Win32cr::Foundation::POINT,
      distance : Int32


    # Nested Type FacialFeatures_e__Struct_
    @[Extern]
    record FacialFeatures_e__Struct_,
      bounding_box : Win32cr::Foundation::RECT,
      distance : Int32,
      opaque_engine_data : OpaqueEngineData_e__Struct_ do

      # Nested Type OpaqueEngineData_e__Struct_
      @[Extern]
      record OpaqueEngineData_e__Struct_,
        adapter_id : LibC::GUID,
        data : UInt32[78]

    end

  end

  @[Extern]
  record WINBIO_PRESENCE,
    factor : UInt32,
    sub_factor : UInt8,
    status : Win32cr::Foundation::HRESULT,
    reject_detail : UInt32,
    identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY,
    tracking_id : UInt64,
    ticket : UInt64,
    properties : Win32cr::Devices::BiometricFramework::WINBIO_PRESENCE_PROPERTIES,
    authorization : Authorization_e__Struct_ do

    # Nested Type Authorization_e__Struct_
    @[Extern]
    record Authorization_e__Struct_,
      size : UInt32,
      data : UInt8[32]

  end

  @[Extern]
  record WINBIO_BSP_SCHEMA,
    biometric_factor : UInt32,
    bsp_id : LibC::GUID,
    description : UInt16[256],
    vendor : UInt16[256],
    version : Win32cr::Devices::BiometricFramework::WINBIO_VERSION

  @[Extern]
  record WINBIO_UNIT_SCHEMA,
    unit_id : UInt32,
    pool_type : UInt32,
    biometric_factor : UInt32,
    sensor_sub_type : UInt32,
    capabilities : UInt32,
    device_instance_id : UInt16[256],
    description : UInt16[256],
    manufacturer : UInt16[256],
    model : UInt16[256],
    serial_number : UInt16[256],
    firmware_version : Win32cr::Devices::BiometricFramework::WINBIO_VERSION

  @[Extern]
  record WINBIO_STORAGE_SCHEMA,
    biometric_factor : UInt32,
    database_id : LibC::GUID,
    data_format : LibC::GUID,
    attributes : UInt32,
    file_path : UInt16[256],
    connection_string : UInt16[256]

  @[Extern]
  record WINBIO_EXTENDED_SENSOR_INFO,
    generic_sensor_capabilities : UInt32,
    factor : UInt32,
    specific : Specific_e__Union_ do

    # Nested Type Specific_e__Union_
    @[Extern(union: true)]
    record Specific_e__Union_,
      null : UInt32,
      facial_features : FacialFeatures_e__Struct_,
      fingerprint : Fingerprint_e__Struct_,
      iris : Iris_e__Struct_,
      voice : Voice_e__Struct_ do

      # Nested Type Iris_e__Struct_
      @[Extern]
      record Iris_e__Struct_,
        frame_size : Win32cr::Foundation::RECT,
        frame_offset : Win32cr::Foundation::POINT,
        mandatory_orientation : UInt32


      # Nested Type FacialFeatures_e__Struct_
      @[Extern]
      record FacialFeatures_e__Struct_,
        frame_size : Win32cr::Foundation::RECT,
        frame_offset : Win32cr::Foundation::POINT,
        mandatory_orientation : UInt32,
        hardware_info : HardwareInfo_e__Struct_ do

        # Nested Type HardwareInfo_e__Struct_
        @[Extern]
        record HardwareInfo_e__Struct_,
          color_sensor_id : UInt16[260],
          infrared_sensor_id : UInt16[260],
          infrared_sensor_rotation_angle : UInt32

      end


      # Nested Type Fingerprint_e__Struct_
      @[Extern]
      record Fingerprint_e__Struct_,
        reserved : UInt32


      # Nested Type Voice_e__Struct_
      @[Extern]
      record Voice_e__Struct_,
        reserved : UInt32

    end

  end

  @[Extern]
  record WINBIO_EXTENDED_ENGINE_INFO,
    generic_engine_capabilities : UInt32,
    factor : UInt32,
    specific : Specific_e__Union_ do

    # Nested Type Specific_e__Union_
    @[Extern(union: true)]
    record Specific_e__Union_,
      null : UInt32,
      facial_features : FacialFeatures_e__Struct_,
      fingerprint : Fingerprint_e__Struct_,
      iris : Iris_e__Struct_,
      voice : Voice_e__Struct_ do

      # Nested Type Voice_e__Struct_
      @[Extern]
      record Voice_e__Struct_,
        capabilities : UInt32,
        enrollment_requirements : EnrollmentRequirements_e__Struct_ do

        # Nested Type EnrollmentRequirements_e__Struct_
        @[Extern]
        record EnrollmentRequirements_e__Struct_,
          null : UInt32

      end


      # Nested Type Iris_e__Struct_
      @[Extern]
      record Iris_e__Struct_,
        capabilities : UInt32,
        enrollment_requirements : EnrollmentRequirements_e__Struct_ do

        # Nested Type EnrollmentRequirements_e__Struct_
        @[Extern]
        record EnrollmentRequirements_e__Struct_,
          null : UInt32

      end


      # Nested Type Fingerprint_e__Struct_
      @[Extern]
      record Fingerprint_e__Struct_,
        capabilities : UInt32,
        enrollment_requirements : EnrollmentRequirements_e__Struct_ do

        # Nested Type EnrollmentRequirements_e__Struct_
        @[Extern]
        record EnrollmentRequirements_e__Struct_,
          general_samples : UInt32,
          center : UInt32,
          top_edge : UInt32,
          bottom_edge : UInt32,
          left_edge : UInt32,
          right_edge : UInt32

      end


      # Nested Type FacialFeatures_e__Struct_
      @[Extern]
      record FacialFeatures_e__Struct_,
        capabilities : UInt32,
        enrollment_requirements : EnrollmentRequirements_e__Struct_ do

        # Nested Type EnrollmentRequirements_e__Struct_
        @[Extern]
        record EnrollmentRequirements_e__Struct_,
          null : UInt32

      end

    end

  end

  @[Extern]
  record WINBIO_EXTENDED_STORAGE_INFO,
    generic_storage_capabilities : UInt32,
    factor : UInt32,
    specific : Specific_e__Union_ do

    # Nested Type Specific_e__Union_
    @[Extern(union: true)]
    record Specific_e__Union_,
      null : UInt32,
      facial_features : FacialFeatures_e__Struct_,
      fingerprint : Fingerprint_e__Struct_,
      iris : Iris_e__Struct_,
      voice : Voice_e__Struct_ do

      # Nested Type Iris_e__Struct_
      @[Extern]
      record Iris_e__Struct_,
        capabilities : UInt32


      # Nested Type FacialFeatures_e__Struct_
      @[Extern]
      record FacialFeatures_e__Struct_,
        capabilities : UInt32


      # Nested Type Fingerprint_e__Struct_
      @[Extern]
      record Fingerprint_e__Struct_,
        capabilities : UInt32


      # Nested Type Voice_e__Struct_
      @[Extern]
      record Voice_e__Struct_,
        capabilities : UInt32

    end

  end

  @[Extern]
  record WINBIO_EXTENDED_ENROLLMENT_STATUS,
    template_status : Win32cr::Foundation::HRESULT,
    reject_detail : UInt32,
    percent_complete : UInt32,
    factor : UInt32,
    sub_factor : UInt8,
    specific : Specific_e__Union_ do

    # Nested Type Specific_e__Union_
    @[Extern(union: true)]
    record Specific_e__Union_,
      null : UInt32,
      facial_features : FacialFeatures_e__Struct_,
      fingerprint : Fingerprint_e__Struct_,
      iris : Iris_e__Struct_,
      voice : Voice_e__Struct_ do

      # Nested Type Voice_e__Struct_
      @[Extern]
      record Voice_e__Struct_,
        reserved : UInt32


      # Nested Type Iris_e__Struct_
      @[Extern]
      record Iris_e__Struct_,
        eye_bounding_box_1 : Win32cr::Foundation::RECT,
        eye_bounding_box_2 : Win32cr::Foundation::RECT,
        pupil_center_1 : Win32cr::Foundation::POINT,
        pupil_center_2 : Win32cr::Foundation::POINT,
        distance : Int32,
        grid_point_completion_percent : UInt32,
        grid_point_index : UInt16,
        point3_d : Point3D_e__Struct_,
        stop_capture_and_show_critical_feedback : Win32cr::Foundation::BOOL do

        # Nested Type Point3D_e__Struct_
        @[Extern]
        record Point3D_e__Struct_,
          x : Float64,
          y : Float64,
          z : Float64

      end


      # Nested Type FacialFeatures_e__Struct_
      @[Extern]
      record FacialFeatures_e__Struct_,
        bounding_box : Win32cr::Foundation::RECT,
        distance : Int32,
        opaque_engine_data : OpaqueEngineData_e__Struct_ do

        # Nested Type OpaqueEngineData_e__Struct_
        @[Extern]
        record OpaqueEngineData_e__Struct_,
          adapter_id : LibC::GUID,
          data : UInt32[78]

      end


      # Nested Type Fingerprint_e__Struct_
      @[Extern]
      record Fingerprint_e__Struct_,
        general_samples : UInt32,
        center : UInt32,
        top_edge : UInt32,
        bottom_edge : UInt32,
        left_edge : UInt32,
        right_edge : UInt32

    end

  end

  @[Extern]
  record WINBIO_EXTENDED_UNIT_STATUS,
    availability : UInt32,
    reason_code : UInt32

  @[Extern]
  record WINBIO_FP_BU_STATE,
    sensor_attached : Win32cr::Foundation::BOOL,
    creation_result : Win32cr::Foundation::HRESULT

  @[Extern]
  record WINBIO_ANTI_SPOOF_POLICY,
    action : Win32cr::Devices::BiometricFramework::WINBIO_ANTI_SPOOF_POLICY_ACTION,
    source : Win32cr::Devices::BiometricFramework::WINBIO_POLICY_SOURCE

  @[Extern]
  record WINBIO_EXTENDED_ENROLLMENT_PARAMETERS,
    size : LibC::UIntPtrT,
    sub_factor : UInt8

  @[Extern]
  record WINBIO_ACCOUNT_POLICY,
    identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY,
    anti_spoof_behavior : Win32cr::Devices::BiometricFramework::WINBIO_ANTI_SPOOF_POLICY_ACTION

  @[Extern]
  record WINBIO_PROTECTION_POLICY,
    version : UInt32,
    identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY,
    database_id : LibC::GUID,
    user_state : UInt64,
    policy_size : LibC::UIntPtrT,
    policy : UInt8[128]

  @[Extern]
  record WINBIO_GESTURE_METADATA,
    size : LibC::UIntPtrT,
    biometric_type : UInt32,
    match_type : UInt32,
    protection_type : UInt32

  @[Extern]
  record WINBIO_ASYNC_RESULT,
    session_handle : UInt32,
    operation : UInt32,
    sequence_number : UInt64,
    time_stamp : Int64,
    api_status : Win32cr::Foundation::HRESULT,
    unit_id : UInt32,
    user_data : Void*,
    parameters : Parameters_e__Union_ do

    # Nested Type Parameters_e__Union_
    @[Extern(union: true)]
    record Parameters_e__Union_,
      verify : Verify_e__Struct_,
      identify : Identify_e__Struct_,
      enroll_begin : EnrollBegin_e__Struct_,
      enroll_capture : EnrollCapture_e__Struct_,
      enroll_commit : EnrollCommit_e__Struct_,
      enum_enrollments : EnumEnrollments_e__Struct_,
      capture_sample : CaptureSample_e__Struct_,
      delete_template : DeleteTemplate_e__Struct_,
      get_property : GetProperty_e__Struct_,
      set_property : SetProperty_e__Struct_,
      get_event : GetEvent_e__Struct_,
      control_unit : ControlUnit_e__Struct_,
      enum_service_providers : EnumServiceProviders_e__Struct_,
      enum_biometric_units : EnumBiometricUnits_e__Struct_,
      enum_databases : EnumDatabases_e__Struct_,
      verify_and_release_ticket : VerifyAndReleaseTicket_e__Struct_,
      identify_and_release_ticket : IdentifyAndReleaseTicket_e__Struct_,
      enroll_select : EnrollSelect_e__Struct_,
      monitor_presence : MonitorPresence_e__Struct_,
      get_protection_policy : GetProtectionPolicy_e__Struct_,
      notify_unit_status_change : NotifyUnitStatusChange_e__Struct_ do

      # Nested Type GetProtectionPolicy_e__Struct_
      @[Extern]
      record GetProtectionPolicy_e__Struct_,
        identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY,
        policy : Win32cr::Devices::BiometricFramework::WINBIO_PROTECTION_POLICY


      # Nested Type EnrollSelect_e__Struct_
      @[Extern]
      record EnrollSelect_e__Struct_,
        selector_value : UInt64


      # Nested Type VerifyAndReleaseTicket_e__Struct_
      @[Extern]
      record VerifyAndReleaseTicket_e__Struct_,
        match : Win32cr::Foundation::BOOLEAN,
        reject_detail : UInt32,
        ticket : UInt64


      # Nested Type EnumBiometricUnits_e__Struct_
      @[Extern]
      record EnumBiometricUnits_e__Struct_,
        unit_count : LibC::UIntPtrT,
        unit_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_UNIT_SCHEMA*


      # Nested Type ControlUnit_e__Struct_
      @[Extern]
      record ControlUnit_e__Struct_,
        component : Win32cr::Devices::BiometricFramework::WINBIO_COMPONENT,
        control_code : UInt32,
        operation_status : UInt32,
        send_buffer : UInt8*,
        send_buffer_size : LibC::UIntPtrT,
        receive_buffer : UInt8*,
        receive_buffer_size : LibC::UIntPtrT,
        receive_data_size : LibC::UIntPtrT


      # Nested Type SetProperty_e__Struct_
      @[Extern]
      record SetProperty_e__Struct_,
        property_type : UInt32,
        property_id : UInt32,
        identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY,
        sub_factor : UInt8,
        property_buffer_size : LibC::UIntPtrT,
        property_buffer : Void*


      # Nested Type DeleteTemplate_e__Struct_
      @[Extern]
      record DeleteTemplate_e__Struct_,
        identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY,
        sub_factor : UInt8


      # Nested Type EnumEnrollments_e__Struct_
      @[Extern]
      record EnumEnrollments_e__Struct_,
        identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY,
        sub_factor_count : LibC::UIntPtrT,
        sub_factor_array : UInt8*


      # Nested Type EnrollCapture_e__Struct_
      @[Extern]
      record EnrollCapture_e__Struct_,
        reject_detail : UInt32


      # Nested Type Identify_e__Struct_
      @[Extern]
      record Identify_e__Struct_,
        identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY,
        sub_factor : UInt8,
        reject_detail : UInt32


      # Nested Type MonitorPresence_e__Struct_
      @[Extern]
      record MonitorPresence_e__Struct_,
        change_type : UInt32,
        presence_count : LibC::UIntPtrT,
        presence_array : Win32cr::Devices::BiometricFramework::WINBIO_PRESENCE*


      # Nested Type EnumDatabases_e__Struct_
      @[Extern]
      record EnumDatabases_e__Struct_,
        storage_count : LibC::UIntPtrT,
        storage_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_SCHEMA*


      # Nested Type GetEvent_e__Struct_
      @[Extern]
      record GetEvent_e__Struct_,
        event : Win32cr::Devices::BiometricFramework::WINBIO_EVENT


      # Nested Type CaptureSample_e__Struct_
      @[Extern]
      record CaptureSample_e__Struct_,
        sample : Win32cr::Devices::BiometricFramework::WINBIO_BIR*,
        sample_size : LibC::UIntPtrT,
        reject_detail : UInt32


      # Nested Type EnrollBegin_e__Struct_
      @[Extern]
      record EnrollBegin_e__Struct_,
        sub_factor : UInt8


      # Nested Type NotifyUnitStatusChange_e__Struct_
      @[Extern]
      record NotifyUnitStatusChange_e__Struct_,
        extended_status : Win32cr::Devices::BiometricFramework::WINBIO_EXTENDED_UNIT_STATUS


      # Nested Type EnumServiceProviders_e__Struct_
      @[Extern]
      record EnumServiceProviders_e__Struct_,
        bsp_count : LibC::UIntPtrT,
        bsp_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_BSP_SCHEMA*


      # Nested Type EnrollCommit_e__Struct_
      @[Extern]
      record EnrollCommit_e__Struct_,
        identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY,
        is_new_template : Win32cr::Foundation::BOOLEAN


      # Nested Type GetProperty_e__Struct_
      @[Extern]
      record GetProperty_e__Struct_,
        property_type : UInt32,
        property_id : UInt32,
        identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY,
        sub_factor : UInt8,
        property_buffer_size : LibC::UIntPtrT,
        property_buffer : Void*


      # Nested Type IdentifyAndReleaseTicket_e__Struct_
      @[Extern]
      record IdentifyAndReleaseTicket_e__Struct_,
        identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY,
        sub_factor : UInt8,
        reject_detail : UInt32,
        ticket : UInt64


      # Nested Type Verify_e__Struct_
      @[Extern]
      record Verify_e__Struct_,
        match : Win32cr::Foundation::BOOLEAN,
        reject_detail : UInt32

    end

  end

  @[Extern]
  record WINIBIO_SENSOR_CONTEXT_
  @[Extern]
  record WINIBIO_ENGINE_CONTEXT_
  @[Extern]
  record WINIBIO_STORAGE_CONTEXT_
  @[Extern]
  record WINBIO_STORAGE_RECORD,
    identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*,
    sub_factor : UInt8,
    index_vector : UInt32*,
    index_element_count : LibC::UIntPtrT,
    template_blob : UInt8*,
    template_blob_size : LibC::UIntPtrT,
    payload_blob : UInt8*,
    payload_blob_size : LibC::UIntPtrT

  @[Extern]
  record WINBIO_PIPELINE,
    sensor_handle : Win32cr::Foundation::HANDLE,
    engine_handle : Win32cr::Foundation::HANDLE,
    storage_handle : Win32cr::Foundation::HANDLE,
    sensor_interface : Win32cr::Devices::BiometricFramework::WINBIO_SENSOR_INTERFACE*,
    engine_interface : Win32cr::Devices::BiometricFramework::WINBIO_ENGINE_INTERFACE*,
    storage_interface : Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_INTERFACE*,
    sensor_context : Win32cr::Devices::BiometricFramework::WINIBIO_SENSOR_CONTEXT_*,
    engine_context : Win32cr::Devices::BiometricFramework::WINIBIO_ENGINE_CONTEXT_*,
    storage_context : Win32cr::Devices::BiometricFramework::WINIBIO_STORAGE_CONTEXT_*,
    framework_interface : Win32cr::Devices::BiometricFramework::WINBIO_FRAMEWORK_INTERFACE*

  @[Extern]
  record WINBIO_ADAPTER_INTERFACE_VERSION,
    major_version : UInt16,
    minor_version : UInt16

  @[Extern]
  record WINBIO_SENSOR_INTERFACE,
    version : Win32cr::Devices::BiometricFramework::WINBIO_ADAPTER_INTERFACE_VERSION,
    type__ : UInt32,
    size : LibC::UIntPtrT,
    adapter_id : LibC::GUID,
    attach : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ATTACH_FN,
    detach : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_DETACH_FN,
    clear_context : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CLEAR_CONTEXT_FN,
    query_status : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_QUERY_STATUS_FN,
    reset : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_RESET_FN,
    set_mode : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_SET_MODE_FN,
    set_indicator_status : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_SET_INDICATOR_STATUS_FN,
    get_indicator_status : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_GET_INDICATOR_STATUS_FN,
    start_capture : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_START_CAPTURE_FN,
    finish_capture : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_FINISH_CAPTURE_FN,
    export_sensor_data : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_EXPORT_SENSOR_DATA_FN,
    cancel : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CANCEL_FN,
    push_data_to_engine : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN,
    control_unit : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CONTROL_UNIT_FN,
    control_unit_privileged : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CONTROL_UNIT_PRIVILEGED_FN,
    notify_power_change : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN,
    pipeline_init : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PIPELINE_INIT_FN,
    pipeline_cleanup : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PIPELINE_CLEANUP_FN,
    activate : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ACTIVATE_FN,
    deactivate : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_DEACTIVATE_FN,
    query_extended_info : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_QUERY_EXTENDED_INFO_FN,
    query_calibration_formats : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_QUERY_CALIBRATION_FORMATS_FN,
    set_calibration_format : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_SET_CALIBRATION_FORMAT_FN,
    accept_calibration_data : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ACCEPT_CALIBRATION_DATA_FN,
    async_import_raw_buffer : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN,
    async_import_secure_buffer : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN,
    query_private_sensor_type : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN,
    connect_secure : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CONNECT_SECURE_FN,
    start_capture_ex : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_START_CAPTURE_EX_FN,
    start_notify_wake : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_START_NOTIFY_WAKE_FN,
    finish_notify_wake : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_FINISH_NOTIFY_WAKE_FN

  @[Extern]
  record WINBIO_ENGINE_INTERFACE,
    version : Win32cr::Devices::BiometricFramework::WINBIO_ADAPTER_INTERFACE_VERSION,
    type__ : UInt32,
    size : LibC::UIntPtrT,
    adapter_id : LibC::GUID,
    attach : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_ATTACH_FN,
    detach : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_DETACH_FN,
    clear_context : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CLEAR_CONTEXT_FN,
    query_preferred_format : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN,
    query_index_vector_size : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_INDEX_VECTOR_SIZE_FN,
    query_hash_algorithms : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN,
    set_hash_algorithm : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_SET_HASH_ALGORITHM_FN,
    query_sample_hint : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_SAMPLE_HINT_FN,
    accept_sample_data : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_ACCEPT_SAMPLE_DATA_FN,
    export_engine_data : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_EXPORT_ENGINE_DATA_FN,
    verify_feature_set : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_VERIFY_FEATURE_SET_FN,
    identify_feature_set : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_IDENTIFY_FEATURE_SET_FN,
    create_enrollment : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CREATE_ENROLLMENT_FN,
    update_enrollment : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_UPDATE_ENROLLMENT_FN,
    get_enrollment_status : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_GET_ENROLLMENT_STATUS_FN,
    get_enrollment_hash : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_GET_ENROLLMENT_HASH_FN,
    check_for_duplicate : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN,
    commit_enrollment : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_COMMIT_ENROLLMENT_FN,
    discard_enrollment : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_DISCARD_ENROLLMENT_FN,
    control_unit : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CONTROL_UNIT_FN,
    control_unit_privileged : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CONTROL_UNIT_PRIVILEGED_FN,
    notify_power_change : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_NOTIFY_POWER_CHANGE_FN,
    reserved_1 : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_RESERVED_1_FN,
    pipeline_init : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_PIPELINE_INIT_FN,
    pipeline_cleanup : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_PIPELINE_CLEANUP_FN,
    activate : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_ACTIVATE_FN,
    deactivate : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_DEACTIVATE_FN,
    query_extended_info : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_EXTENDED_INFO_FN,
    identify_all : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_IDENTIFY_ALL_FN,
    set_enrollment_selector : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_SET_ENROLLMENT_SELECTOR_FN,
    set_enrollment_parameters : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_SET_ENROLLMENT_PARAMETERS_FN,
    query_extended_enrollment_status : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_EXTENDED_ENROLLMENT_STATUS_FN,
    refresh_cache : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_REFRESH_CACHE_FN,
    select_calibration_format : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_SELECT_CALIBRATION_FORMAT_FN,
    query_calibration_data : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_QUERY_CALIBRATION_DATA_FN,
    set_account_policy : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN,
    create_key : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CREATE_KEY_FN,
    identify_feature_set_secure : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_IDENTIFY_FEATURE_SET_SECURE_FN,
    accept_private_sensor_type_info : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN,
    create_enrollment_authenticated : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_CREATE_ENROLLMENT_AUTHENTICATED_FN,
    identify_feature_set_authenticated : Win32cr::Devices::BiometricFramework::PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN

  @[Extern]
  record WINBIO_STORAGE_INTERFACE,
    version : Win32cr::Devices::BiometricFramework::WINBIO_ADAPTER_INTERFACE_VERSION,
    type__ : UInt32,
    size : LibC::UIntPtrT,
    adapter_id : LibC::GUID,
    attach : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ATTACH_FN,
    detach : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DETACH_FN,
    clear_context : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CLEAR_CONTEXT_FN,
    create_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CREATE_DATABASE_FN,
    erase_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ERASE_DATABASE_FN,
    open_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_OPEN_DATABASE_FN,
    close_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CLOSE_DATABASE_FN,
    get_data_format : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_GET_DATA_FORMAT_FN,
    get_database_size : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_GET_DATABASE_SIZE_FN,
    add_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ADD_RECORD_FN,
    delete_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DELETE_RECORD_FN,
    query_by_subject : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_QUERY_BY_SUBJECT_FN,
    query_by_content : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_QUERY_BY_CONTENT_FN,
    get_record_count : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_GET_RECORD_COUNT_FN,
    first_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_FIRST_RECORD_FN,
    next_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_NEXT_RECORD_FN,
    get_current_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_GET_CURRENT_RECORD_FN,
    control_unit : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CONTROL_UNIT_FN,
    control_unit_privileged : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CONTROL_UNIT_PRIVILEGED_FN,
    notify_power_change : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN,
    pipeline_init : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_PIPELINE_INIT_FN,
    pipeline_cleanup : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_PIPELINE_CLEANUP_FN,
    activate : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ACTIVATE_FN,
    deactivate : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DEACTIVATE_FN,
    query_extended_info : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN,
    notify_database_change : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN,
    reserved1 : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_RESERVED_1_FN,
    reserved2 : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_RESERVED_2_FN,
    update_record_begin : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN,
    update_record_commit : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_UPDATE_RECORD_COMMIT_FN

  @[Extern]
  record WINBIO_FRAMEWORK_INTERFACE,
    version : Win32cr::Devices::BiometricFramework::WINBIO_ADAPTER_INTERFACE_VERSION,
    type__ : UInt32,
    size : LibC::UIntPtrT,
    adapter_id : LibC::GUID,
    set_unit_status : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_SET_UNIT_STATUS_FN,
    vsm_storage_attach : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ATTACH_FN,
    vsm_storage_detach : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DETACH_FN,
    vsm_storage_clear_context : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CLEAR_CONTEXT_FN,
    vsm_storage_create_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CREATE_DATABASE_FN,
    vsm_storage_open_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_OPEN_DATABASE_FN,
    vsm_storage_close_database : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_CLOSE_DATABASE_FN,
    vsm_storage_delete_record : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DELETE_RECORD_FN,
    vsm_storage_notify_power_change : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_NOTIFY_POWER_CHANGE_FN,
    vsm_storage_pipeline_init : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_PIPELINE_INIT_FN,
    vsm_storage_pipeline_cleanup : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_PIPELINE_CLEANUP_FN,
    vsm_storage_activate : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_ACTIVATE_FN,
    vsm_storage_deactivate : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_DEACTIVATE_FN,
    vsm_storage_query_extended_info : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN,
    vsm_storage_cache_clear : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_CLEAR_FN,
    vsm_storage_cache_import_begin : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_BEGIN_FN,
    vsm_storage_cache_import_next : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_NEXT_FN,
    vsm_storage_cache_import_end : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_IMPORT_END_FN,
    vsm_storage_cache_export_begin : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_BEGIN_FN,
    vsm_storage_cache_export_next : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_NEXT_FN,
    vsm_storage_cache_export_end : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_END_FN,
    vsm_sensor_attach : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ATTACH_FN,
    vsm_sensor_detach : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_DETACH_FN,
    vsm_sensor_clear_context : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_CLEAR_CONTEXT_FN,
    vsm_sensor_push_data_to_engine : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PUSH_DATA_TO_ENGINE_FN,
    vsm_sensor_notify_power_change : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_NOTIFY_POWER_CHANGE_FN,
    vsm_sensor_pipeline_init : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PIPELINE_INIT_FN,
    vsm_sensor_pipeline_cleanup : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_PIPELINE_CLEANUP_FN,
    vsm_sensor_activate : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ACTIVATE_FN,
    vsm_sensor_deactivate : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_DEACTIVATE_FN,
    vsm_sensor_async_import_raw_buffer : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN,
    vsm_sensor_async_import_secure_buffer : Win32cr::Devices::BiometricFramework::PIBIO_SENSOR_ASYNC_IMPORT_SECURE_BUFFER_FN,
    reserved1 : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_1_FN,
    reserved2 : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_2_FN,
    reserved3 : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_3_FN,
    reserved4 : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_RESERVED_1_FN,
    reserved5 : Win32cr::Devices::BiometricFramework::PIBIO_STORAGE_RESERVED_2_FN,
    allocate_memory : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_ALLOCATE_MEMORY_FN,
    free_memory : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_FREE_MEMORY_FN,
    get_property : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_GET_PROPERTY_FN,
    lock_and_validate_secure_buffer : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_LOCK_AND_VALIDATE_SECURE_BUFFER_FN,
    release_secure_buffer : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_RELEASE_SECURE_BUFFER_FN,
    query_authorized_enrollments : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_QUERY_AUTHORIZED_ENROLLMENTS_FN,
    decrypt_sample : Win32cr::Devices::BiometricFramework::PIBIO_FRAMEWORK_VSM_DECRYPT_SAMPLE_FN

  @[Extern]
  record WINBIO_SENSOR_ATTRIBUTES,
    payload_size : UInt32,
    win_bio_hresult : Win32cr::Foundation::HRESULT,
    win_bio_version : Win32cr::Devices::BiometricFramework::WINBIO_VERSION,
    sensor_type : UInt32,
    sensor_sub_type : UInt32,
    capabilities : UInt32,
    manufacturer_name : UInt16[256],
    model_name : UInt16[256],
    serial_number : UInt16[256],
    firmware_version : Win32cr::Devices::BiometricFramework::WINBIO_VERSION,
    supported_format_entries : UInt32,
    supported_format : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT*

  @[Extern]
  record WINBIO_DATA,
    size : UInt32,
    data : UInt8*

  @[Extern]
  record WINBIO_UPDATE_FIRMWARE,
    payload_size : UInt32,
    firmware_data : Win32cr::Devices::BiometricFramework::WINBIO_DATA

  @[Extern]
  record WINBIO_CALIBRATION_INFO,
    payload_size : UInt32,
    win_bio_hresult : Win32cr::Foundation::HRESULT,
    calibration_data : Win32cr::Devices::BiometricFramework::WINBIO_DATA

  @[Extern]
  record WINBIO_DIAGNOSTICS,
    payload_size : UInt32,
    win_bio_hresult : Win32cr::Foundation::HRESULT,
    sensor_status : UInt32,
    vendor_diagnostics : Win32cr::Devices::BiometricFramework::WINBIO_DATA

  @[Extern]
  record WINBIO_BLANK_PAYLOAD,
    payload_size : UInt32,
    win_bio_hresult : Win32cr::Foundation::HRESULT

  @[Extern]
  record WINBIO_CAPTURE_PARAMETERS,
    payload_size : UInt32,
    purpose : UInt8,
    format : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT,
    vendor_format : LibC::GUID,
    flags : UInt8

  @[Extern]
  record WINBIO_CAPTURE_DATA,
    payload_size : UInt32,
    win_bio_hresult : Win32cr::Foundation::HRESULT,
    sensor_status : UInt32,
    reject_detail : UInt32,
    capture_data : Win32cr::Devices::BiometricFramework::WINBIO_DATA

  @[Extern]
  record WINBIO_SUPPORTED_ALGORITHMS,
    payload_size : UInt32,
    win_bio_hresult : Win32cr::Foundation::HRESULT,
    number_of_algorithms : UInt32,
    algorithm_data : Win32cr::Devices::BiometricFramework::WINBIO_DATA

  @[Extern]
  record WINBIO_GET_INDICATOR,
    payload_size : UInt32,
    win_bio_hresult : Win32cr::Foundation::HRESULT,
    indicator_status : UInt32

  @[Extern]
  record WINBIO_SET_INDICATOR,
    payload_size : UInt32,
    indicator_status : UInt32

  @[Extern]
  record WINBIO_PRIVATE_SENSOR_TYPE_INFO,
    payload_size : UInt32,
    win_bio_hresult : Win32cr::Foundation::HRESULT,
    private_sensor_type_info : Win32cr::Devices::BiometricFramework::WINBIO_DATA

  @[Extern]
  record WINBIO_ENCRYPTED_CAPTURE_PARAMS,
    payload_size : UInt32,
    purpose : UInt8,
    format : Win32cr::Devices::BiometricFramework::WINBIO_REGISTERED_FORMAT,
    vendor_format : LibC::GUID,
    flags : UInt8,
    nonce_size : UInt32

  @[Extern]
  record WINBIO_NOTIFY_WAKE,
    payload_size : UInt32,
    win_bio_hresult : Win32cr::Foundation::HRESULT,
    reason : UInt32

  @[Link("winbio")]
  lib C
    fun WinBioEnumServiceProviders(factor : UInt32, bsp_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_BSP_SCHEMA**, bsp_count : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    fun WinBioEnumBiometricUnits(factor : UInt32, unit_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_UNIT_SCHEMA**, unit_count : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    fun WinBioEnumDatabases(factor : UInt32, storage_schema_array : Win32cr::Devices::BiometricFramework::WINBIO_STORAGE_SCHEMA**, storage_count : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    fun WinBioAsyncOpenFramework(notification_method : Win32cr::Devices::BiometricFramework::WINBIO_ASYNC_NOTIFICATION_METHOD, target_window : Win32cr::Foundation::HWND, message_code : UInt32, callback_routine : Win32cr::Devices::BiometricFramework::PWINBIO_ASYNC_COMPLETION_CALLBACK, user_data : Void*, asynchronous_open : Win32cr::Foundation::BOOL, framework_handle : UInt32*) : Win32cr::Foundation::HRESULT

    fun WinBioCloseFramework(framework_handle : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioAsyncEnumServiceProviders(framework_handle : UInt32, factor : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioAsyncEnumBiometricUnits(framework_handle : UInt32, factor : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioAsyncEnumDatabases(framework_handle : UInt32, factor : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioAsyncMonitorFrameworkChanges(framework_handle : UInt32, change_types : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioOpenSession(factor : UInt32, pool_type : Win32cr::Devices::BiometricFramework::WINBIO_POOL, flags : UInt32, unit_array : UInt32*, unit_count : LibC::UIntPtrT, database_id : LibC::GUID*, session_handle : UInt32*) : Win32cr::Foundation::HRESULT

    fun WinBioAsyncOpenSession(factor : UInt32, pool_type : Win32cr::Devices::BiometricFramework::WINBIO_POOL, flags : UInt32, unit_array : UInt32*, unit_count : LibC::UIntPtrT, database_id : LibC::GUID*, notification_method : Win32cr::Devices::BiometricFramework::WINBIO_ASYNC_NOTIFICATION_METHOD, target_window : Win32cr::Foundation::HWND, message_code : UInt32, callback_routine : Win32cr::Devices::BiometricFramework::PWINBIO_ASYNC_COMPLETION_CALLBACK, user_data : Void*, asynchronous_open : Win32cr::Foundation::BOOL, session_handle : UInt32*) : Win32cr::Foundation::HRESULT

    fun WinBioCloseSession(session_handle : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioVerify(session_handle : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8, unit_id : UInt32*, match : UInt8*, reject_detail : UInt32*) : Win32cr::Foundation::HRESULT

    fun WinBioVerifyWithCallback(session_handle : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8, verify_callback : Win32cr::Devices::BiometricFramework::PWINBIO_VERIFY_CALLBACK, verify_callback_context : Void*) : Win32cr::Foundation::HRESULT

    fun WinBioIdentify(session_handle : UInt32, unit_id : UInt32*, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8*, reject_detail : UInt32*) : Win32cr::Foundation::HRESULT

    fun WinBioIdentifyWithCallback(session_handle : UInt32, identify_callback : Win32cr::Devices::BiometricFramework::PWINBIO_IDENTIFY_CALLBACK, identify_callback_context : Void*) : Win32cr::Foundation::HRESULT

    fun WinBioWait(session_handle : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioCancel(session_handle : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioLocateSensor(session_handle : UInt32, unit_id : UInt32*) : Win32cr::Foundation::HRESULT

    fun WinBioLocateSensorWithCallback(session_handle : UInt32, locate_callback : Win32cr::Devices::BiometricFramework::PWINBIO_LOCATE_SENSOR_CALLBACK, locate_callback_context : Void*) : Win32cr::Foundation::HRESULT

    fun WinBioEnrollBegin(session_handle : UInt32, sub_factor : UInt8, unit_id : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioEnrollSelect(session_handle : UInt32, selector_value : UInt64) : Win32cr::Foundation::HRESULT

    fun WinBioEnrollCapture(session_handle : UInt32, reject_detail : UInt32*) : Win32cr::Foundation::HRESULT

    fun WinBioEnrollCaptureWithCallback(session_handle : UInt32, enroll_callback : Win32cr::Devices::BiometricFramework::PWINBIO_ENROLL_CAPTURE_CALLBACK, enroll_callback_context : Void*) : Win32cr::Foundation::HRESULT

    fun WinBioEnrollCommit(session_handle : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, is_new_template : UInt8*) : Win32cr::Foundation::HRESULT

    fun WinBioEnrollDiscard(session_handle : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioEnumEnrollments(session_handle : UInt32, unit_id : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor_array : UInt8**, sub_factor_count : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    fun WinBioImproveBegin(session_handle : UInt32, unit_id : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioImproveEnd(session_handle : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioRegisterEventMonitor(session_handle : UInt32, event_mask : UInt32, event_callback : Win32cr::Devices::BiometricFramework::PWINBIO_EVENT_CALLBACK, event_callback_context : Void*) : Win32cr::Foundation::HRESULT

    fun WinBioUnregisterEventMonitor(session_handle : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioMonitorPresence(session_handle : UInt32, unit_id : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioCaptureSample(session_handle : UInt32, purpose : UInt8, flags : UInt8, unit_id : UInt32*, sample : Win32cr::Devices::BiometricFramework::WINBIO_BIR**, sample_size : LibC::UIntPtrT*, reject_detail : UInt32*) : Win32cr::Foundation::HRESULT

    fun WinBioCaptureSampleWithCallback(session_handle : UInt32, purpose : UInt8, flags : UInt8, capture_callback : Win32cr::Devices::BiometricFramework::PWINBIO_CAPTURE_CALLBACK, capture_callback_context : Void*) : Win32cr::Foundation::HRESULT

    fun WinBioDeleteTemplate(session_handle : UInt32, unit_id : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8) : Win32cr::Foundation::HRESULT

    fun WinBioLockUnit(session_handle : UInt32, unit_id : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioUnlockUnit(session_handle : UInt32, unit_id : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioControlUnit(session_handle : UInt32, unit_id : UInt32, component : Win32cr::Devices::BiometricFramework::WINBIO_COMPONENT, control_code : UInt32, send_buffer : UInt8*, send_buffer_size : LibC::UIntPtrT, receive_buffer : UInt8*, receive_buffer_size : LibC::UIntPtrT, receive_data_size : LibC::UIntPtrT*, operation_status : UInt32*) : Win32cr::Foundation::HRESULT

    fun WinBioControlUnitPrivileged(session_handle : UInt32, unit_id : UInt32, component : Win32cr::Devices::BiometricFramework::WINBIO_COMPONENT, control_code : UInt32, send_buffer : UInt8*, send_buffer_size : LibC::UIntPtrT, receive_buffer : UInt8*, receive_buffer_size : LibC::UIntPtrT, receive_data_size : LibC::UIntPtrT*, operation_status : UInt32*) : Win32cr::Foundation::HRESULT

    fun WinBioGetProperty(session_handle : UInt32, property_type : UInt32, property_id : UInt32, unit_id : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8, property_buffer : Void**, property_buffer_size : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    fun WinBioSetProperty(session_handle : UInt32, property_type : UInt32, property_id : UInt32, unit_id : UInt32, identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, sub_factor : UInt8, property_buffer : Void*, property_buffer_size : LibC::UIntPtrT) : Win32cr::Foundation::HRESULT

    fun WinBioFree(address : Void*) : Win32cr::Foundation::HRESULT

    fun WinBioSetCredential(type__ : Win32cr::Devices::BiometricFramework::WINBIO_CREDENTIAL_TYPE, credential : UInt8*, credential_size : LibC::UIntPtrT, format : Win32cr::Devices::BiometricFramework::WINBIO_CREDENTIAL_FORMAT) : Win32cr::Foundation::HRESULT

    fun WinBioRemoveCredential(identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, type__ : Win32cr::Devices::BiometricFramework::WINBIO_CREDENTIAL_TYPE) : Win32cr::Foundation::HRESULT

    fun WinBioRemoveAllCredentials : Win32cr::Foundation::HRESULT

    fun WinBioRemoveAllDomainCredentials : Win32cr::Foundation::HRESULT

    fun WinBioGetCredentialState(identity : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY, type__ : Win32cr::Devices::BiometricFramework::WINBIO_CREDENTIAL_TYPE, credential_state : Win32cr::Devices::BiometricFramework::WINBIO_CREDENTIAL_STATE*) : Win32cr::Foundation::HRESULT

    fun WinBioLogonIdentifiedUser(session_handle : UInt32) : Win32cr::Foundation::HRESULT

    fun WinBioGetEnrolledFactors(account_owner : Win32cr::Devices::BiometricFramework::WINBIO_IDENTITY*, enrolled_factors : UInt32*) : Win32cr::Foundation::HRESULT

    fun WinBioGetEnabledSetting(value : UInt8*, source : Win32cr::Devices::BiometricFramework::WINBIO_SETTING_SOURCE*) : Void

    fun WinBioGetLogonSetting(value : UInt8*, source : Win32cr::Devices::BiometricFramework::WINBIO_SETTING_SOURCE*) : Void

    fun WinBioGetDomainLogonSetting(value : UInt8*, source : Win32cr::Devices::BiometricFramework::WINBIO_SETTING_SOURCE*) : Void

    fun WinBioAcquireFocus : Win32cr::Foundation::HRESULT

    fun WinBioReleaseFocus : Win32cr::Foundation::HRESULT

  end
end