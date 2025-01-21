require "./../foundation.cr"
require "./../graphics/gdi.cr"
require "./../ui/controls.cr"
require "./../system/com.cr"
require "./../system/io.cr"
require "./../system/registry.cr"

module Win32cr::Devices::Fax
  alias PFAXCONNECTFAXSERVERA = Proc(Win32cr::Foundation::PSTR, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::BOOL)*

  alias PFAXCONNECTFAXSERVERW = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::BOOL)*

  alias PFAXCLOSE = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::BOOL)*

  alias PFAXOPENPORT = Proc(Win32cr::Foundation::HANDLE, UInt32, UInt32, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::BOOL)*

  alias PFAXCOMPLETEJOBPARAMSA = Proc(Win32cr::Devices::Fax::FAX_JOB_PARAMA**, Win32cr::Devices::Fax::FAX_COVERPAGE_INFOA**, Win32cr::Foundation::BOOL)*

  alias PFAXCOMPLETEJOBPARAMSW = Proc(Win32cr::Devices::Fax::FAX_JOB_PARAMW**, Win32cr::Devices::Fax::FAX_COVERPAGE_INFOW**, Win32cr::Foundation::BOOL)*

  alias PFAXSENDDOCUMENTA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::PSTR, Win32cr::Devices::Fax::FAX_JOB_PARAMA*, Win32cr::Devices::Fax::FAX_COVERPAGE_INFOA*, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXSENDDOCUMENTW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::PWSTR, Win32cr::Devices::Fax::FAX_JOB_PARAMW*, Win32cr::Devices::Fax::FAX_COVERPAGE_INFOW*, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAX_RECIPIENT_CALLBACKA = Proc(Win32cr::Foundation::HANDLE, UInt32, Void*, Win32cr::Devices::Fax::FAX_JOB_PARAMA*, Win32cr::Devices::Fax::FAX_COVERPAGE_INFOA*, Win32cr::Foundation::BOOL)*

  alias PFAX_RECIPIENT_CALLBACKW = Proc(Win32cr::Foundation::HANDLE, UInt32, Void*, Win32cr::Devices::Fax::FAX_JOB_PARAMW*, Win32cr::Devices::Fax::FAX_COVERPAGE_INFOW*, Win32cr::Foundation::BOOL)*

  alias PFAXSENDDOCUMENTFORBROADCASTA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::PSTR, UInt32*, Win32cr::Devices::Fax::PFAX_RECIPIENT_CALLBACKA, Void*, Win32cr::Foundation::BOOL)*

  alias PFAXSENDDOCUMENTFORBROADCASTW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Devices::Fax::PFAX_RECIPIENT_CALLBACKW, Void*, Win32cr::Foundation::BOOL)*

  alias PFAXENUMJOBSA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_JOB_ENTRYA**, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXENUMJOBSW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_JOB_ENTRYW**, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXGETJOBA = Proc(Win32cr::Foundation::HANDLE, UInt32, Win32cr::Devices::Fax::FAX_JOB_ENTRYA**, Win32cr::Foundation::BOOL)*

  alias PFAXGETJOBW = Proc(Win32cr::Foundation::HANDLE, UInt32, Win32cr::Devices::Fax::FAX_JOB_ENTRYW**, Win32cr::Foundation::BOOL)*

  alias PFAXSETJOBA = Proc(Win32cr::Foundation::HANDLE, UInt32, UInt32, Win32cr::Devices::Fax::FAX_JOB_ENTRYA*, Win32cr::Foundation::BOOL)*

  alias PFAXSETJOBW = Proc(Win32cr::Foundation::HANDLE, UInt32, UInt32, Win32cr::Devices::Fax::FAX_JOB_ENTRYW*, Win32cr::Foundation::BOOL)*

  alias PFAXGETPAGEDATA = Proc(Win32cr::Foundation::HANDLE, UInt32, UInt8**, UInt32*, UInt32*, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXGETDEVICESTATUSA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_DEVICE_STATUSA**, Win32cr::Foundation::BOOL)*

  alias PFAXGETDEVICESTATUSW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_DEVICE_STATUSW**, Win32cr::Foundation::BOOL)*

  alias PFAXABORT = Proc(Win32cr::Foundation::HANDLE, UInt32, Win32cr::Foundation::BOOL)*

  alias PFAXGETCONFIGURATIONA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_CONFIGURATIONA**, Win32cr::Foundation::BOOL)*

  alias PFAXGETCONFIGURATIONW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_CONFIGURATIONW**, Win32cr::Foundation::BOOL)*

  alias PFAXSETCONFIGURATIONA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_CONFIGURATIONA*, Win32cr::Foundation::BOOL)*

  alias PFAXSETCONFIGURATIONW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_CONFIGURATIONW*, Win32cr::Foundation::BOOL)*

  alias PFAXGETLOGGINGCATEGORIESA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_LOG_CATEGORYA**, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXGETLOGGINGCATEGORIESW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_LOG_CATEGORYW**, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXSETLOGGINGCATEGORIESA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_LOG_CATEGORYA*, UInt32, Win32cr::Foundation::BOOL)*

  alias PFAXSETLOGGINGCATEGORIESW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_LOG_CATEGORYW*, UInt32, Win32cr::Foundation::BOOL)*

  alias PFAXENUMPORTSA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_PORT_INFOA**, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXENUMPORTSW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_PORT_INFOW**, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXGETPORTA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_PORT_INFOA**, Win32cr::Foundation::BOOL)*

  alias PFAXGETPORTW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_PORT_INFOW**, Win32cr::Foundation::BOOL)*

  alias PFAXSETPORTA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_PORT_INFOA*, Win32cr::Foundation::BOOL)*

  alias PFAXSETPORTW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_PORT_INFOW*, Win32cr::Foundation::BOOL)*

  alias PFAXENUMROUTINGMETHODSA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_ROUTING_METHODA**, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXENUMROUTINGMETHODSW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_ROUTING_METHODW**, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXENABLEROUTINGMETHODA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::PSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL)*

  alias PFAXENABLEROUTINGMETHODW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL)*

  alias PFAXENUMGLOBALROUTINGINFOA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_GLOBAL_ROUTING_INFOA**, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXENUMGLOBALROUTINGINFOW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_GLOBAL_ROUTING_INFOW**, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXSETGLOBALROUTINGINFOA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_GLOBAL_ROUTING_INFOA*, Win32cr::Foundation::BOOL)*

  alias PFAXSETGLOBALROUTINGINFOW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_GLOBAL_ROUTING_INFOW*, Win32cr::Foundation::BOOL)*

  alias PFAXGETROUTINGINFOA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::PSTR, UInt8**, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXGETROUTINGINFOW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::PWSTR, UInt8**, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXSETROUTINGINFOA = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::PSTR, UInt8*, UInt32, Win32cr::Foundation::BOOL)*

  alias PFAXSETROUTINGINFOW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::PWSTR, UInt8*, UInt32, Win32cr::Foundation::BOOL)*

  alias PFAXINITIALIZEEVENTQUEUE = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::HANDLE, LibC::UIntPtrT, Win32cr::Foundation::HWND, UInt32, Win32cr::Foundation::BOOL)*

  alias PFAXFREEBUFFER = Proc(Void*, Void)*

  alias PFAXSTARTPRINTJOBA = Proc(Win32cr::Foundation::PSTR, Win32cr::Devices::Fax::FAX_PRINT_INFOA*, UInt32*, Win32cr::Devices::Fax::FAX_CONTEXT_INFOA*, Win32cr::Foundation::BOOL)*

  alias PFAXSTARTPRINTJOBW = Proc(Win32cr::Foundation::PWSTR, Win32cr::Devices::Fax::FAX_PRINT_INFOW*, UInt32*, Win32cr::Devices::Fax::FAX_CONTEXT_INFOW*, Win32cr::Foundation::BOOL)*

  alias PFAXPRINTCOVERPAGEA = Proc(Win32cr::Devices::Fax::FAX_CONTEXT_INFOA*, Win32cr::Devices::Fax::FAX_COVERPAGE_INFOA*, Win32cr::Foundation::BOOL)*

  alias PFAXPRINTCOVERPAGEW = Proc(Win32cr::Devices::Fax::FAX_CONTEXT_INFOW*, Win32cr::Devices::Fax::FAX_COVERPAGE_INFOW*, Win32cr::Foundation::BOOL)*

  alias PFAXREGISTERSERVICEPROVIDERW = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL)*

  alias PFAXUNREGISTERSERVICEPROVIDERW = Proc(Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL)*

  alias PFAX_ROUTING_INSTALLATION_CALLBACKW = Proc(Win32cr::Foundation::HANDLE, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL)*

  alias PFAXREGISTERROUTINGEXTENSIONW = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Devices::Fax::PFAX_ROUTING_INSTALLATION_CALLBACKW, Void*, Win32cr::Foundation::BOOL)*

  alias PFAXACCESSCHECK = Proc(Win32cr::Foundation::HANDLE, UInt32, Win32cr::Foundation::BOOL)*

  alias PFAX_SERVICE_CALLBACK = Proc(Win32cr::Foundation::HANDLE, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Win32cr::Foundation::BOOL)*

  alias PFAX_LINECALLBACK = Proc(Win32cr::Foundation::HANDLE, UInt32, UInt32, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, LibC::UIntPtrT, Void)*

  alias PFAX_SEND_CALLBACK = Proc(Win32cr::Foundation::HANDLE, UInt32, UInt32, UInt32, Win32cr::Foundation::BOOL)*

  alias PFAXDEVINITIALIZE = Proc(UInt32, Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::PFAX_LINECALLBACK*, Win32cr::Devices::Fax::PFAX_SERVICE_CALLBACK, Win32cr::Foundation::BOOL)*

  alias PFAXDEVVIRTUALDEVICECREATION = Proc(UInt32*, UInt16*, UInt32*, Win32cr::Foundation::HANDLE, LibC::UIntPtrT, Win32cr::Foundation::BOOL)*

  alias PFAXDEVSTARTJOB = Proc(UInt32, UInt32, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HANDLE, LibC::UIntPtrT, Win32cr::Foundation::BOOL)*

  alias PFAXDEVENDJOB = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::BOOL)*

  alias PFAXDEVSEND = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_SEND*, Win32cr::Devices::Fax::PFAX_SEND_CALLBACK, Win32cr::Foundation::BOOL)*

  alias PFAXDEVRECEIVE = Proc(Win32cr::Foundation::HANDLE, UInt32, Win32cr::Devices::Fax::FAX_RECEIVE*, Win32cr::Foundation::BOOL)*

  alias PFAXDEVREPORTSTATUS = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_DEV_STATUS*, UInt32, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXDEVABORTOPERATION = Proc(Win32cr::Foundation::HANDLE, Win32cr::Foundation::BOOL)*

  alias PFAXDEVCONFIGURE = Proc(Win32cr::UI::Controls::HPROPSHEETPAGE*, Win32cr::Foundation::BOOL)*

  alias PFAXDEVSHUTDOWN = Proc(Win32cr::Foundation::HRESULT)*

  alias PFAXROUTEADDFILE = Proc(UInt32, Win32cr::Foundation::PWSTR, LibC::GUID*, Int32)*

  alias PFAXROUTEDELETEFILE = Proc(UInt32, Win32cr::Foundation::PWSTR, Int32)*

  alias PFAXROUTEGETFILE = Proc(UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXROUTEENUMFILE = Proc(UInt32, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::BOOL)*

  alias PFAXROUTEENUMFILES = Proc(UInt32, LibC::GUID*, Win32cr::Devices::Fax::PFAXROUTEENUMFILE, Void*, Win32cr::Foundation::BOOL)*

  alias PFAXROUTEMODIFYROUTINGDATA = Proc(UInt32, Win32cr::Foundation::PWSTR, UInt8*, UInt32, Win32cr::Foundation::BOOL)*

  alias PFAXROUTEINITIALIZE = Proc(Win32cr::Foundation::HANDLE, Win32cr::Devices::Fax::FAX_ROUTE_CALLBACKROUTINES*, Win32cr::Foundation::BOOL)*

  alias PFAXROUTEMETHOD = Proc(Win32cr::Devices::Fax::FAX_ROUTE*, Void**, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXROUTEDEVICEENABLE = Proc(Win32cr::Foundation::PWSTR, UInt32, Int32, Win32cr::Foundation::BOOL)*

  alias PFAXROUTEDEVICECHANGENOTIFICATION = Proc(UInt32, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL)*

  alias PFAXROUTEGETROUTINGINFO = Proc(Win32cr::Foundation::PWSTR, UInt32, UInt8*, UInt32*, Win32cr::Foundation::BOOL)*

  alias PFAXROUTESETROUTINGINFO = Proc(Win32cr::Foundation::PWSTR, UInt32, UInt8*, UInt32, Win32cr::Foundation::BOOL)*

  alias PFAX_EXT_GET_DATA = Proc(UInt32, Win32cr::Devices::Fax::FAX_ENUM_DEVICE_ID_SOURCE, Win32cr::Foundation::PWSTR, UInt8**, UInt32*, UInt32)*

  alias PFAX_EXT_SET_DATA = Proc(Win32cr::Foundation::HINSTANCE, UInt32, Win32cr::Devices::Fax::FAX_ENUM_DEVICE_ID_SOURCE, Win32cr::Foundation::PWSTR, UInt8*, UInt32, UInt32)*

  alias PFAX_EXT_CONFIG_CHANGE = Proc(UInt32, Win32cr::Foundation::PWSTR, UInt8*, UInt32, Win32cr::Foundation::HRESULT)*

  alias PFAX_EXT_REGISTER_FOR_EVENTS = Proc(Win32cr::Foundation::HINSTANCE, UInt32, Win32cr::Devices::Fax::FAX_ENUM_DEVICE_ID_SOURCE, Win32cr::Foundation::PWSTR, Win32cr::Devices::Fax::PFAX_EXT_CONFIG_CHANGE, Win32cr::Foundation::HANDLE)*

  alias PFAX_EXT_UNREGISTER_FOR_EVENTS = Proc(Win32cr::Foundation::HANDLE, UInt32)*

  alias PFAX_EXT_FREE_BUFFER = Proc(Void*, Void)*

  alias PFAX_EXT_INITIALIZE_CONFIG = Proc(Win32cr::Devices::Fax::PFAX_EXT_GET_DATA, Win32cr::Devices::Fax::PFAX_EXT_SET_DATA, Win32cr::Devices::Fax::PFAX_EXT_REGISTER_FOR_EVENTS, Win32cr::Devices::Fax::PFAX_EXT_UNREGISTER_FOR_EVENTS, Win32cr::Devices::Fax::PFAX_EXT_FREE_BUFFER, Win32cr::Foundation::HRESULT)*

  Prv_default_prefetch_size = 100_u32
  FS_INITIALIZING = 536870912_u32
  FS_DIALING = 536870913_u32
  FS_TRANSMITTING = 536870914_u32
  FS_RECEIVING = 536870916_u32
  FS_COMPLETED = 536870920_u32
  FS_HANDLED = 536870928_u32
  FS_LINE_UNAVAILABLE = 536870944_u32
  FS_BUSY = 536870976_u32
  FS_NO_ANSWER = 536871040_u32
  FS_BAD_ADDRESS = 536871168_u32
  FS_NO_DIAL_TONE = 536871424_u32
  FS_DISCONNECTED = 536871936_u32
  FS_FATAL_ERROR = 536872960_u32
  FS_NOT_FAX_CALL = 536875008_u32
  FS_CALL_DELAYED = 536879104_u32
  FS_CALL_BLACKLISTED = 536887296_u32
  FS_USER_ABORT = 538968064_u32
  FS_ANSWERED = 545259520_u32
  FAXDEVRECEIVE_SIZE = 4096_u32
  FAXDEVREPORTSTATUS_SIZE = 4096_u32
  MS_FAXROUTE_PRINTING_GUID = "{aec1b37c-9af2-11d0-abf7-00c04fd91a4e}"
  MS_FAXROUTE_FOLDER_GUID = "{92041a90-9af2-11d0-abf7-00c04fd91a4e}"
  MS_FAXROUTE_EMAIL_GUID = "{6bbf7bfe-9af2-11d0-abf7-00c04fd91a4e}"
  FAX_ERR_START = 7001_i32
  FAX_ERR_SRV_OUTOFMEMORY = 7001_i32
  FAX_ERR_GROUP_NOT_FOUND = 7002_i32
  FAX_ERR_BAD_GROUP_CONFIGURATION = 7003_i32
  FAX_ERR_GROUP_IN_USE = 7004_i32
  FAX_ERR_RULE_NOT_FOUND = 7005_i32
  FAX_ERR_NOT_NTFS = 7006_i32
  FAX_ERR_DIRECTORY_IN_USE = 7007_i32
  FAX_ERR_FILE_ACCESS_DENIED = 7008_i32
  FAX_ERR_MESSAGE_NOT_FOUND = 7009_i32
  FAX_ERR_DEVICE_NUM_LIMIT_EXCEEDED = 7010_i32
  FAX_ERR_NOT_SUPPORTED_ON_THIS_SKU = 7011_i32
  FAX_ERR_VERSION_MISMATCH = 7012_i32
  FAX_ERR_RECIPIENTS_LIMIT = 7013_i32
  FAX_ERR_END = 7013_i32
  FAX_E_SRV_OUTOFMEMORY = -2147214503_i32
  FAX_E_GROUP_NOT_FOUND = -2147214502_i32
  FAX_E_BAD_GROUP_CONFIGURATION = -2147214501_i32
  FAX_E_GROUP_IN_USE = -2147214500_i32
  FAX_E_RULE_NOT_FOUND = -2147214499_i32
  FAX_E_NOT_NTFS = -2147214498_i32
  FAX_E_DIRECTORY_IN_USE = -2147214497_i32
  FAX_E_FILE_ACCESS_DENIED = -2147214496_i32
  FAX_E_MESSAGE_NOT_FOUND = -2147214495_i32
  FAX_E_DEVICE_NUM_LIMIT_EXCEEDED = -2147214494_i32
  FAX_E_NOT_SUPPORTED_ON_THIS_SKU = -2147214493_i32
  FAX_E_VERSION_MISMATCH = -2147214492_i32
  FAX_E_RECIPIENTS_LIMIT = -2147214491_i32
  JT_UNKNOWN = 0_u32
  JT_SEND = 1_u32
  JT_RECEIVE = 2_u32
  JT_ROUTING = 3_u32
  JT_FAIL_RECEIVE = 4_u32
  JS_PENDING = 0_u32
  JS_INPROGRESS = 1_u32
  JS_DELETING = 2_u32
  JS_FAILED = 4_u32
  JS_PAUSED = 8_u32
  JS_NOLINE = 16_u32
  JS_RETRYING = 32_u32
  JS_RETRIES_EXCEEDED = 64_u32
  FPS_DIALING = 536870913_u32
  FPS_SENDING = 536870914_u32
  FPS_RECEIVING = 536870916_u32
  FPS_COMPLETED = 536870920_u32
  FPS_HANDLED = 536870928_u32
  FPS_UNAVAILABLE = 536870944_u32
  FPS_BUSY = 536870976_u32
  FPS_NO_ANSWER = 536871040_u32
  FPS_BAD_ADDRESS = 536871168_u32
  FPS_NO_DIAL_TONE = 536871424_u32
  FPS_DISCONNECTED = 536871936_u32
  FPS_FATAL_ERROR = 536872960_u32
  FPS_NOT_FAX_CALL = 536875008_u32
  FPS_CALL_DELAYED = 536879104_u32
  FPS_CALL_BLACKLISTED = 536887296_u32
  FPS_INITIALIZING = 536903680_u32
  FPS_OFFLINE = 536936448_u32
  FPS_RINGING = 537001984_u32
  FPS_AVAILABLE = 537919488_u32
  FPS_ABORTING = 538968064_u32
  FPS_ROUTING = 541065216_u32
  FPS_ANSWERED = 545259520_u32
  FPF_RECEIVE = 1_u32
  FPF_SEND = 2_u32
  FPF_VIRTUAL = 4_u32
  FEI_DIALING = 1_u32
  FEI_SENDING = 2_u32
  FEI_RECEIVING = 3_u32
  FEI_COMPLETED = 4_u32
  FEI_BUSY = 5_u32
  FEI_NO_ANSWER = 6_u32
  FEI_BAD_ADDRESS = 7_u32
  FEI_NO_DIAL_TONE = 8_u32
  FEI_DISCONNECTED = 9_u32
  FEI_FATAL_ERROR = 10_u32
  FEI_NOT_FAX_CALL = 11_u32
  FEI_CALL_DELAYED = 12_u32
  FEI_CALL_BLACKLISTED = 13_u32
  FEI_RINGING = 14_u32
  FEI_ABORTING = 15_u32
  FEI_ROUTING = 16_u32
  FEI_MODEM_POWERED_ON = 17_u32
  FEI_MODEM_POWERED_OFF = 18_u32
  FEI_IDLE = 19_u32
  FEI_FAXSVC_ENDED = 20_u32
  FEI_ANSWERED = 21_u32
  FEI_JOB_QUEUED = 22_u32
  FEI_DELETED = 23_u32
  FEI_INITIALIZING = 24_u32
  FEI_LINE_UNAVAILABLE = 25_u32
  FEI_HANDLED = 26_u32
  FEI_FAXSVC_STARTED = 27_u32
  FEI_NEVENTS = 27_u32
  FAX_JOB_SUBMIT = 1_u32
  FAX_JOB_QUERY = 2_u32
  FAX_CONFIG_QUERY = 4_u32
  FAX_CONFIG_SET = 8_u32
  FAX_PORT_QUERY = 16_u32
  FAX_PORT_SET = 32_u32
  FAX_JOB_MANAGE = 64_u32
  CF_MSFAXSRV_DEVICE_ID = "FAXSRV_DeviceID"
  CF_MSFAXSRV_FSP_GUID = "FAXSRV_FSPGuid"
  CF_MSFAXSRV_SERVER_NAME = "FAXSRV_ServerName"
  CF_MSFAXSRV_ROUTEEXT_NAME = "FAXSRV_RoutingExtName"
  CF_MSFAXSRV_ROUTING_METHOD_GUID = "FAXSRV_RoutingMethodGuid"
  STI_UNICODE = 1_u32
  CLSID_Sti = "b323f8e0-2e68-11d0-90ea-00aa0060f86c"
  GUID_DeviceArrivedLaunch = "740d9ee6-70f1-11d1-ad10-00a02438ad48"
  GUID_ScanImage = "a6c5a715-8c6e-11d2-977a-0000f87a926f"
  GUID_ScanPrintImage = "b441f425-8c6e-11d2-977a-0000f87a926f"
  GUID_ScanFaxImage = "c00eb793-8c6e-11d2-977a-0000f87a926f"
  GUID_STIUserDefined1 = "c00eb795-8c6e-11d2-977a-0000f87a926f"
  GUID_STIUserDefined2 = "c77ae9c5-8c6e-11d2-977a-0000f87a926f"
  GUID_STIUserDefined3 = "c77ae9c6-8c6e-11d2-977a-0000f87a926f"
  STI_VERSION_FLAG_MASK = 4278190080_u32
  STI_VERSION_FLAG_UNICODE = 16777216_u32
  STI_VERSION_REAL = 2_u32
  STI_VERSION_MIN_ALLOWED = 2_u32
  STI_VERSION = 2_u32
  STI_MAX_INTERNAL_NAME_LENGTH = 128_u32
  STI_GENCAP_NOTIFICATIONS = 1_u32
  STI_GENCAP_POLLING_NEEDED = 2_u32
  STI_GENCAP_GENERATE_ARRIVALEVENT = 4_u32
  STI_GENCAP_AUTO_PORTSELECT = 8_u32
  STI_GENCAP_WIA = 16_u32
  STI_GENCAP_SUBSET = 32_u32
  WIA_INCOMPAT_XP = 1_u32
  STI_HW_CONFIG_UNKNOWN = 1_u32
  STI_HW_CONFIG_SCSI = 2_u32
  STI_HW_CONFIG_USB = 4_u32
  STI_HW_CONFIG_SERIAL = 8_u32
  STI_HW_CONFIG_PARALLEL = 16_u32
  STI_DEVSTATUS_ONLINE_STATE = 1_u32
  STI_DEVSTATUS_EVENTS_STATE = 2_u32
  STI_ONLINESTATE_OPERATIONAL = 1_u32
  STI_ONLINESTATE_PENDING = 2_u32
  STI_ONLINESTATE_ERROR = 4_u32
  STI_ONLINESTATE_PAUSED = 8_u32
  STI_ONLINESTATE_PAPER_JAM = 16_u32
  STI_ONLINESTATE_PAPER_PROBLEM = 32_u32
  STI_ONLINESTATE_OFFLINE = 64_u32
  STI_ONLINESTATE_IO_ACTIVE = 128_u32
  STI_ONLINESTATE_BUSY = 256_u32
  STI_ONLINESTATE_TRANSFERRING = 512_u32
  STI_ONLINESTATE_INITIALIZING = 1024_u32
  STI_ONLINESTATE_WARMING_UP = 2048_u32
  STI_ONLINESTATE_USER_INTERVENTION = 4096_u32
  STI_ONLINESTATE_POWER_SAVE = 8192_u32
  STI_EVENTHANDLING_ENABLED = 1_u32
  STI_EVENTHANDLING_POLLING = 2_u32
  STI_EVENTHANDLING_PENDING = 4_u32
  STI_DIAGCODE_HWPRESENCE = 1_u32
  STI_TRACE_INFORMATION = 1_u32
  STI_TRACE_WARNING = 2_u32
  STI_TRACE_ERROR = 4_u32
  STI_SUBSCRIBE_FLAG_WINDOW = 1_u32
  STI_SUBSCRIBE_FLAG_EVENT = 2_u32
  MAX_NOTIFICATION_DATA = 64_u32
  STI_ADD_DEVICE_BROADCAST_ACTION = "Arrival"
  STI_REMOVE_DEVICE_BROADCAST_ACTION = "Removal"
  STI_ADD_DEVICE_BROADCAST_STRING = "STI\\"
  STI_REMOVE_DEVICE_BROADCAST_STRING = "STI\\"
  STI_DEVICE_CREATE_STATUS = 1_u32
  STI_DEVICE_CREATE_DATA = 2_u32
  STI_DEVICE_CREATE_BOTH = 3_u32
  STI_DEVICE_CREATE_MASK = 65535_u32
  STIEDFL_ALLDEVICES = 0_u32
  STIEDFL_ATTACHEDONLY = 1_u32
  STI_RAW_RESERVED = 4096_u32
  STI_OK = 0_i32
  STI_ERROR_NO_ERROR = 0_i32
  STI_NOTCONNECTED = 1_i32
  STI_CHANGENOEFFECT = 1_i32
  STIERR_OLD_VERSION = -2147023746_i32
  STIERR_BETA_VERSION = -2147023743_i32
  STIERR_BADDRIVER = -2147024777_i32
  STIERR_DEVICENOTREG = -2147221164_i32
  STIERR_OBJECTNOTFOUND = -2147024894_i32
  STIERR_INVALID_PARAM = -2147024809_i32
  STIERR_NOINTERFACE = -2147467262_i32
  STIERR_GENERIC = -2147467259_i32
  STIERR_OUTOFMEMORY = -2147024882_i32
  STIERR_UNSUPPORTED = -2147467263_i32
  STIERR_NOT_INITIALIZED = -2147024875_i32
  STIERR_ALREADY_INITIALIZED = -2147023649_i32
  STIERR_DEVICE_LOCKED = -2147024863_i32
  STIERR_READONLY = -2147024891_i32
  STIERR_NOTINITIALIZED = -2147024891_i32
  STIERR_NEEDS_LOCK = -2147024738_i32
  STIERR_SHARING_VIOLATION = -2147024864_i32
  STIERR_HANDLEEXISTS = -2147024713_i32
  STIERR_INVALID_DEVICE_NAME = -2147024773_i32
  STIERR_INVALID_HW_TYPE = -2147024883_i32
  STIERR_NOEVENTS = -2147024637_i32
  STIERR_DEVICE_NOTREADY = -2147024875_i32
  REGSTR_VAL_TYPE_W = "Type"
  REGSTR_VAL_VENDOR_NAME_W = "Vendor"
  REGSTR_VAL_DEVICETYPE_W = "DeviceType"
  REGSTR_VAL_DEVICESUBTYPE_W = "DeviceSubType"
  REGSTR_VAL_DEV_NAME_W = "DeviceName"
  REGSTR_VAL_DRIVER_DESC_W = "DriverDesc"
  REGSTR_VAL_FRIENDLY_NAME_W = "FriendlyName"
  REGSTR_VAL_GENERIC_CAPS_W = "Capabilities"
  REGSTR_VAL_HARDWARE_W = "HardwareConfig"
  REGSTR_VAL_HARDWARE = "HardwareConfig"
  REGSTR_VAL_DEVICE_NAME_W = "DriverDesc"
  REGSTR_VAL_DATA_W = "DeviceData"
  REGSTR_VAL_GUID_W = "GUID"
  REGSTR_VAL_GUID = "GUID"
  REGSTR_VAL_LAUNCH_APPS_W = "LaunchApplications"
  REGSTR_VAL_LAUNCH_APPS = "LaunchApplications"
  REGSTR_VAL_LAUNCHABLE_W = "Launchable"
  REGSTR_VAL_LAUNCHABLE = "Launchable"
  REGSTR_VAL_SHUTDOWNDELAY_W = "ShutdownIfUnusedDelay"
  REGSTR_VAL_SHUTDOWNDELAY = "ShutdownIfUnusedDelay"
  IS_DIGITAL_CAMERA_STR = "IsDigitalCamera"
  IS_DIGITAL_CAMERA_VAL = 1_u32
  SUPPORTS_MSCPLUS_STR = "SupportsMSCPlus"
  SUPPORTS_MSCPLUS_VAL = 1_u32
  STI_DEVICE_VALUE_TWAIN_NAME = "TwainDS"
  STI_DEVICE_VALUE_ISIS_NAME = "ISISDriverName"
  STI_DEVICE_VALUE_ICM_PROFILE = "ICMProfile"
  STI_DEVICE_VALUE_DEFAULT_LAUNCHAPP = "DefaultLaunchApp"
  STI_DEVICE_VALUE_TIMEOUT = "PollTimeout"
  STI_DEVICE_VALUE_DISABLE_NOTIFICATIONS = "DisableNotifications"
  REGSTR_VAL_BAUDRATE = "BaudRate"
  STI_DEVICE_VALUE_TWAIN_NAME_A = "TwainDS"
  STI_DEVICE_VALUE_ISIS_NAME_A = "ISISDriverName"
  STI_DEVICE_VALUE_ICM_PROFILE_A = "ICMProfile"
  STI_DEVICE_VALUE_DEFAULT_LAUNCHAPP_A = "DefaultLaunchApp"
  STI_DEVICE_VALUE_TIMEOUT_A = "PollTimeout"
  STI_DEVICE_VALUE_DISABLE_NOTIFICATIONS_A = "DisableNotifications"
  REGSTR_VAL_BAUDRATE_A = "BaudRate"
  DEVPKEY_WIA_DeviceType = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6bdd1fc6_u32, 0x810f_u16, 0x11d0_u16, StaticArray[0xbe_u8, 0xc7_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0xe2_u8, 0x9_u8, 0x2f_u8]), 2_u32)
  DEVPKEY_WIA_USDClassId = UI::Shell::PropertiesSystem::PROPERTYKEY.new(LibC::GUID.new(0x6bdd1fc6_u32, 0x810f_u16, 0x11d0_u16, StaticArray[0xbe_u8, 0xc7_u8, 0x8_u8, 0x0_u8, 0x2b_u8, 0xe2_u8, 0x9_u8, 0x2f_u8]), 3_u32)
  STI_USD_GENCAP_NATIVE_PUSHSUPPORT = 1_u32
  STI_DEVICE_CREATE_FOR_MONITOR = 16777216_u32
  Ldefault_prefetch_size = 100_i32
  Wcharreassign_recipients_delimiter = 59_u16

  CLSID_FaxServer = LibC::GUID.new(0xcda8acb0_u32, 0x8cf5_u16, 0x4f6c_u16, StaticArray[0x9b_u8, 0xa2_u8, 0x59_u8, 0x31_u8, 0xd4_u8, 0xc_u8, 0x8c_u8, 0xae_u8])

  CLSID_FaxDeviceProviders = LibC::GUID.new(0xeb8fe768_u32, 0x875a_u16, 0x4f5f_u16, StaticArray[0x82_u8, 0xc5_u8, 0x3_u8, 0xf2_u8, 0x3a_u8, 0xac_u8, 0x1b_u8, 0xd7_u8])

  CLSID_FaxDevices = LibC::GUID.new(0x5589e28e_u32, 0x23cb_u16, 0x4919_u16, StaticArray[0x88_u8, 0x8_u8, 0xe6_u8, 0x10_u8, 0x18_u8, 0x46_u8, 0xe8_u8, 0xd_u8])

  CLSID_FaxInboundRouting = LibC::GUID.new(0xe80248ed_u32, 0xad65_u16, 0x4218_u16, StaticArray[0x81_u8, 0x8_u8, 0x99_u8, 0x19_u8, 0x24_u8, 0xd4_u8, 0xe7_u8, 0xed_u8])

  CLSID_FaxFolders = LibC::GUID.new(0xc35211d7_u32, 0x5776_u16, 0x48cb_u16, StaticArray[0xaf_u8, 0x44_u8, 0xc3_u8, 0x1b_u8, 0xe3_u8, 0xb2_u8, 0xcf_u8, 0xe5_u8])

  CLSID_FaxLoggingOptions = LibC::GUID.new(0x1bf9eea6_u32, 0xece0_u16, 0x4785_u16, StaticArray[0xa1_u8, 0x8b_u8, 0xde_u8, 0x56_u8, 0xe9_u8, 0xee_u8, 0xf9_u8, 0x6a_u8])

  CLSID_FaxActivity = LibC::GUID.new(0xcfef5d0e_u32, 0xe84d_u16, 0x462e_u16, StaticArray[0xaa_u8, 0xbb_u8, 0x87_u8, 0xd3_u8, 0x1e_u8, 0xb0_u8, 0x4f_u8, 0xef_u8])

  CLSID_FaxOutboundRouting = LibC::GUID.new(0xc81b385e_u32, 0xb869_u16, 0x4afd_u16, StaticArray[0x86_u8, 0xc0_u8, 0x61_u8, 0x64_u8, 0x98_u8, 0xed_u8, 0x9b_u8, 0xe2_u8])

  CLSID_FaxReceiptOptions = LibC::GUID.new(0x6982487b_u32, 0x227b_u16, 0x4c96_u16, StaticArray[0xa6_u8, 0x1c_u8, 0x24_u8, 0x83_u8, 0x48_u8, 0xb0_u8, 0x5a_u8, 0xb6_u8])

  CLSID_FaxSecurity = LibC::GUID.new(0x10c4ddde_u32, 0xabf0_u16, 0x43df_u16, StaticArray[0x96_u8, 0x4f_u8, 0x7f_u8, 0x3a_u8, 0xc2_u8, 0x1a_u8, 0x4c_u8, 0x7b_u8])

  CLSID_FaxDocument = LibC::GUID.new(0xf3f9f91_u32, 0xc838_u16, 0x415e_u16, StaticArray[0xa4_u8, 0xf3_u8, 0x3e_u8, 0x82_u8, 0x8c_u8, 0xa4_u8, 0x45_u8, 0xe0_u8])

  CLSID_FaxSender = LibC::GUID.new(0x265d84d0_u32, 0x1850_u16, 0x4360_u16, StaticArray[0xb7_u8, 0xc8_u8, 0x75_u8, 0x8b_u8, 0xbb_u8, 0x5f_u8, 0xb_u8, 0x96_u8])

  CLSID_FaxRecipients = LibC::GUID.new(0xea9bdf53_u32, 0x10a9_u16, 0x4d4f_u16, StaticArray[0xa0_u8, 0x67_u8, 0x63_u8, 0xc8_u8, 0xf8_u8, 0x4f_u8, 0x1_u8, 0xb0_u8])

  CLSID_FaxIncomingArchive = LibC::GUID.new(0x8426c56a_u32, 0x35a1_u16, 0x4c6f_u16, StaticArray[0xaf_u8, 0x93_u8, 0xfc_u8, 0x95_u8, 0x24_u8, 0x22_u8, 0xe2_u8, 0xc2_u8])

  CLSID_FaxIncomingQueue = LibC::GUID.new(0x69131717_u32, 0xf3f1_u16, 0x40e3_u16, StaticArray[0x80_u8, 0x9d_u8, 0xa6_u8, 0xcb_u8, 0xf7_u8, 0xbd_u8, 0x85_u8, 0xe5_u8])

  CLSID_FaxOutgoingArchive = LibC::GUID.new(0x43c28403_u32, 0xe04f_u16, 0x474d_u16, StaticArray[0x99_u8, 0xc_u8, 0xb9_u8, 0x46_u8, 0x69_u8, 0x14_u8, 0x8f_u8, 0x59_u8])

  CLSID_FaxOutgoingQueue = LibC::GUID.new(0x7421169e_u32, 0x8c43_u16, 0x4b0d_u16, StaticArray[0xbb_u8, 0x16_u8, 0x64_u8, 0x5c_u8, 0x8f_u8, 0xa4_u8, 0x3_u8, 0x57_u8])

  CLSID_FaxIncomingMessageIterator = LibC::GUID.new(0x6088e1d8_u32, 0x3fc8_u16, 0x45c2_u16, StaticArray[0x87_u8, 0xb1_u8, 0x90_u8, 0x9a_u8, 0x29_u8, 0x60_u8, 0x7e_u8, 0xa9_u8])

  CLSID_FaxIncomingMessage = LibC::GUID.new(0x1932fcf7_u32, 0x9d43_u16, 0x4d5a_u16, StaticArray[0x89_u8, 0xff_u8, 0x3_u8, 0x86_u8, 0x1b_u8, 0x32_u8, 0x17_u8, 0x36_u8])

  CLSID_FaxOutgoingJobs = LibC::GUID.new(0x92bf2a6c_u32, 0x37be_u16, 0x43fa_u16, StaticArray[0xa3_u8, 0x7d_u8, 0xcb_u8, 0xe_u8, 0x5f_u8, 0x75_u8, 0x3b_u8, 0x35_u8])

  CLSID_FaxOutgoingJob = LibC::GUID.new(0x71bb429c_u32, 0xef9_u16, 0x4915_u16, StaticArray[0xbe_u8, 0xc5_u8, 0xa5_u8, 0xd8_u8, 0x97_u8, 0xa3_u8, 0xe9_u8, 0x24_u8])

  CLSID_FaxOutgoingMessageIterator = LibC::GUID.new(0x8a3224d0_u32, 0xd30b_u16, 0x49de_u16, StaticArray[0x98_u8, 0x13_u8, 0xcb_u8, 0x38_u8, 0x57_u8, 0x90_u8, 0xfb_u8, 0xbb_u8])

  CLSID_FaxOutgoingMessage = LibC::GUID.new(0x91b4a378_u32, 0x4ad8_u16, 0x4aef_u16, StaticArray[0xa4_u8, 0xdc_u8, 0x97_u8, 0xd9_u8, 0x6e_u8, 0x93_u8, 0x9a_u8, 0x3a_u8])

  CLSID_FaxIncomingJobs = LibC::GUID.new(0xa1bb8a43_u32, 0x8866_u16, 0x4fb7_u16, StaticArray[0xa1_u8, 0x5d_u8, 0x62_u8, 0x66_u8, 0xc8_u8, 0x75_u8, 0xa5_u8, 0xcc_u8])

  CLSID_FaxIncomingJob = LibC::GUID.new(0xc47311ec_u32, 0xae32_u16, 0x41b8_u16, StaticArray[0xae_u8, 0x4b_u8, 0x3e_u8, 0xae_u8, 0x6_u8, 0x29_u8, 0xd0_u8, 0xc9_u8])

  CLSID_FaxDeviceProvider = LibC::GUID.new(0x17cf1aa3_u32, 0xf5eb_u16, 0x484a_u16, StaticArray[0x9c_u8, 0x9a_u8, 0x44_u8, 0x40_u8, 0xa5_u8, 0xba_u8, 0xab_u8, 0xfc_u8])

  CLSID_FaxDevice = LibC::GUID.new(0x59e3a5b2_u32, 0xd676_u16, 0x484b_u16, StaticArray[0xa6_u8, 0xde_u8, 0x72_u8, 0xb_u8, 0xfa_u8, 0x89_u8, 0xb5_u8, 0xaf_u8])

  CLSID_FaxActivityLogging = LibC::GUID.new(0xf0a0294e_u32, 0x3bbd_u16, 0x48b8_u16, StaticArray[0x8f_u8, 0x13_u8, 0x8c_u8, 0x59_u8, 0x1a_u8, 0x55_u8, 0xbd_u8, 0xbc_u8])

  CLSID_FaxEventLogging = LibC::GUID.new(0xa6850930_u32, 0xa0f6_u16, 0x4a6f_u16, StaticArray[0x95_u8, 0xb7_u8, 0xdb_u8, 0x2e_u8, 0xbf_u8, 0x3d_u8, 0x2_u8, 0xe3_u8])

  CLSID_FaxOutboundRoutingGroups = LibC::GUID.new(0xccbea1a5_u32, 0xe2b4_u16, 0x4b57_u16, StaticArray[0x94_u8, 0x21_u8, 0xb0_u8, 0x4b_u8, 0x62_u8, 0x89_u8, 0x46_u8, 0x4b_u8])

  CLSID_FaxOutboundRoutingGroup = LibC::GUID.new(0x213f3e0_u32, 0x6791_u16, 0x4d77_u16, StaticArray[0xa2_u8, 0x71_u8, 0x4_u8, 0xd2_u8, 0x35_u8, 0x7c_u8, 0x50_u8, 0xd6_u8])

  CLSID_FaxDeviceIds = LibC::GUID.new(0xcdc539ea_u32, 0x7277_u16, 0x460e_u16, StaticArray[0x8d_u8, 0xe0_u8, 0x48_u8, 0xa0_u8, 0xa5_u8, 0x76_u8, 0xd_u8, 0x1f_u8])

  CLSID_FaxOutboundRoutingRules = LibC::GUID.new(0xd385beca_u32, 0xe624_u16, 0x4473_u16, StaticArray[0xbf_u8, 0xaa_u8, 0x9f_u8, 0x40_u8, 0x0_u8, 0x83_u8, 0x1f_u8, 0x54_u8])

  CLSID_FaxOutboundRoutingRule = LibC::GUID.new(0x6549eebf_u32, 0x8d1_u16, 0x475a_u16, StaticArray[0x82_u8, 0x8b_u8, 0x3b_u8, 0xf1_u8, 0x5_u8, 0x95_u8, 0x2f_u8, 0xa0_u8])

  CLSID_FaxInboundRoutingExtensions = LibC::GUID.new(0x189a48ed_u32, 0x623c_u16, 0x4c0d_u16, StaticArray[0x80_u8, 0xf2_u8, 0xd6_u8, 0x6c_u8, 0x7b_u8, 0x9e_u8, 0xfe_u8, 0xc2_u8])

  CLSID_FaxInboundRoutingExtension = LibC::GUID.new(0x1d7dfb51_u32, 0x7207_u16, 0x4436_u16, StaticArray[0xa0_u8, 0xd9_u8, 0x24_u8, 0xe3_u8, 0x2e_u8, 0xe5_u8, 0x69_u8, 0x88_u8])

  CLSID_FaxInboundRoutingMethods = LibC::GUID.new(0x25fcb76a_u32, 0xb750_u16, 0x4b82_u16, StaticArray[0x92_u8, 0x66_u8, 0xfb_u8, 0xbb_u8, 0xae_u8, 0x89_u8, 0x22_u8, 0xba_u8])

  CLSID_FaxInboundRoutingMethod = LibC::GUID.new(0x4b9fd75c_u32, 0x194_u16, 0x4b72_u16, StaticArray[0x9c_u8, 0xe5_u8, 0x2_u8, 0xa8_u8, 0x20_u8, 0x5a_u8, 0xc7_u8, 0xd4_u8])

  CLSID_FaxJobStatus = LibC::GUID.new(0x7bf222f4_u32, 0xbe8d_u16, 0x442f_u16, StaticArray[0x84_u8, 0x1d_u8, 0x61_u8, 0x32_u8, 0x74_u8, 0x24_u8, 0x23_u8, 0xbb_u8])

  CLSID_FaxRecipient = LibC::GUID.new(0x60bf3301_u32, 0x7df8_u16, 0x4bd8_u16, StaticArray[0x91_u8, 0x48_u8, 0x7b_u8, 0x58_u8, 0x1_u8, 0xf9_u8, 0xef_u8, 0xdf_u8])

  CLSID_FaxConfiguration = LibC::GUID.new(0x5857326f_u32, 0xe7b3_u16, 0x41a7_u16, StaticArray[0x9c_u8, 0x19_u8, 0xa9_u8, 0x1b_u8, 0x46_u8, 0x3e_u8, 0x2d_u8, 0x56_u8])

  CLSID_FaxAccountSet = LibC::GUID.new(0xfbc23c4b_u32, 0x79e0_u16, 0x4291_u16, StaticArray[0xbc_u8, 0x56_u8, 0xc1_u8, 0x2e_u8, 0x25_u8, 0x3b_u8, 0xbf_u8, 0x3a_u8])

  CLSID_FaxAccounts = LibC::GUID.new(0xda1f94aa_u32, 0xee2c_u16, 0x47c0_u16, StaticArray[0x8f_u8, 0x4f_u8, 0x2a_u8, 0x21_u8, 0x70_u8, 0x75_u8, 0xb7_u8, 0x6e_u8])

  CLSID_FaxAccount = LibC::GUID.new(0xa7e0647f_u32, 0x4524_u16, 0x4464_u16, StaticArray[0xa5_u8, 0x6d_u8, 0xb9_u8, 0xfe_u8, 0x66_u8, 0x6f_u8, 0x71_u8, 0x5e_u8])

  CLSID_FaxAccountFolders = LibC::GUID.new(0x85398f49_u32, 0xc034_u16, 0x4a3f_u16, StaticArray[0x82_u8, 0x1c_u8, 0xdb_u8, 0x7d_u8, 0x68_u8, 0x5e_u8, 0x81_u8, 0x29_u8])

  CLSID_FaxAccountIncomingQueue = LibC::GUID.new(0x9bcf6094_u32, 0xb4da_u16, 0x45f4_u16, StaticArray[0xb8_u8, 0xd6_u8, 0xdd_u8, 0xeb_u8, 0x21_u8, 0x86_u8, 0x65_u8, 0x2c_u8])

  CLSID_FaxAccountOutgoingQueue = LibC::GUID.new(0xfeeceefb_u32, 0xc149_u16, 0x48ba_u16, StaticArray[0xba_u8, 0xb8_u8, 0xb7_u8, 0x91_u8, 0xe1_u8, 0x1_u8, 0xf6_u8, 0x2f_u8])

  CLSID_FaxAccountIncomingArchive = LibC::GUID.new(0x14b33db5_u32, 0x4c40_u16, 0x4ecf_u16, StaticArray[0x9e_u8, 0xf8_u8, 0xa3_u8, 0x60_u8, 0xcb_u8, 0xe8_u8, 0x9_u8, 0xed_u8])

  CLSID_FaxAccountOutgoingArchive = LibC::GUID.new(0x851e7af5_u32, 0x433a_u16, 0x4739_u16, StaticArray[0xa2_u8, 0xdf_u8, 0xad_u8, 0x24_u8, 0x5c_u8, 0x2c_u8, 0xb9_u8, 0x8e_u8])

  CLSID_FaxSecurity2 = LibC::GUID.new(0x735c1248_u32, 0xec89_u16, 0x4c30_u16, StaticArray[0xa1_u8, 0x27_u8, 0x65_u8, 0x6e_u8, 0x92_u8, 0xe3_u8, 0xc4_u8, 0xea_u8])

  enum FAX_ENUM_LOG_LEVELS
    FAXLOG_LEVEL_NONE = 0_i32
    FAXLOG_LEVEL_MIN = 1_i32
    FAXLOG_LEVEL_MED = 2_i32
    FAXLOG_LEVEL_MAX = 3_i32
  end
  enum FAX_ENUM_LOG_CATEGORIES
    FAXLOG_CATEGORY_INIT = 1_i32
    FAXLOG_CATEGORY_OUTBOUND = 2_i32
    FAXLOG_CATEGORY_INBOUND = 3_i32
    FAXLOG_CATEGORY_UNKNOWN = 4_i32
  end
  enum FAX_ENUM_JOB_COMMANDS
    JC_UNKNOWN = 0_i32
    JC_DELETE = 1_i32
    JC_PAUSE = 2_i32
    JC_RESUME = 3_i32
  end
  enum FAX_ENUM_JOB_SEND_ATTRIBUTES
    JSA_NOW = 0_i32
    JSA_SPECIFIC_TIME = 1_i32
    JSA_DISCOUNT_PERIOD = 2_i32
  end
  enum FAX_ENUM_DELIVERY_REPORT_TYPES
    DRT_NONE = 0_i32
    DRT_EMAIL = 1_i32
    DRT_INBOX = 2_i32
  end
  enum FAX_ENUM_PORT_OPEN_TYPE
    PORT_OPEN_QUERY = 1_i32
    PORT_OPEN_MODIFY = 2_i32
  end
  enum FAX_JOB_STATUS_ENUM
    Fjspending = 1_i32
    Fjsinprogress = 2_i32
    Fjsfailed = 8_i32
    Fjspaused = 16_i32
    Fjsnoline = 32_i32
    Fjsretrying = 64_i32
    Fjsretries_exceeded = 128_i32
    Fjscompleted = 256_i32
    Fjscanceled = 512_i32
    Fjscanceling = 1024_i32
    Fjsrouting = 2048_i32
  end
  enum FAX_JOB_EXTENDED_STATUS_ENUM
    Fjesnone = 0_i32
    Fjesdisconnected = 1_i32
    Fjesinitializing = 2_i32
    Fjesdialing = 3_i32
    Fjestransmitting = 4_i32
    Fjesanswered = 5_i32
    Fjesreceiving = 6_i32
    Fjesline_unavailable = 7_i32
    Fjesbusy = 8_i32
    Fjesno_answer = 9_i32
    Fjesbad_address = 10_i32
    Fjesno_dial_tone = 11_i32
    Fjesfatal_error = 12_i32
    Fjescall_delayed = 13_i32
    Fjescall_blacklisted = 14_i32
    Fjesnot_fax_call = 15_i32
    Fjespartially_received = 16_i32
    Fjeshandled = 17_i32
    Fjescall_completed = 18_i32
    Fjescall_aborted = 19_i32
    Fjesproprietary = 16777216_i32
  end
  enum FAX_JOB_OPERATIONS_ENUM
    Fjoview = 1_i32
    Fjopause = 2_i32
    Fjoresume = 4_i32
    Fjorestart = 8_i32
    Fjodelete = 16_i32
    Fjorecipient_info = 32_i32
    Fjosender_info = 64_i32
  end
  enum FAX_JOB_TYPE_ENUM
    Fjtsend = 0_i32
    Fjtreceive = 1_i32
    Fjtrouting = 2_i32
  end
  enum FAX_SERVER_EVENTS_TYPE_ENUM
    Fsetnone = 0_i32
    Fsetin_queue = 1_i32
    Fsetout_queue = 2_i32
    Fsetconfig = 4_i32
    Fsetactivity = 8_i32
    Fsetqueue_state = 16_i32
    Fsetin_archive = 32_i32
    Fsetout_archive = 64_i32
    Fsetfxssvc_ended = 128_i32
    Fsetdevice_status = 256_i32
    Fsetincoming_call = 512_i32
  end
  enum FAX_SERVER_APIVERSION_ENUM
    Fsapi_version_0 = 0_i32
    Fsapi_version_1 = 65536_i32
    Fsapi_version_2 = 131072_i32
    Fsapi_version_3 = 196608_i32
  end
  enum FAX_SMTP_AUTHENTICATION_TYPE_ENUM
    Fsatanonymous = 0_i32
    Fsatbasic = 1_i32
    Fsatntlm = 2_i32
  end
  enum FAX_RECEIPT_TYPE_ENUM
    Frtnone = 0_i32
    Frtmail = 1_i32
    Frtmsgbox = 4_i32
  end
  enum FAX_ACCESS_RIGHTS_ENUM
    Farsubmit_low = 1_i32
    Farsubmit_normal = 2_i32
    Farsubmit_high = 4_i32
    Farquery_jobs = 8_i32
    Farmanage_jobs = 16_i32
    Farquery_config = 32_i32
    Farmanage_config = 64_i32
    Farquery_in_archive = 128_i32
    Farmanage_in_archive = 256_i32
    Farquery_out_archive = 512_i32
    Farmanage_out_archive = 1024_i32
  end
  enum FAX_PRIORITY_TYPE_ENUM
    Fptlow = 0_i32
    Fptnormal = 1_i32
    Fpthigh = 2_i32
  end
  enum FAX_COVERPAGE_TYPE_ENUM
    Fcptnone = 0_i32
    Fcptlocal = 1_i32
    Fcptserver = 2_i32
  end
  enum FAX_SCHEDULE_TYPE_ENUM
    Fstnow = 0_i32
    Fstspecific_time = 1_i32
    Fstdiscount_period = 2_i32
  end
  enum FAX_PROVIDER_STATUS_ENUM
    Fpssuccess = 0_i32
    Fpsserver_error = 1_i32
    Fpsbad_guid = 2_i32
    Fpsbad_version = 3_i32
    Fpscant_load = 4_i32
    Fpscant_link = 5_i32
    Fpscant_init = 6_i32
  end
  enum FAX_DEVICE_RECEIVE_MODE_ENUM
    Fdrmno_answer = 0_i32
    Fdrmauto_answer = 1_i32
    Fdrmmanual_answer = 2_i32
  end
  enum FAX_LOG_LEVEL_ENUM
    Fllnone = 0_i32
    Fllmin = 1_i32
    Fllmed = 2_i32
    Fllmax = 3_i32
  end
  enum FAX_GROUP_STATUS_ENUM
    Fgsall_dev_valid = 0_i32
    Fgsempty = 1_i32
    Fgsall_dev_not_valid = 2_i32
    Fgssome_dev_not_valid = 3_i32
  end
  enum FAX_RULE_STATUS_ENUM
    Frsvalid = 0_i32
    Frsempty_group = 1_i32
    Frsall_group_dev_not_valid = 2_i32
    Frssome_group_dev_not_valid = 3_i32
    Frsbad_device = 4_i32
  end
  enum FAX_ACCOUNT_EVENTS_TYPE_ENUM
    Faetnone = 0_i32
    Faetin_queue = 1_i32
    Faetout_queue = 2_i32
    Faetin_archive = 4_i32
    Faetout_archive = 8_i32
    Faetfxssvc_ended = 16_i32
  end
  enum FAX_ACCESS_RIGHTS_ENUM_2
    Far2submit_low = 1_i32
    Far2submit_normal = 2_i32
    Far2submit_high = 4_i32
    Far2query_out_jobs = 8_i32
    Far2manage_out_jobs = 16_i32
    Far2query_config = 32_i32
    Far2manage_config = 64_i32
    Far2query_archives = 128_i32
    Far2manage_archives = 256_i32
    Far2manage_receive_folder = 512_i32
  end
  enum FAX_ROUTING_RULE_CODE_ENUM
    Frrcany_code = 0_i32
  end
  enum FAXROUTE_ENABLE
    QUERY_STATUS = -1_i32
    STATUS_DISABLE = 0_i32
    STATUS_ENABLE = 1_i32
  end
  enum FAX_ENUM_DEVICE_ID_SOURCE
    DEV_ID_SRC_FAX = 0_i32
    DEV_ID_SRC_TAPI = 1_i32
  end
  enum SendToMode
    SEND_TO_FAX_RECIPIENT_ATTACHMENT = 0_i32
  end
  enum STI_DEVICE_MJ_TYPE
    StiDeviceTypeDefault = 0_i32
    StiDeviceTypeScanner = 1_i32
    StiDeviceTypeDigitalCamera = 2_i32
    StiDeviceTypeStreamingVideo = 3_i32
  end

  @[Extern]
  record FAX_LOG_CATEGORYA,
    name : Win32cr::Foundation::PSTR,
    category : UInt32,
    level : UInt32

  @[Extern]
  record FAX_LOG_CATEGORYW,
    name : Win32cr::Foundation::PWSTR,
    category : UInt32,
    level : UInt32

  @[Extern]
  record FAX_TIME,
    hour : UInt16,
    minute : UInt16

  @[Extern]
  record FAX_CONFIGURATIONA,
    size_of_struct : UInt32,
    retries : UInt32,
    retry_delay : UInt32,
    dirty_days : UInt32,
    branding : Win32cr::Foundation::BOOL,
    use_device_tsid : Win32cr::Foundation::BOOL,
    server_cp : Win32cr::Foundation::BOOL,
    pause_server_queue : Win32cr::Foundation::BOOL,
    start_cheap_time : Win32cr::Devices::Fax::FAX_TIME,
    stop_cheap_time : Win32cr::Devices::Fax::FAX_TIME,
    archive_outgoing_faxes : Win32cr::Foundation::BOOL,
    archive_directory : Win32cr::Foundation::PSTR,
    reserved : Win32cr::Foundation::PSTR

  @[Extern]
  record FAX_CONFIGURATIONW,
    size_of_struct : UInt32,
    retries : UInt32,
    retry_delay : UInt32,
    dirty_days : UInt32,
    branding : Win32cr::Foundation::BOOL,
    use_device_tsid : Win32cr::Foundation::BOOL,
    server_cp : Win32cr::Foundation::BOOL,
    pause_server_queue : Win32cr::Foundation::BOOL,
    start_cheap_time : Win32cr::Devices::Fax::FAX_TIME,
    stop_cheap_time : Win32cr::Devices::Fax::FAX_TIME,
    archive_outgoing_faxes : Win32cr::Foundation::BOOL,
    archive_directory : Win32cr::Foundation::PWSTR,
    reserved : Win32cr::Foundation::PWSTR

  @[Extern]
  record FAX_DEVICE_STATUSA,
    size_of_struct : UInt32,
    caller_id : Win32cr::Foundation::PSTR,
    csid : Win32cr::Foundation::PSTR,
    current_page : UInt32,
    device_id : UInt32,
    device_name : Win32cr::Foundation::PSTR,
    document_name : Win32cr::Foundation::PSTR,
    job_type : UInt32,
    phone_number : Win32cr::Foundation::PSTR,
    routing_string : Win32cr::Foundation::PSTR,
    sender_name : Win32cr::Foundation::PSTR,
    recipient_name : Win32cr::Foundation::PSTR,
    size : UInt32,
    start_time : Win32cr::Foundation::FILETIME,
    status : UInt32,
    status_string : Win32cr::Foundation::PSTR,
    submitted_time : Win32cr::Foundation::FILETIME,
    total_pages : UInt32,
    tsid : Win32cr::Foundation::PSTR,
    user_name : Win32cr::Foundation::PSTR

  @[Extern]
  record FAX_DEVICE_STATUSW,
    size_of_struct : UInt32,
    caller_id : Win32cr::Foundation::PWSTR,
    csid : Win32cr::Foundation::PWSTR,
    current_page : UInt32,
    device_id : UInt32,
    device_name : Win32cr::Foundation::PWSTR,
    document_name : Win32cr::Foundation::PWSTR,
    job_type : UInt32,
    phone_number : Win32cr::Foundation::PWSTR,
    routing_string : Win32cr::Foundation::PWSTR,
    sender_name : Win32cr::Foundation::PWSTR,
    recipient_name : Win32cr::Foundation::PWSTR,
    size : UInt32,
    start_time : Win32cr::Foundation::FILETIME,
    status : UInt32,
    status_string : Win32cr::Foundation::PWSTR,
    submitted_time : Win32cr::Foundation::FILETIME,
    total_pages : UInt32,
    tsid : Win32cr::Foundation::PWSTR,
    user_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record FAX_JOB_ENTRYA,
    size_of_struct : UInt32,
    job_id : UInt32,
    user_name : Win32cr::Foundation::PSTR,
    job_type : UInt32,
    queue_status : UInt32,
    status : UInt32,
    size : UInt32,
    page_count : UInt32,
    recipient_number : Win32cr::Foundation::PSTR,
    recipient_name : Win32cr::Foundation::PSTR,
    tsid : Win32cr::Foundation::PSTR,
    sender_name : Win32cr::Foundation::PSTR,
    sender_company : Win32cr::Foundation::PSTR,
    sender_dept : Win32cr::Foundation::PSTR,
    billing_code : Win32cr::Foundation::PSTR,
    schedule_action : UInt32,
    schedule_time : Win32cr::Foundation::SYSTEMTIME,
    delivery_report_type : UInt32,
    delivery_report_address : Win32cr::Foundation::PSTR,
    document_name : Win32cr::Foundation::PSTR

  @[Extern]
  record FAX_JOB_ENTRYW,
    size_of_struct : UInt32,
    job_id : UInt32,
    user_name : Win32cr::Foundation::PWSTR,
    job_type : UInt32,
    queue_status : UInt32,
    status : UInt32,
    size : UInt32,
    page_count : UInt32,
    recipient_number : Win32cr::Foundation::PWSTR,
    recipient_name : Win32cr::Foundation::PWSTR,
    tsid : Win32cr::Foundation::PWSTR,
    sender_name : Win32cr::Foundation::PWSTR,
    sender_company : Win32cr::Foundation::PWSTR,
    sender_dept : Win32cr::Foundation::PWSTR,
    billing_code : Win32cr::Foundation::PWSTR,
    schedule_action : UInt32,
    schedule_time : Win32cr::Foundation::SYSTEMTIME,
    delivery_report_type : UInt32,
    delivery_report_address : Win32cr::Foundation::PWSTR,
    document_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record FAX_PORT_INFOA,
    size_of_struct : UInt32,
    device_id : UInt32,
    state : UInt32,
    flags : UInt32,
    rings : UInt32,
    priority : UInt32,
    device_name : Win32cr::Foundation::PSTR,
    tsid : Win32cr::Foundation::PSTR,
    csid : Win32cr::Foundation::PSTR

  @[Extern]
  record FAX_PORT_INFOW,
    size_of_struct : UInt32,
    device_id : UInt32,
    state : UInt32,
    flags : UInt32,
    rings : UInt32,
    priority : UInt32,
    device_name : Win32cr::Foundation::PWSTR,
    tsid : Win32cr::Foundation::PWSTR,
    csid : Win32cr::Foundation::PWSTR

  @[Extern]
  record FAX_ROUTING_METHODA,
    size_of_struct : UInt32,
    device_id : UInt32,
    enabled : Win32cr::Foundation::BOOL,
    device_name : Win32cr::Foundation::PSTR,
    guid : Win32cr::Foundation::PSTR,
    friendly_name : Win32cr::Foundation::PSTR,
    function_name : Win32cr::Foundation::PSTR,
    extension_image_name : Win32cr::Foundation::PSTR,
    extension_friendly_name : Win32cr::Foundation::PSTR

  @[Extern]
  record FAX_ROUTING_METHODW,
    size_of_struct : UInt32,
    device_id : UInt32,
    enabled : Win32cr::Foundation::BOOL,
    device_name : Win32cr::Foundation::PWSTR,
    guid : Win32cr::Foundation::PWSTR,
    friendly_name : Win32cr::Foundation::PWSTR,
    function_name : Win32cr::Foundation::PWSTR,
    extension_image_name : Win32cr::Foundation::PWSTR,
    extension_friendly_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record FAX_GLOBAL_ROUTING_INFOA,
    size_of_struct : UInt32,
    priority : UInt32,
    guid : Win32cr::Foundation::PSTR,
    friendly_name : Win32cr::Foundation::PSTR,
    function_name : Win32cr::Foundation::PSTR,
    extension_image_name : Win32cr::Foundation::PSTR,
    extension_friendly_name : Win32cr::Foundation::PSTR

  @[Extern]
  record FAX_GLOBAL_ROUTING_INFOW,
    size_of_struct : UInt32,
    priority : UInt32,
    guid : Win32cr::Foundation::PWSTR,
    friendly_name : Win32cr::Foundation::PWSTR,
    function_name : Win32cr::Foundation::PWSTR,
    extension_image_name : Win32cr::Foundation::PWSTR,
    extension_friendly_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record FAX_COVERPAGE_INFOA,
    size_of_struct : UInt32,
    cover_page_name : Win32cr::Foundation::PSTR,
    use_server_cover_page : Win32cr::Foundation::BOOL,
    rec_name : Win32cr::Foundation::PSTR,
    rec_fax_number : Win32cr::Foundation::PSTR,
    rec_company : Win32cr::Foundation::PSTR,
    rec_street_address : Win32cr::Foundation::PSTR,
    rec_city : Win32cr::Foundation::PSTR,
    rec_state : Win32cr::Foundation::PSTR,
    rec_zip : Win32cr::Foundation::PSTR,
    rec_country : Win32cr::Foundation::PSTR,
    rec_title : Win32cr::Foundation::PSTR,
    rec_department : Win32cr::Foundation::PSTR,
    rec_office_location : Win32cr::Foundation::PSTR,
    rec_home_phone : Win32cr::Foundation::PSTR,
    rec_office_phone : Win32cr::Foundation::PSTR,
    sdr_name : Win32cr::Foundation::PSTR,
    sdr_fax_number : Win32cr::Foundation::PSTR,
    sdr_company : Win32cr::Foundation::PSTR,
    sdr_address : Win32cr::Foundation::PSTR,
    sdr_title : Win32cr::Foundation::PSTR,
    sdr_department : Win32cr::Foundation::PSTR,
    sdr_office_location : Win32cr::Foundation::PSTR,
    sdr_home_phone : Win32cr::Foundation::PSTR,
    sdr_office_phone : Win32cr::Foundation::PSTR,
    note : Win32cr::Foundation::PSTR,
    subject : Win32cr::Foundation::PSTR,
    time_sent : Win32cr::Foundation::SYSTEMTIME,
    page_count : UInt32

  @[Extern]
  record FAX_COVERPAGE_INFOW,
    size_of_struct : UInt32,
    cover_page_name : Win32cr::Foundation::PWSTR,
    use_server_cover_page : Win32cr::Foundation::BOOL,
    rec_name : Win32cr::Foundation::PWSTR,
    rec_fax_number : Win32cr::Foundation::PWSTR,
    rec_company : Win32cr::Foundation::PWSTR,
    rec_street_address : Win32cr::Foundation::PWSTR,
    rec_city : Win32cr::Foundation::PWSTR,
    rec_state : Win32cr::Foundation::PWSTR,
    rec_zip : Win32cr::Foundation::PWSTR,
    rec_country : Win32cr::Foundation::PWSTR,
    rec_title : Win32cr::Foundation::PWSTR,
    rec_department : Win32cr::Foundation::PWSTR,
    rec_office_location : Win32cr::Foundation::PWSTR,
    rec_home_phone : Win32cr::Foundation::PWSTR,
    rec_office_phone : Win32cr::Foundation::PWSTR,
    sdr_name : Win32cr::Foundation::PWSTR,
    sdr_fax_number : Win32cr::Foundation::PWSTR,
    sdr_company : Win32cr::Foundation::PWSTR,
    sdr_address : Win32cr::Foundation::PWSTR,
    sdr_title : Win32cr::Foundation::PWSTR,
    sdr_department : Win32cr::Foundation::PWSTR,
    sdr_office_location : Win32cr::Foundation::PWSTR,
    sdr_home_phone : Win32cr::Foundation::PWSTR,
    sdr_office_phone : Win32cr::Foundation::PWSTR,
    note : Win32cr::Foundation::PWSTR,
    subject : Win32cr::Foundation::PWSTR,
    time_sent : Win32cr::Foundation::SYSTEMTIME,
    page_count : UInt32

  @[Extern]
  record FAX_JOB_PARAMA,
    size_of_struct : UInt32,
    recipient_number : Win32cr::Foundation::PSTR,
    recipient_name : Win32cr::Foundation::PSTR,
    tsid : Win32cr::Foundation::PSTR,
    sender_name : Win32cr::Foundation::PSTR,
    sender_company : Win32cr::Foundation::PSTR,
    sender_dept : Win32cr::Foundation::PSTR,
    billing_code : Win32cr::Foundation::PSTR,
    schedule_action : UInt32,
    schedule_time : Win32cr::Foundation::SYSTEMTIME,
    delivery_report_type : UInt32,
    delivery_report_address : Win32cr::Foundation::PSTR,
    document_name : Win32cr::Foundation::PSTR,
    call_handle : UInt32,
    reserved : LibC::UIntPtrT[3]

  @[Extern]
  record FAX_JOB_PARAMW,
    size_of_struct : UInt32,
    recipient_number : Win32cr::Foundation::PWSTR,
    recipient_name : Win32cr::Foundation::PWSTR,
    tsid : Win32cr::Foundation::PWSTR,
    sender_name : Win32cr::Foundation::PWSTR,
    sender_company : Win32cr::Foundation::PWSTR,
    sender_dept : Win32cr::Foundation::PWSTR,
    billing_code : Win32cr::Foundation::PWSTR,
    schedule_action : UInt32,
    schedule_time : Win32cr::Foundation::SYSTEMTIME,
    delivery_report_type : UInt32,
    delivery_report_address : Win32cr::Foundation::PWSTR,
    document_name : Win32cr::Foundation::PWSTR,
    call_handle : UInt32,
    reserved : LibC::UIntPtrT[3]

  @[Extern]
  record FAX_EVENTA,
    size_of_struct : UInt32,
    time_stamp : Win32cr::Foundation::FILETIME,
    device_id : UInt32,
    event_id : UInt32,
    job_id : UInt32

  @[Extern]
  record FAX_EVENTW,
    size_of_struct : UInt32,
    time_stamp : Win32cr::Foundation::FILETIME,
    device_id : UInt32,
    event_id : UInt32,
    job_id : UInt32

  @[Extern]
  record FAX_PRINT_INFOA,
    size_of_struct : UInt32,
    doc_name : Win32cr::Foundation::PSTR,
    recipient_name : Win32cr::Foundation::PSTR,
    recipient_number : Win32cr::Foundation::PSTR,
    sender_name : Win32cr::Foundation::PSTR,
    sender_company : Win32cr::Foundation::PSTR,
    sender_dept : Win32cr::Foundation::PSTR,
    sender_billing_code : Win32cr::Foundation::PSTR,
    reserved : Win32cr::Foundation::PSTR,
    dr_email_address : Win32cr::Foundation::PSTR,
    output_file_name : Win32cr::Foundation::PSTR

  @[Extern]
  record FAX_PRINT_INFOW,
    size_of_struct : UInt32,
    doc_name : Win32cr::Foundation::PWSTR,
    recipient_name : Win32cr::Foundation::PWSTR,
    recipient_number : Win32cr::Foundation::PWSTR,
    sender_name : Win32cr::Foundation::PWSTR,
    sender_company : Win32cr::Foundation::PWSTR,
    sender_dept : Win32cr::Foundation::PWSTR,
    sender_billing_code : Win32cr::Foundation::PWSTR,
    reserved : Win32cr::Foundation::PWSTR,
    dr_email_address : Win32cr::Foundation::PWSTR,
    output_file_name : Win32cr::Foundation::PWSTR

  @[Extern]
  record FAX_CONTEXT_INFOA,
    size_of_struct : UInt32,
    hDC : Win32cr::Graphics::Gdi::HDC,
    server_name : Win32cr::Foundation::CHAR[16]

  @[Extern]
  record FAX_CONTEXT_INFOW,
    size_of_struct : UInt32,
    hDC : Win32cr::Graphics::Gdi::HDC,
    server_name : UInt16[16]

  @[Extern]
  record FAX_SEND,
    size_of_struct : UInt32,
    file_name : Win32cr::Foundation::PWSTR,
    caller_name : Win32cr::Foundation::PWSTR,
    caller_number : Win32cr::Foundation::PWSTR,
    receiver_name : Win32cr::Foundation::PWSTR,
    receiver_number : Win32cr::Foundation::PWSTR,
    branding : Win32cr::Foundation::BOOL,
    call_handle : UInt32,
    reserved : UInt32[3]

  @[Extern]
  record FAX_RECEIVE,
    size_of_struct : UInt32,
    file_name : Win32cr::Foundation::PWSTR,
    receiver_name : Win32cr::Foundation::PWSTR,
    receiver_number : Win32cr::Foundation::PWSTR,
    reserved : UInt32[4]

  @[Extern]
  record FAX_DEV_STATUS,
    size_of_struct : UInt32,
    status_id : UInt32,
    string_id : UInt32,
    page_count : UInt32,
    csi : Win32cr::Foundation::PWSTR,
    caller_id : Win32cr::Foundation::PWSTR,
    routing_info : Win32cr::Foundation::PWSTR,
    error_code : UInt32,
    reserved : UInt32[3]

  @[Extern]
  record FAX_ROUTE_CALLBACKROUTINES,
    size_of_struct : UInt32,
    fax_route_add_file : Win32cr::Devices::Fax::PFAXROUTEADDFILE,
    fax_route_delete_file : Win32cr::Devices::Fax::PFAXROUTEDELETEFILE,
    fax_route_get_file : Win32cr::Devices::Fax::PFAXROUTEGETFILE,
    fax_route_enum_files : Win32cr::Devices::Fax::PFAXROUTEENUMFILES,
    fax_route_modify_routing_data : Win32cr::Devices::Fax::PFAXROUTEMODIFYROUTINGDATA

  @[Extern]
  record FAX_ROUTE,
    size_of_struct : UInt32,
    job_id : UInt32,
    elapsed_time : UInt64,
    receive_time : UInt64,
    page_count : UInt32,
    csid : Win32cr::Foundation::PWSTR,
    tsid : Win32cr::Foundation::PWSTR,
    caller_id : Win32cr::Foundation::PWSTR,
    routing_info : Win32cr::Foundation::PWSTR,
    receiver_name : Win32cr::Foundation::PWSTR,
    receiver_number : Win32cr::Foundation::PWSTR,
    device_name : Win32cr::Foundation::PWSTR,
    device_id : UInt32,
    routing_info_data : UInt8*,
    routing_info_data_size : UInt32

  @[Extern]
  record STI_DEV_CAPS,
    dwGeneric : UInt32

  @[Extern]
  record STI_DEVICE_INFORMATIONW,
    dwSize : UInt32,
    device_type : UInt32,
    szDeviceInternalName : UInt16[128],
    device_capabilities_a : Win32cr::Devices::Fax::STI_DEV_CAPS,
    dwHardwareConfiguration : UInt32,
    pszVendorDescription : Win32cr::Foundation::PWSTR,
    pszDeviceDescription : Win32cr::Foundation::PWSTR,
    pszPortName : Win32cr::Foundation::PWSTR,
    pszPropProvider : Win32cr::Foundation::PWSTR,
    pszLocalName : Win32cr::Foundation::PWSTR

  @[Extern]
  record STI_WIA_DEVICE_INFORMATIONW,
    dwSize : UInt32,
    device_type : UInt32,
    szDeviceInternalName : UInt16[128],
    device_capabilities_a : Win32cr::Devices::Fax::STI_DEV_CAPS,
    dwHardwareConfiguration : UInt32,
    pszVendorDescription : Win32cr::Foundation::PWSTR,
    pszDeviceDescription : Win32cr::Foundation::PWSTR,
    pszPortName : Win32cr::Foundation::PWSTR,
    pszPropProvider : Win32cr::Foundation::PWSTR,
    pszLocalName : Win32cr::Foundation::PWSTR,
    pszUiDll : Win32cr::Foundation::PWSTR,
    pszServer : Win32cr::Foundation::PWSTR

  @[Extern]
  record STI_DEVICE_STATUS,
    dwSize : UInt32,
    status_mask : UInt32,
    dwOnlineState : UInt32,
    dwHardwareStatusCode : UInt32,
    dwEventHandlingState : UInt32,
    dwPollingInterval : UInt32

  @[Extern]
  record ERROR_INFOW_,
    dwSize : UInt32,
    dwGenericError : UInt32,
    dwVendorError : UInt32,
    szExtendedErrorText : UInt16[255]

  @[Extern]
  record STI_DIAG,
    dwSize : UInt32,
    dwBasicDiagCode : UInt32,
    dwVendorDiagCode : UInt32,
    dwStatusMask : UInt32,
    sErrorInfo : Win32cr::Devices::Fax::ERROR_INFOW_

  @[Extern]
  record STISUBSCRIBE,
    dwSize : UInt32,
    dwFlags : UInt32,
    dwFilter : UInt32,
    hWndNotify : Win32cr::Foundation::HWND,
    hEvent : Win32cr::Foundation::HANDLE,
    uiNotificationMessage : UInt32

  @[Extern]
  record STINOTIFY,
    dwSize : UInt32,
    guidNotificationCode : LibC::GUID,
    abNotificationData : UInt8[64]

  @[Extern]
  record STI_USD_CAPS,
    dwVersion : UInt32,
    dwGenericCaps : UInt32

  @[Extern]
  record IFaxJobStatusVtbl,
    query_interface : Proc(IFaxJobStatus*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxJobStatus*, UInt32),
    release : Proc(IFaxJobStatus*, UInt32),
    get_type_info_count : Proc(IFaxJobStatus*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxJobStatus*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxJobStatus*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxJobStatus*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(IFaxJobStatus*, Win32cr::Devices::Fax::FAX_JOB_STATUS_ENUM*, Win32cr::Foundation::HRESULT),
    get_Pages : Proc(IFaxJobStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_Size : Proc(IFaxJobStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentPage : Proc(IFaxJobStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceId : Proc(IFaxJobStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_CSID : Proc(IFaxJobStatus*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TSID : Proc(IFaxJobStatus*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ExtendedStatusCode : Proc(IFaxJobStatus*, Win32cr::Devices::Fax::FAX_JOB_EXTENDED_STATUS_ENUM*, Win32cr::Foundation::HRESULT),
    get_ExtendedStatus : Proc(IFaxJobStatus*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AvailableOperations : Proc(IFaxJobStatus*, Win32cr::Devices::Fax::FAX_JOB_OPERATIONS_ENUM*, Win32cr::Foundation::HRESULT),
    get_Retries : Proc(IFaxJobStatus*, Int32*, Win32cr::Foundation::HRESULT),
    get_JobType : Proc(IFaxJobStatus*, Win32cr::Devices::Fax::FAX_JOB_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    get_ScheduledTime : Proc(IFaxJobStatus*, Float64*, Win32cr::Foundation::HRESULT),
    get_TransmissionStart : Proc(IFaxJobStatus*, Float64*, Win32cr::Foundation::HRESULT),
    get_TransmissionEnd : Proc(IFaxJobStatus*, Float64*, Win32cr::Foundation::HRESULT),
    get_CallerId : Proc(IFaxJobStatus*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RoutingInformation : Proc(IFaxJobStatus*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8b86f485-fd7f-4824-886b-40c5caa617cc")]
  record IFaxJobStatus, lpVtbl : IFaxJobStatusVtbl* do
    GUID = LibC::GUID.new(0x8b86f485_u32, 0xfd7f_u16, 0x4824_u16, StaticArray[0x88_u8, 0x6b_u8, 0x40_u8, 0xc5_u8, 0xca_u8, 0xa6_u8, 0x17_u8, 0xcc_u8])
    def query_interface(this : IFaxJobStatus*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxJobStatus*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxJobStatus*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxJobStatus*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxJobStatus*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxJobStatus*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxJobStatus*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Status(this : IFaxJobStatus*, pStatus : Win32cr::Devices::Fax::FAX_JOB_STATUS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, pStatus)
    end
    def get_Pages(this : IFaxJobStatus*, plPages : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Pages.call(this, plPages)
    end
    def get_Size(this : IFaxJobStatus*, plSize : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Size.call(this, plSize)
    end
    def get_CurrentPage(this : IFaxJobStatus*, plCurrentPage : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentPage.call(this, plCurrentPage)
    end
    def get_DeviceId(this : IFaxJobStatus*, plDeviceId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceId.call(this, plDeviceId)
    end
    def get_CSID(this : IFaxJobStatus*, pbstrCSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CSID.call(this, pbstrCSID)
    end
    def get_TSID(this : IFaxJobStatus*, pbstrTSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TSID.call(this, pbstrTSID)
    end
    def get_ExtendedStatusCode(this : IFaxJobStatus*, pExtendedStatusCode : Win32cr::Devices::Fax::FAX_JOB_EXTENDED_STATUS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtendedStatusCode.call(this, pExtendedStatusCode)
    end
    def get_ExtendedStatus(this : IFaxJobStatus*, pbstrExtendedStatus : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtendedStatus.call(this, pbstrExtendedStatus)
    end
    def get_AvailableOperations(this : IFaxJobStatus*, pAvailableOperations : Win32cr::Devices::Fax::FAX_JOB_OPERATIONS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AvailableOperations.call(this, pAvailableOperations)
    end
    def get_Retries(this : IFaxJobStatus*, plRetries : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Retries.call(this, plRetries)
    end
    def get_JobType(this : IFaxJobStatus*, pJobType : Win32cr::Devices::Fax::FAX_JOB_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_JobType.call(this, pJobType)
    end
    def get_ScheduledTime(this : IFaxJobStatus*, pdateScheduledTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScheduledTime.call(this, pdateScheduledTime)
    end
    def get_TransmissionStart(this : IFaxJobStatus*, pdateTransmissionStart : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionStart.call(this, pdateTransmissionStart)
    end
    def get_TransmissionEnd(this : IFaxJobStatus*, pdateTransmissionEnd : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionEnd.call(this, pdateTransmissionEnd)
    end
    def get_CallerId(this : IFaxJobStatus*, pbstrCallerId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CallerId.call(this, pbstrCallerId)
    end
    def get_RoutingInformation(this : IFaxJobStatus*, pbstrRoutingInformation : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RoutingInformation.call(this, pbstrRoutingInformation)
    end

  end

  @[Extern]
  record IFaxServerVtbl,
    query_interface : Proc(IFaxServer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxServer*, UInt32),
    release : Proc(IFaxServer*, UInt32),
    get_type_info_count : Proc(IFaxServer*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxServer*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxServer*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxServer*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    connect : Proc(IFaxServer*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ServerName : Proc(IFaxServer*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_device_providers : Proc(IFaxServer*, Void**, Win32cr::Foundation::HRESULT),
    get_devices : Proc(IFaxServer*, Void**, Win32cr::Foundation::HRESULT),
    get_InboundRouting : Proc(IFaxServer*, Void**, Win32cr::Foundation::HRESULT),
    get_Folders : Proc(IFaxServer*, Void**, Win32cr::Foundation::HRESULT),
    get_LoggingOptions : Proc(IFaxServer*, Void**, Win32cr::Foundation::HRESULT),
    get_MajorVersion : Proc(IFaxServer*, Int32*, Win32cr::Foundation::HRESULT),
    get_MinorVersion : Proc(IFaxServer*, Int32*, Win32cr::Foundation::HRESULT),
    get_MajorBuild : Proc(IFaxServer*, Int32*, Win32cr::Foundation::HRESULT),
    get_MinorBuild : Proc(IFaxServer*, Int32*, Win32cr::Foundation::HRESULT),
    get_Debug : Proc(IFaxServer*, Int16*, Win32cr::Foundation::HRESULT),
    get_Activity : Proc(IFaxServer*, Void**, Win32cr::Foundation::HRESULT),
    get_OutboundRouting : Proc(IFaxServer*, Void**, Win32cr::Foundation::HRESULT),
    get_ReceiptOptions : Proc(IFaxServer*, Void**, Win32cr::Foundation::HRESULT),
    get_Security : Proc(IFaxServer*, Void**, Win32cr::Foundation::HRESULT),
    disconnect : Proc(IFaxServer*, Win32cr::Foundation::HRESULT),
    get_extension_property : Proc(IFaxServer*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_extension_property : Proc(IFaxServer*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    listen_to_server_events : Proc(IFaxServer*, Win32cr::Devices::Fax::FAX_SERVER_EVENTS_TYPE_ENUM, Win32cr::Foundation::HRESULT),
    register_device_provider : Proc(IFaxServer*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    unregister_device_provider : Proc(IFaxServer*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    register_inbound_routing_extension : Proc(IFaxServer*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    unregister_inbound_routing_extension : Proc(IFaxServer*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RegisteredEvents : Proc(IFaxServer*, Win32cr::Devices::Fax::FAX_SERVER_EVENTS_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    get_APIVersion : Proc(IFaxServer*, Win32cr::Devices::Fax::FAX_SERVER_APIVERSION_ENUM*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("475b6469-90a5-4878-a577-17a86e8e3462")]
  record IFaxServer, lpVtbl : IFaxServerVtbl* do
    GUID = LibC::GUID.new(0x475b6469_u32, 0x90a5_u16, 0x4878_u16, StaticArray[0xa5_u8, 0x77_u8, 0x17_u8, 0xa8_u8, 0x6e_u8, 0x8e_u8, 0x34_u8, 0x62_u8])
    def query_interface(this : IFaxServer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxServer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxServer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxServer*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxServer*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxServer*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxServer*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def connect(this : IFaxServer*, bstrServerName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this, bstrServerName)
    end
    def get_ServerName(this : IFaxServer*, pbstrServerName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServerName.call(this, pbstrServerName)
    end
    def get_device_providers(this : IFaxServer*, ppFaxDeviceProviders : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_providers.call(this, ppFaxDeviceProviders)
    end
    def get_devices(this : IFaxServer*, ppFaxDevices : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_devices.call(this, ppFaxDevices)
    end
    def get_InboundRouting(this : IFaxServer*, ppFaxInboundRouting : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InboundRouting.call(this, ppFaxInboundRouting)
    end
    def get_Folders(this : IFaxServer*, pFaxFolders : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Folders.call(this, pFaxFolders)
    end
    def get_LoggingOptions(this : IFaxServer*, ppFaxLoggingOptions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LoggingOptions.call(this, ppFaxLoggingOptions)
    end
    def get_MajorVersion(this : IFaxServer*, plMajorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MajorVersion.call(this, plMajorVersion)
    end
    def get_MinorVersion(this : IFaxServer*, plMinorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinorVersion.call(this, plMinorVersion)
    end
    def get_MajorBuild(this : IFaxServer*, plMajorBuild : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MajorBuild.call(this, plMajorBuild)
    end
    def get_MinorBuild(this : IFaxServer*, plMinorBuild : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinorBuild.call(this, plMinorBuild)
    end
    def get_Debug(this : IFaxServer*, pbDebug : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Debug.call(this, pbDebug)
    end
    def get_Activity(this : IFaxServer*, ppFaxActivity : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Activity.call(this, ppFaxActivity)
    end
    def get_OutboundRouting(this : IFaxServer*, ppFaxOutboundRouting : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutboundRouting.call(this, ppFaxOutboundRouting)
    end
    def get_ReceiptOptions(this : IFaxServer*, ppFaxReceiptOptions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReceiptOptions.call(this, ppFaxReceiptOptions)
    end
    def get_Security(this : IFaxServer*, ppFaxSecurity : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Security.call(this, ppFaxSecurity)
    end
    def disconnect(this : IFaxServer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect.call(this)
    end
    def get_extension_property(this : IFaxServer*, bstrGUID : Win32cr::Foundation::BSTR, pvProperty : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_extension_property.call(this, bstrGUID, pvProperty)
    end
    def set_extension_property(this : IFaxServer*, bstrGUID : Win32cr::Foundation::BSTR, vProperty : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_extension_property.call(this, bstrGUID, vProperty)
    end
    def listen_to_server_events(this : IFaxServer*, event_types : Win32cr::Devices::Fax::FAX_SERVER_EVENTS_TYPE_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.listen_to_server_events.call(this, event_types)
    end
    def register_device_provider(this : IFaxServer*, bstrGUID : Win32cr::Foundation::BSTR, bstrFriendlyName : Win32cr::Foundation::BSTR, bstrImageName : Win32cr::Foundation::BSTR, tsp_name : Win32cr::Foundation::BSTR, lFSPIVersion : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_device_provider.call(this, bstrGUID, bstrFriendlyName, bstrImageName, tsp_name, lFSPIVersion)
    end
    def unregister_device_provider(this : IFaxServer*, bstrUniqueName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_device_provider.call(this, bstrUniqueName)
    end
    def register_inbound_routing_extension(this : IFaxServer*, bstrExtensionName : Win32cr::Foundation::BSTR, bstrFriendlyName : Win32cr::Foundation::BSTR, bstrImageName : Win32cr::Foundation::BSTR, vMethods : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_inbound_routing_extension.call(this, bstrExtensionName, bstrFriendlyName, bstrImageName, vMethods)
    end
    def unregister_inbound_routing_extension(this : IFaxServer*, bstrExtensionUniqueName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_inbound_routing_extension.call(this, bstrExtensionUniqueName)
    end
    def get_RegisteredEvents(this : IFaxServer*, pEventTypes : Win32cr::Devices::Fax::FAX_SERVER_EVENTS_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RegisteredEvents.call(this, pEventTypes)
    end
    def get_APIVersion(this : IFaxServer*, pAPIVersion : Win32cr::Devices::Fax::FAX_SERVER_APIVERSION_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_APIVersion.call(this, pAPIVersion)
    end

  end

  @[Extern]
  record IFaxDeviceProvidersVtbl,
    query_interface : Proc(IFaxDeviceProviders*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxDeviceProviders*, UInt32),
    release : Proc(IFaxDeviceProviders*, UInt32),
    get_type_info_count : Proc(IFaxDeviceProviders*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxDeviceProviders*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxDeviceProviders*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxDeviceProviders*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IFaxDeviceProviders*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IFaxDeviceProviders*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IFaxDeviceProviders*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9fb76f62-4c7e-43a5-b6fd-502893f7e13e")]
  record IFaxDeviceProviders, lpVtbl : IFaxDeviceProvidersVtbl* do
    GUID = LibC::GUID.new(0x9fb76f62_u32, 0x4c7e_u16, 0x43a5_u16, StaticArray[0xb6_u8, 0xfd_u8, 0x50_u8, 0x28_u8, 0x93_u8, 0xf7_u8, 0xe1_u8, 0x3e_u8])
    def query_interface(this : IFaxDeviceProviders*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxDeviceProviders*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxDeviceProviders*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxDeviceProviders*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxDeviceProviders*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxDeviceProviders*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxDeviceProviders*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IFaxDeviceProviders*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppUnk)
    end
    def get_Item(this : IFaxDeviceProviders*, vIndex : Win32cr::System::Com::VARIANT, pFaxDeviceProvider : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, vIndex, pFaxDeviceProvider)
    end
    def get_Count(this : IFaxDeviceProviders*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end

  end

  @[Extern]
  record IFaxDevicesVtbl,
    query_interface : Proc(IFaxDevices*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxDevices*, UInt32),
    release : Proc(IFaxDevices*, UInt32),
    get_type_info_count : Proc(IFaxDevices*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxDevices*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxDevices*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxDevices*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IFaxDevices*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IFaxDevices*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IFaxDevices*, Int32*, Win32cr::Foundation::HRESULT),
    get_ItemById : Proc(IFaxDevices*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9e46783e-f34f-482e-a360-0416becbbd96")]
  record IFaxDevices, lpVtbl : IFaxDevicesVtbl* do
    GUID = LibC::GUID.new(0x9e46783e_u32, 0xf34f_u16, 0x482e_u16, StaticArray[0xa3_u8, 0x60_u8, 0x4_u8, 0x16_u8, 0xbe_u8, 0xcb_u8, 0xbd_u8, 0x96_u8])
    def query_interface(this : IFaxDevices*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxDevices*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxDevices*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxDevices*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxDevices*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxDevices*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxDevices*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IFaxDevices*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppUnk)
    end
    def get_Item(this : IFaxDevices*, vIndex : Win32cr::System::Com::VARIANT, pFaxDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, vIndex, pFaxDevice)
    end
    def get_Count(this : IFaxDevices*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def get_ItemById(this : IFaxDevices*, lId : Int32, ppFaxDevice : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ItemById.call(this, lId, ppFaxDevice)
    end

  end

  @[Extern]
  record IFaxInboundRoutingVtbl,
    query_interface : Proc(IFaxInboundRouting*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxInboundRouting*, UInt32),
    release : Proc(IFaxInboundRouting*, UInt32),
    get_type_info_count : Proc(IFaxInboundRouting*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxInboundRouting*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxInboundRouting*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxInboundRouting*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_extensions : Proc(IFaxInboundRouting*, Void**, Win32cr::Foundation::HRESULT),
    get_methods : Proc(IFaxInboundRouting*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8148c20f-9d52-45b1-bf96-38fc12713527")]
  record IFaxInboundRouting, lpVtbl : IFaxInboundRoutingVtbl* do
    GUID = LibC::GUID.new(0x8148c20f_u32, 0x9d52_u16, 0x45b1_u16, StaticArray[0xbf_u8, 0x96_u8, 0x38_u8, 0xfc_u8, 0x12_u8, 0x71_u8, 0x35_u8, 0x27_u8])
    def query_interface(this : IFaxInboundRouting*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxInboundRouting*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxInboundRouting*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxInboundRouting*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxInboundRouting*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxInboundRouting*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxInboundRouting*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_extensions(this : IFaxInboundRouting*, pFaxInboundRoutingExtensions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_extensions.call(this, pFaxInboundRoutingExtensions)
    end
    def get_methods(this : IFaxInboundRouting*, pFaxInboundRoutingMethods : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_methods.call(this, pFaxInboundRoutingMethods)
    end

  end

  @[Extern]
  record IFaxFoldersVtbl,
    query_interface : Proc(IFaxFolders*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxFolders*, UInt32),
    release : Proc(IFaxFolders*, UInt32),
    get_type_info_count : Proc(IFaxFolders*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxFolders*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxFolders*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxFolders*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_OutgoingQueue : Proc(IFaxFolders*, Void**, Win32cr::Foundation::HRESULT),
    get_IncomingQueue : Proc(IFaxFolders*, Void**, Win32cr::Foundation::HRESULT),
    get_IncomingArchive : Proc(IFaxFolders*, Void**, Win32cr::Foundation::HRESULT),
    get_OutgoingArchive : Proc(IFaxFolders*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dce3b2a8-a7ab-42bc-9d0a-3149457261a0")]
  record IFaxFolders, lpVtbl : IFaxFoldersVtbl* do
    GUID = LibC::GUID.new(0xdce3b2a8_u32, 0xa7ab_u16, 0x42bc_u16, StaticArray[0x9d_u8, 0xa_u8, 0x31_u8, 0x49_u8, 0x45_u8, 0x72_u8, 0x61_u8, 0xa0_u8])
    def query_interface(this : IFaxFolders*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxFolders*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxFolders*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxFolders*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxFolders*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxFolders*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxFolders*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_OutgoingQueue(this : IFaxFolders*, pFaxOutgoingQueue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutgoingQueue.call(this, pFaxOutgoingQueue)
    end
    def get_IncomingQueue(this : IFaxFolders*, pFaxIncomingQueue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IncomingQueue.call(this, pFaxIncomingQueue)
    end
    def get_IncomingArchive(this : IFaxFolders*, pFaxIncomingArchive : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IncomingArchive.call(this, pFaxIncomingArchive)
    end
    def get_OutgoingArchive(this : IFaxFolders*, pFaxOutgoingArchive : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutgoingArchive.call(this, pFaxOutgoingArchive)
    end

  end

  @[Extern]
  record IFaxLoggingOptionsVtbl,
    query_interface : Proc(IFaxLoggingOptions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxLoggingOptions*, UInt32),
    release : Proc(IFaxLoggingOptions*, UInt32),
    get_type_info_count : Proc(IFaxLoggingOptions*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxLoggingOptions*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxLoggingOptions*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxLoggingOptions*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_EventLogging : Proc(IFaxLoggingOptions*, Void**, Win32cr::Foundation::HRESULT),
    get_ActivityLogging : Proc(IFaxLoggingOptions*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("34e64fb9-6b31-4d32-8b27-d286c0c33606")]
  record IFaxLoggingOptions, lpVtbl : IFaxLoggingOptionsVtbl* do
    GUID = LibC::GUID.new(0x34e64fb9_u32, 0x6b31_u16, 0x4d32_u16, StaticArray[0x8b_u8, 0x27_u8, 0xd2_u8, 0x86_u8, 0xc0_u8, 0xc3_u8, 0x36_u8, 0x6_u8])
    def query_interface(this : IFaxLoggingOptions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxLoggingOptions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxLoggingOptions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxLoggingOptions*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxLoggingOptions*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxLoggingOptions*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxLoggingOptions*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_EventLogging(this : IFaxLoggingOptions*, pFaxEventLogging : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventLogging.call(this, pFaxEventLogging)
    end
    def get_ActivityLogging(this : IFaxLoggingOptions*, pFaxActivityLogging : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ActivityLogging.call(this, pFaxActivityLogging)
    end

  end

  @[Extern]
  record IFaxActivityVtbl,
    query_interface : Proc(IFaxActivity*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxActivity*, UInt32),
    release : Proc(IFaxActivity*, UInt32),
    get_type_info_count : Proc(IFaxActivity*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxActivity*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxActivity*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxActivity*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_IncomingMessages : Proc(IFaxActivity*, Int32*, Win32cr::Foundation::HRESULT),
    get_RoutingMessages : Proc(IFaxActivity*, Int32*, Win32cr::Foundation::HRESULT),
    get_OutgoingMessages : Proc(IFaxActivity*, Int32*, Win32cr::Foundation::HRESULT),
    get_QueuedMessages : Proc(IFaxActivity*, Int32*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxActivity*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4b106f97-3df5-40f2-bc3c-44cb8115ebdf")]
  record IFaxActivity, lpVtbl : IFaxActivityVtbl* do
    GUID = LibC::GUID.new(0x4b106f97_u32, 0x3df5_u16, 0x40f2_u16, StaticArray[0xbc_u8, 0x3c_u8, 0x44_u8, 0xcb_u8, 0x81_u8, 0x15_u8, 0xeb_u8, 0xdf_u8])
    def query_interface(this : IFaxActivity*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxActivity*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxActivity*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxActivity*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxActivity*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxActivity*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxActivity*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_IncomingMessages(this : IFaxActivity*, plIncomingMessages : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IncomingMessages.call(this, plIncomingMessages)
    end
    def get_RoutingMessages(this : IFaxActivity*, plRoutingMessages : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RoutingMessages.call(this, plRoutingMessages)
    end
    def get_OutgoingMessages(this : IFaxActivity*, plOutgoingMessages : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutgoingMessages.call(this, plOutgoingMessages)
    end
    def get_QueuedMessages(this : IFaxActivity*, plQueuedMessages : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_QueuedMessages.call(this, plQueuedMessages)
    end
    def refresh(this : IFaxActivity*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end

  end

  @[Extern]
  record IFaxOutboundRoutingVtbl,
    query_interface : Proc(IFaxOutboundRouting*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxOutboundRouting*, UInt32),
    release : Proc(IFaxOutboundRouting*, UInt32),
    get_type_info_count : Proc(IFaxOutboundRouting*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxOutboundRouting*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxOutboundRouting*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxOutboundRouting*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_groups : Proc(IFaxOutboundRouting*, Void**, Win32cr::Foundation::HRESULT),
    get_rules : Proc(IFaxOutboundRouting*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("25dc05a4-9909-41bd-a95b-7e5d1dec1d43")]
  record IFaxOutboundRouting, lpVtbl : IFaxOutboundRoutingVtbl* do
    GUID = LibC::GUID.new(0x25dc05a4_u32, 0x9909_u16, 0x41bd_u16, StaticArray[0xa9_u8, 0x5b_u8, 0x7e_u8, 0x5d_u8, 0x1d_u8, 0xec_u8, 0x1d_u8, 0x43_u8])
    def query_interface(this : IFaxOutboundRouting*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxOutboundRouting*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxOutboundRouting*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxOutboundRouting*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxOutboundRouting*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxOutboundRouting*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxOutboundRouting*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_groups(this : IFaxOutboundRouting*, pFaxOutboundRoutingGroups : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_groups.call(this, pFaxOutboundRoutingGroups)
    end
    def get_rules(this : IFaxOutboundRouting*, pFaxOutboundRoutingRules : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_rules.call(this, pFaxOutboundRoutingRules)
    end

  end

  @[Extern]
  record IFaxReceiptOptionsVtbl,
    query_interface : Proc(IFaxReceiptOptions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxReceiptOptions*, UInt32),
    release : Proc(IFaxReceiptOptions*, UInt32),
    get_type_info_count : Proc(IFaxReceiptOptions*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxReceiptOptions*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxReceiptOptions*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxReceiptOptions*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_AuthenticationType : Proc(IFaxReceiptOptions*, Win32cr::Devices::Fax::FAX_SMTP_AUTHENTICATION_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    put_AuthenticationType : Proc(IFaxReceiptOptions*, Win32cr::Devices::Fax::FAX_SMTP_AUTHENTICATION_TYPE_ENUM, Win32cr::Foundation::HRESULT),
    get_SMTPServer : Proc(IFaxReceiptOptions*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SMTPServer : Proc(IFaxReceiptOptions*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SMTPPort : Proc(IFaxReceiptOptions*, Int32*, Win32cr::Foundation::HRESULT),
    put_SMTPPort : Proc(IFaxReceiptOptions*, Int32, Win32cr::Foundation::HRESULT),
    get_SMTPSender : Proc(IFaxReceiptOptions*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SMTPSender : Proc(IFaxReceiptOptions*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SMTPUser : Proc(IFaxReceiptOptions*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SMTPUser : Proc(IFaxReceiptOptions*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_AllowedReceipts : Proc(IFaxReceiptOptions*, Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    put_AllowedReceipts : Proc(IFaxReceiptOptions*, Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM, Win32cr::Foundation::HRESULT),
    get_SMTPPassword : Proc(IFaxReceiptOptions*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SMTPPassword : Proc(IFaxReceiptOptions*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxReceiptOptions*, Win32cr::Foundation::HRESULT),
    save : Proc(IFaxReceiptOptions*, Win32cr::Foundation::HRESULT),
    get_UseForInboundRouting : Proc(IFaxReceiptOptions*, Int16*, Win32cr::Foundation::HRESULT),
    put_UseForInboundRouting : Proc(IFaxReceiptOptions*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("378efaeb-5fcb-4afb-b2ee-e16e80614487")]
  record IFaxReceiptOptions, lpVtbl : IFaxReceiptOptionsVtbl* do
    GUID = LibC::GUID.new(0x378efaeb_u32, 0x5fcb_u16, 0x4afb_u16, StaticArray[0xb2_u8, 0xee_u8, 0xe1_u8, 0x6e_u8, 0x80_u8, 0x61_u8, 0x44_u8, 0x87_u8])
    def query_interface(this : IFaxReceiptOptions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxReceiptOptions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxReceiptOptions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxReceiptOptions*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxReceiptOptions*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxReceiptOptions*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxReceiptOptions*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_AuthenticationType(this : IFaxReceiptOptions*, pType : Win32cr::Devices::Fax::FAX_SMTP_AUTHENTICATION_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AuthenticationType.call(this, pType)
    end
    def put_AuthenticationType(this : IFaxReceiptOptions*, type__ : Win32cr::Devices::Fax::FAX_SMTP_AUTHENTICATION_TYPE_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AuthenticationType.call(this, type__)
    end
    def get_SMTPServer(this : IFaxReceiptOptions*, pbstrSMTPServer : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SMTPServer.call(this, pbstrSMTPServer)
    end
    def put_SMTPServer(this : IFaxReceiptOptions*, bstrSMTPServer : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SMTPServer.call(this, bstrSMTPServer)
    end
    def get_SMTPPort(this : IFaxReceiptOptions*, plSMTPPort : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SMTPPort.call(this, plSMTPPort)
    end
    def put_SMTPPort(this : IFaxReceiptOptions*, lSMTPPort : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SMTPPort.call(this, lSMTPPort)
    end
    def get_SMTPSender(this : IFaxReceiptOptions*, pbstrSMTPSender : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SMTPSender.call(this, pbstrSMTPSender)
    end
    def put_SMTPSender(this : IFaxReceiptOptions*, bstrSMTPSender : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SMTPSender.call(this, bstrSMTPSender)
    end
    def get_SMTPUser(this : IFaxReceiptOptions*, pbstrSMTPUser : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SMTPUser.call(this, pbstrSMTPUser)
    end
    def put_SMTPUser(this : IFaxReceiptOptions*, bstrSMTPUser : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SMTPUser.call(this, bstrSMTPUser)
    end
    def get_AllowedReceipts(this : IFaxReceiptOptions*, pAllowedReceipts : Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowedReceipts.call(this, pAllowedReceipts)
    end
    def put_AllowedReceipts(this : IFaxReceiptOptions*, allowed_receipts : Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowedReceipts.call(this, allowed_receipts)
    end
    def get_SMTPPassword(this : IFaxReceiptOptions*, pbstrSMTPPassword : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SMTPPassword.call(this, pbstrSMTPPassword)
    end
    def put_SMTPPassword(this : IFaxReceiptOptions*, bstrSMTPPassword : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SMTPPassword.call(this, bstrSMTPPassword)
    end
    def refresh(this : IFaxReceiptOptions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def save(this : IFaxReceiptOptions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def get_UseForInboundRouting(this : IFaxReceiptOptions*, pbUseForInboundRouting : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UseForInboundRouting.call(this, pbUseForInboundRouting)
    end
    def put_UseForInboundRouting(this : IFaxReceiptOptions*, bUseForInboundRouting : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UseForInboundRouting.call(this, bUseForInboundRouting)
    end

  end

  @[Extern]
  record IFaxSecurityVtbl,
    query_interface : Proc(IFaxSecurity*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxSecurity*, UInt32),
    release : Proc(IFaxSecurity*, UInt32),
    get_type_info_count : Proc(IFaxSecurity*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxSecurity*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxSecurity*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxSecurity*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Descriptor : Proc(IFaxSecurity*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Descriptor : Proc(IFaxSecurity*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_GrantedRights : Proc(IFaxSecurity*, Win32cr::Devices::Fax::FAX_ACCESS_RIGHTS_ENUM*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxSecurity*, Win32cr::Foundation::HRESULT),
    save : Proc(IFaxSecurity*, Win32cr::Foundation::HRESULT),
    get_InformationType : Proc(IFaxSecurity*, Int32*, Win32cr::Foundation::HRESULT),
    put_InformationType : Proc(IFaxSecurity*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("77b508c1-09c0-47a2-91eb-fce7fdf2690e")]
  record IFaxSecurity, lpVtbl : IFaxSecurityVtbl* do
    GUID = LibC::GUID.new(0x77b508c1_u32, 0x9c0_u16, 0x47a2_u16, StaticArray[0x91_u8, 0xeb_u8, 0xfc_u8, 0xe7_u8, 0xfd_u8, 0xf2_u8, 0x69_u8, 0xe_u8])
    def query_interface(this : IFaxSecurity*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxSecurity*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxSecurity*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxSecurity*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxSecurity*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxSecurity*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxSecurity*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Descriptor(this : IFaxSecurity*, pvDescriptor : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Descriptor.call(this, pvDescriptor)
    end
    def put_Descriptor(this : IFaxSecurity*, vDescriptor : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Descriptor.call(this, vDescriptor)
    end
    def get_GrantedRights(this : IFaxSecurity*, pGrantedRights : Win32cr::Devices::Fax::FAX_ACCESS_RIGHTS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GrantedRights.call(this, pGrantedRights)
    end
    def refresh(this : IFaxSecurity*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def save(this : IFaxSecurity*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def get_InformationType(this : IFaxSecurity*, plInformationType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InformationType.call(this, plInformationType)
    end
    def put_InformationType(this : IFaxSecurity*, lInformationType : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InformationType.call(this, lInformationType)
    end

  end

  @[Extern]
  record IFaxDocumentVtbl,
    query_interface : Proc(IFaxDocument*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxDocument*, UInt32),
    release : Proc(IFaxDocument*, UInt32),
    get_type_info_count : Proc(IFaxDocument*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxDocument*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxDocument*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxDocument*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Body : Proc(IFaxDocument*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Body : Proc(IFaxDocument*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Sender : Proc(IFaxDocument*, Void**, Win32cr::Foundation::HRESULT),
    get_Recipients : Proc(IFaxDocument*, Void**, Win32cr::Foundation::HRESULT),
    get_CoverPage : Proc(IFaxDocument*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_CoverPage : Proc(IFaxDocument*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Subject : Proc(IFaxDocument*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Subject : Proc(IFaxDocument*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Note : Proc(IFaxDocument*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Note : Proc(IFaxDocument*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ScheduleTime : Proc(IFaxDocument*, Float64*, Win32cr::Foundation::HRESULT),
    put_ScheduleTime : Proc(IFaxDocument*, Float64, Win32cr::Foundation::HRESULT),
    get_ReceiptAddress : Proc(IFaxDocument*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ReceiptAddress : Proc(IFaxDocument*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_DocumentName : Proc(IFaxDocument*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_DocumentName : Proc(IFaxDocument*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_CallHandle : Proc(IFaxDocument*, Int32*, Win32cr::Foundation::HRESULT),
    put_CallHandle : Proc(IFaxDocument*, Int32, Win32cr::Foundation::HRESULT),
    get_CoverPageType : Proc(IFaxDocument*, Win32cr::Devices::Fax::FAX_COVERPAGE_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    put_CoverPageType : Proc(IFaxDocument*, Win32cr::Devices::Fax::FAX_COVERPAGE_TYPE_ENUM, Win32cr::Foundation::HRESULT),
    get_ScheduleType : Proc(IFaxDocument*, Win32cr::Devices::Fax::FAX_SCHEDULE_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    put_ScheduleType : Proc(IFaxDocument*, Win32cr::Devices::Fax::FAX_SCHEDULE_TYPE_ENUM, Win32cr::Foundation::HRESULT),
    get_ReceiptType : Proc(IFaxDocument*, Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    put_ReceiptType : Proc(IFaxDocument*, Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM, Win32cr::Foundation::HRESULT),
    get_GroupBroadcastReceipts : Proc(IFaxDocument*, Int16*, Win32cr::Foundation::HRESULT),
    put_GroupBroadcastReceipts : Proc(IFaxDocument*, Int16, Win32cr::Foundation::HRESULT),
    get_Priority : Proc(IFaxDocument*, Win32cr::Devices::Fax::FAX_PRIORITY_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    put_Priority : Proc(IFaxDocument*, Win32cr::Devices::Fax::FAX_PRIORITY_TYPE_ENUM, Win32cr::Foundation::HRESULT),
    get_TapiConnection : Proc(IFaxDocument*, Void**, Win32cr::Foundation::HRESULT),
    putref_TapiConnection : Proc(IFaxDocument*, Void*, Win32cr::Foundation::HRESULT),
    submit : Proc(IFaxDocument*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    connected_submit : Proc(IFaxDocument*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_AttachFaxToReceipt : Proc(IFaxDocument*, Int16*, Win32cr::Foundation::HRESULT),
    put_AttachFaxToReceipt : Proc(IFaxDocument*, Int16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b207a246-09e3-4a4e-a7dc-fea31d29458f")]
  record IFaxDocument, lpVtbl : IFaxDocumentVtbl* do
    GUID = LibC::GUID.new(0xb207a246_u32, 0x9e3_u16, 0x4a4e_u16, StaticArray[0xa7_u8, 0xdc_u8, 0xfe_u8, 0xa3_u8, 0x1d_u8, 0x29_u8, 0x45_u8, 0x8f_u8])
    def query_interface(this : IFaxDocument*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxDocument*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxDocument*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxDocument*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxDocument*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxDocument*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxDocument*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Body(this : IFaxDocument*, pbstrBody : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Body.call(this, pbstrBody)
    end
    def put_Body(this : IFaxDocument*, bstrBody : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Body.call(this, bstrBody)
    end
    def get_Sender(this : IFaxDocument*, ppFaxSender : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Sender.call(this, ppFaxSender)
    end
    def get_Recipients(this : IFaxDocument*, ppFaxRecipients : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Recipients.call(this, ppFaxRecipients)
    end
    def get_CoverPage(this : IFaxDocument*, pbstrCoverPage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CoverPage.call(this, pbstrCoverPage)
    end
    def put_CoverPage(this : IFaxDocument*, bstrCoverPage : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CoverPage.call(this, bstrCoverPage)
    end
    def get_Subject(this : IFaxDocument*, pbstrSubject : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Subject.call(this, pbstrSubject)
    end
    def put_Subject(this : IFaxDocument*, bstrSubject : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Subject.call(this, bstrSubject)
    end
    def get_Note(this : IFaxDocument*, pbstrNote : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Note.call(this, pbstrNote)
    end
    def put_Note(this : IFaxDocument*, bstrNote : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Note.call(this, bstrNote)
    end
    def get_ScheduleTime(this : IFaxDocument*, pdateScheduleTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScheduleTime.call(this, pdateScheduleTime)
    end
    def put_ScheduleTime(this : IFaxDocument*, dateScheduleTime : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScheduleTime.call(this, dateScheduleTime)
    end
    def get_ReceiptAddress(this : IFaxDocument*, pbstrReceiptAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReceiptAddress.call(this, pbstrReceiptAddress)
    end
    def put_ReceiptAddress(this : IFaxDocument*, bstrReceiptAddress : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReceiptAddress.call(this, bstrReceiptAddress)
    end
    def get_DocumentName(this : IFaxDocument*, pbstrDocumentName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DocumentName.call(this, pbstrDocumentName)
    end
    def put_DocumentName(this : IFaxDocument*, bstrDocumentName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DocumentName.call(this, bstrDocumentName)
    end
    def get_CallHandle(this : IFaxDocument*, plCallHandle : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CallHandle.call(this, plCallHandle)
    end
    def put_CallHandle(this : IFaxDocument*, lCallHandle : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CallHandle.call(this, lCallHandle)
    end
    def get_CoverPageType(this : IFaxDocument*, pCoverPageType : Win32cr::Devices::Fax::FAX_COVERPAGE_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CoverPageType.call(this, pCoverPageType)
    end
    def put_CoverPageType(this : IFaxDocument*, cover_page_type : Win32cr::Devices::Fax::FAX_COVERPAGE_TYPE_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CoverPageType.call(this, cover_page_type)
    end
    def get_ScheduleType(this : IFaxDocument*, pScheduleType : Win32cr::Devices::Fax::FAX_SCHEDULE_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScheduleType.call(this, pScheduleType)
    end
    def put_ScheduleType(this : IFaxDocument*, schedule_type : Win32cr::Devices::Fax::FAX_SCHEDULE_TYPE_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScheduleType.call(this, schedule_type)
    end
    def get_ReceiptType(this : IFaxDocument*, pReceiptType : Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReceiptType.call(this, pReceiptType)
    end
    def put_ReceiptType(this : IFaxDocument*, receipt_type : Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReceiptType.call(this, receipt_type)
    end
    def get_GroupBroadcastReceipts(this : IFaxDocument*, pbUseGrouping : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GroupBroadcastReceipts.call(this, pbUseGrouping)
    end
    def put_GroupBroadcastReceipts(this : IFaxDocument*, bUseGrouping : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GroupBroadcastReceipts.call(this, bUseGrouping)
    end
    def get_Priority(this : IFaxDocument*, pPriority : Win32cr::Devices::Fax::FAX_PRIORITY_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Priority.call(this, pPriority)
    end
    def put_Priority(this : IFaxDocument*, priority : Win32cr::Devices::Fax::FAX_PRIORITY_TYPE_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Priority.call(this, priority)
    end
    def get_TapiConnection(this : IFaxDocument*, ppTapiConnection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TapiConnection.call(this, ppTapiConnection)
    end
    def putref_TapiConnection(this : IFaxDocument*, pTapiConnection : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_TapiConnection.call(this, pTapiConnection)
    end
    def submit(this : IFaxDocument*, bstrFaxServerName : Win32cr::Foundation::BSTR, pvFaxOutgoingJobIDs : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, bstrFaxServerName, pvFaxOutgoingJobIDs)
    end
    def connected_submit(this : IFaxDocument*, pFaxServer : Void*, pvFaxOutgoingJobIDs : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connected_submit.call(this, pFaxServer, pvFaxOutgoingJobIDs)
    end
    def get_AttachFaxToReceipt(this : IFaxDocument*, pbAttachFax : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AttachFaxToReceipt.call(this, pbAttachFax)
    end
    def put_AttachFaxToReceipt(this : IFaxDocument*, bAttachFax : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AttachFaxToReceipt.call(this, bAttachFax)
    end

  end

  @[Extern]
  record IFaxSenderVtbl,
    query_interface : Proc(IFaxSender*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxSender*, UInt32),
    release : Proc(IFaxSender*, UInt32),
    get_type_info_count : Proc(IFaxSender*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxSender*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxSender*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxSender*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_BillingCode : Proc(IFaxSender*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_BillingCode : Proc(IFaxSender*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_City : Proc(IFaxSender*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_City : Proc(IFaxSender*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Company : Proc(IFaxSender*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Company : Proc(IFaxSender*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Country : Proc(IFaxSender*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Country : Proc(IFaxSender*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Department : Proc(IFaxSender*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Department : Proc(IFaxSender*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Email : Proc(IFaxSender*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Email : Proc(IFaxSender*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FaxNumber : Proc(IFaxSender*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FaxNumber : Proc(IFaxSender*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_HomePhone : Proc(IFaxSender*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_HomePhone : Proc(IFaxSender*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFaxSender*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFaxSender*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TSID : Proc(IFaxSender*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TSID : Proc(IFaxSender*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_OfficePhone : Proc(IFaxSender*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_OfficePhone : Proc(IFaxSender*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_OfficeLocation : Proc(IFaxSender*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_OfficeLocation : Proc(IFaxSender*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_State : Proc(IFaxSender*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_State : Proc(IFaxSender*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_StreetAddress : Proc(IFaxSender*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_StreetAddress : Proc(IFaxSender*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Title : Proc(IFaxSender*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Title : Proc(IFaxSender*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ZipCode : Proc(IFaxSender*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ZipCode : Proc(IFaxSender*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    load_default_sender : Proc(IFaxSender*, Win32cr::Foundation::HRESULT),
    save_default_sender : Proc(IFaxSender*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0d879d7d-f57a-4cc6-a6f9-3ee5d527b46a")]
  record IFaxSender, lpVtbl : IFaxSenderVtbl* do
    GUID = LibC::GUID.new(0xd879d7d_u32, 0xf57a_u16, 0x4cc6_u16, StaticArray[0xa6_u8, 0xf9_u8, 0x3e_u8, 0xe5_u8, 0xd5_u8, 0x27_u8, 0xb4_u8, 0x6a_u8])
    def query_interface(this : IFaxSender*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxSender*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxSender*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxSender*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxSender*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxSender*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxSender*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_BillingCode(this : IFaxSender*, pbstrBillingCode : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BillingCode.call(this, pbstrBillingCode)
    end
    def put_BillingCode(this : IFaxSender*, bstrBillingCode : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_BillingCode.call(this, bstrBillingCode)
    end
    def get_City(this : IFaxSender*, pbstrCity : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_City.call(this, pbstrCity)
    end
    def put_City(this : IFaxSender*, bstrCity : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_City.call(this, bstrCity)
    end
    def get_Company(this : IFaxSender*, pbstrCompany : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Company.call(this, pbstrCompany)
    end
    def put_Company(this : IFaxSender*, bstrCompany : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Company.call(this, bstrCompany)
    end
    def get_Country(this : IFaxSender*, pbstrCountry : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Country.call(this, pbstrCountry)
    end
    def put_Country(this : IFaxSender*, bstrCountry : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Country.call(this, bstrCountry)
    end
    def get_Department(this : IFaxSender*, pbstrDepartment : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Department.call(this, pbstrDepartment)
    end
    def put_Department(this : IFaxSender*, bstrDepartment : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Department.call(this, bstrDepartment)
    end
    def get_Email(this : IFaxSender*, pbstrEmail : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Email.call(this, pbstrEmail)
    end
    def put_Email(this : IFaxSender*, bstrEmail : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Email.call(this, bstrEmail)
    end
    def get_FaxNumber(this : IFaxSender*, pbstrFaxNumber : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FaxNumber.call(this, pbstrFaxNumber)
    end
    def put_FaxNumber(this : IFaxSender*, bstrFaxNumber : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FaxNumber.call(this, bstrFaxNumber)
    end
    def get_HomePhone(this : IFaxSender*, pbstrHomePhone : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HomePhone.call(this, pbstrHomePhone)
    end
    def put_HomePhone(this : IFaxSender*, bstrHomePhone : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_HomePhone.call(this, bstrHomePhone)
    end
    def get_Name(this : IFaxSender*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IFaxSender*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end
    def get_TSID(this : IFaxSender*, pbstrTSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TSID.call(this, pbstrTSID)
    end
    def put_TSID(this : IFaxSender*, bstrTSID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TSID.call(this, bstrTSID)
    end
    def get_OfficePhone(this : IFaxSender*, pbstrOfficePhone : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OfficePhone.call(this, pbstrOfficePhone)
    end
    def put_OfficePhone(this : IFaxSender*, bstrOfficePhone : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OfficePhone.call(this, bstrOfficePhone)
    end
    def get_OfficeLocation(this : IFaxSender*, pbstrOfficeLocation : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OfficeLocation.call(this, pbstrOfficeLocation)
    end
    def put_OfficeLocation(this : IFaxSender*, bstrOfficeLocation : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OfficeLocation.call(this, bstrOfficeLocation)
    end
    def get_State(this : IFaxSender*, pbstrState : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, pbstrState)
    end
    def put_State(this : IFaxSender*, bstrState : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_State.call(this, bstrState)
    end
    def get_StreetAddress(this : IFaxSender*, pbstrStreetAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StreetAddress.call(this, pbstrStreetAddress)
    end
    def put_StreetAddress(this : IFaxSender*, bstrStreetAddress : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_StreetAddress.call(this, bstrStreetAddress)
    end
    def get_Title(this : IFaxSender*, pbstrTitle : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Title.call(this, pbstrTitle)
    end
    def put_Title(this : IFaxSender*, bstrTitle : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Title.call(this, bstrTitle)
    end
    def get_ZipCode(this : IFaxSender*, pbstrZipCode : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ZipCode.call(this, pbstrZipCode)
    end
    def put_ZipCode(this : IFaxSender*, bstrZipCode : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ZipCode.call(this, bstrZipCode)
    end
    def load_default_sender(this : IFaxSender*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_default_sender.call(this)
    end
    def save_default_sender(this : IFaxSender*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_default_sender.call(this)
    end

  end

  @[Extern]
  record IFaxRecipientVtbl,
    query_interface : Proc(IFaxRecipient*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxRecipient*, UInt32),
    release : Proc(IFaxRecipient*, UInt32),
    get_type_info_count : Proc(IFaxRecipient*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxRecipient*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxRecipient*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxRecipient*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_FaxNumber : Proc(IFaxRecipient*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FaxNumber : Proc(IFaxRecipient*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFaxRecipient*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IFaxRecipient*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9a3da3a0-538d-42b6-9444-aaa57d0ce2bc")]
  record IFaxRecipient, lpVtbl : IFaxRecipientVtbl* do
    GUID = LibC::GUID.new(0x9a3da3a0_u32, 0x538d_u16, 0x42b6_u16, StaticArray[0x94_u8, 0x44_u8, 0xaa_u8, 0xa5_u8, 0x7d_u8, 0xc_u8, 0xe2_u8, 0xbc_u8])
    def query_interface(this : IFaxRecipient*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxRecipient*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxRecipient*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxRecipient*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxRecipient*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxRecipient*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxRecipient*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_FaxNumber(this : IFaxRecipient*, pbstrFaxNumber : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FaxNumber.call(this, pbstrFaxNumber)
    end
    def put_FaxNumber(this : IFaxRecipient*, bstrFaxNumber : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FaxNumber.call(this, bstrFaxNumber)
    end
    def get_Name(this : IFaxRecipient*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def put_Name(this : IFaxRecipient*, bstrName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, bstrName)
    end

  end

  @[Extern]
  record IFaxRecipientsVtbl,
    query_interface : Proc(IFaxRecipients*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxRecipients*, UInt32),
    release : Proc(IFaxRecipients*, UInt32),
    get_type_info_count : Proc(IFaxRecipients*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxRecipients*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxRecipients*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxRecipients*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IFaxRecipients*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IFaxRecipients*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IFaxRecipients*, Int32*, Win32cr::Foundation::HRESULT),
    add : Proc(IFaxRecipients*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    remove : Proc(IFaxRecipients*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b9c9de5a-894e-4492-9fa3-08c627c11d5d")]
  record IFaxRecipients, lpVtbl : IFaxRecipientsVtbl* do
    GUID = LibC::GUID.new(0xb9c9de5a_u32, 0x894e_u16, 0x4492_u16, StaticArray[0x9f_u8, 0xa3_u8, 0x8_u8, 0xc6_u8, 0x27_u8, 0xc1_u8, 0x1d_u8, 0x5d_u8])
    def query_interface(this : IFaxRecipients*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxRecipients*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxRecipients*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxRecipients*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxRecipients*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxRecipients*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxRecipients*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IFaxRecipients*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppUnk)
    end
    def get_Item(this : IFaxRecipients*, lIndex : Int32, ppFaxRecipient : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lIndex, ppFaxRecipient)
    end
    def get_Count(this : IFaxRecipients*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def add(this : IFaxRecipients*, bstrFaxNumber : Win32cr::Foundation::BSTR, bstrRecipientName : Win32cr::Foundation::BSTR, ppFaxRecipient : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, bstrFaxNumber, bstrRecipientName, ppFaxRecipient)
    end
    def remove(this : IFaxRecipients*, lIndex : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, lIndex)
    end

  end

  @[Extern]
  record IFaxIncomingArchiveVtbl,
    query_interface : Proc(IFaxIncomingArchive*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxIncomingArchive*, UInt32),
    release : Proc(IFaxIncomingArchive*, UInt32),
    get_type_info_count : Proc(IFaxIncomingArchive*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxIncomingArchive*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxIncomingArchive*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxIncomingArchive*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_UseArchive : Proc(IFaxIncomingArchive*, Int16*, Win32cr::Foundation::HRESULT),
    put_UseArchive : Proc(IFaxIncomingArchive*, Int16, Win32cr::Foundation::HRESULT),
    get_ArchiveFolder : Proc(IFaxIncomingArchive*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ArchiveFolder : Proc(IFaxIncomingArchive*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SizeQuotaWarning : Proc(IFaxIncomingArchive*, Int16*, Win32cr::Foundation::HRESULT),
    put_SizeQuotaWarning : Proc(IFaxIncomingArchive*, Int16, Win32cr::Foundation::HRESULT),
    get_HighQuotaWaterMark : Proc(IFaxIncomingArchive*, Int32*, Win32cr::Foundation::HRESULT),
    put_HighQuotaWaterMark : Proc(IFaxIncomingArchive*, Int32, Win32cr::Foundation::HRESULT),
    get_LowQuotaWaterMark : Proc(IFaxIncomingArchive*, Int32*, Win32cr::Foundation::HRESULT),
    put_LowQuotaWaterMark : Proc(IFaxIncomingArchive*, Int32, Win32cr::Foundation::HRESULT),
    get_AgeLimit : Proc(IFaxIncomingArchive*, Int32*, Win32cr::Foundation::HRESULT),
    put_AgeLimit : Proc(IFaxIncomingArchive*, Int32, Win32cr::Foundation::HRESULT),
    get_SizeLow : Proc(IFaxIncomingArchive*, Int32*, Win32cr::Foundation::HRESULT),
    get_SizeHigh : Proc(IFaxIncomingArchive*, Int32*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxIncomingArchive*, Win32cr::Foundation::HRESULT),
    save : Proc(IFaxIncomingArchive*, Win32cr::Foundation::HRESULT),
    get_messages : Proc(IFaxIncomingArchive*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_message : Proc(IFaxIncomingArchive*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("76062cc7-f714-4fbd-aa06-ed6e4a4b70f3")]
  record IFaxIncomingArchive, lpVtbl : IFaxIncomingArchiveVtbl* do
    GUID = LibC::GUID.new(0x76062cc7_u32, 0xf714_u16, 0x4fbd_u16, StaticArray[0xaa_u8, 0x6_u8, 0xed_u8, 0x6e_u8, 0x4a_u8, 0x4b_u8, 0x70_u8, 0xf3_u8])
    def query_interface(this : IFaxIncomingArchive*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxIncomingArchive*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxIncomingArchive*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxIncomingArchive*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxIncomingArchive*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxIncomingArchive*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxIncomingArchive*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_UseArchive(this : IFaxIncomingArchive*, pbUseArchive : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UseArchive.call(this, pbUseArchive)
    end
    def put_UseArchive(this : IFaxIncomingArchive*, bUseArchive : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UseArchive.call(this, bUseArchive)
    end
    def get_ArchiveFolder(this : IFaxIncomingArchive*, pbstrArchiveFolder : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ArchiveFolder.call(this, pbstrArchiveFolder)
    end
    def put_ArchiveFolder(this : IFaxIncomingArchive*, bstrArchiveFolder : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ArchiveFolder.call(this, bstrArchiveFolder)
    end
    def get_SizeQuotaWarning(this : IFaxIncomingArchive*, pbSizeQuotaWarning : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SizeQuotaWarning.call(this, pbSizeQuotaWarning)
    end
    def put_SizeQuotaWarning(this : IFaxIncomingArchive*, bSizeQuotaWarning : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SizeQuotaWarning.call(this, bSizeQuotaWarning)
    end
    def get_HighQuotaWaterMark(this : IFaxIncomingArchive*, plHighQuotaWaterMark : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HighQuotaWaterMark.call(this, plHighQuotaWaterMark)
    end
    def put_HighQuotaWaterMark(this : IFaxIncomingArchive*, lHighQuotaWaterMark : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_HighQuotaWaterMark.call(this, lHighQuotaWaterMark)
    end
    def get_LowQuotaWaterMark(this : IFaxIncomingArchive*, plLowQuotaWaterMark : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LowQuotaWaterMark.call(this, plLowQuotaWaterMark)
    end
    def put_LowQuotaWaterMark(this : IFaxIncomingArchive*, lLowQuotaWaterMark : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LowQuotaWaterMark.call(this, lLowQuotaWaterMark)
    end
    def get_AgeLimit(this : IFaxIncomingArchive*, plAgeLimit : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AgeLimit.call(this, plAgeLimit)
    end
    def put_AgeLimit(this : IFaxIncomingArchive*, lAgeLimit : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AgeLimit.call(this, lAgeLimit)
    end
    def get_SizeLow(this : IFaxIncomingArchive*, plSizeLow : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SizeLow.call(this, plSizeLow)
    end
    def get_SizeHigh(this : IFaxIncomingArchive*, plSizeHigh : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SizeHigh.call(this, plSizeHigh)
    end
    def refresh(this : IFaxIncomingArchive*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def save(this : IFaxIncomingArchive*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def get_messages(this : IFaxIncomingArchive*, lPrefetchSize : Int32, pFaxIncomingMessageIterator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_messages.call(this, lPrefetchSize, pFaxIncomingMessageIterator)
    end
    def get_message(this : IFaxIncomingArchive*, bstrMessageId : Win32cr::Foundation::BSTR, pFaxIncomingMessage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_message.call(this, bstrMessageId, pFaxIncomingMessage)
    end

  end

  @[Extern]
  record IFaxIncomingQueueVtbl,
    query_interface : Proc(IFaxIncomingQueue*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxIncomingQueue*, UInt32),
    release : Proc(IFaxIncomingQueue*, UInt32),
    get_type_info_count : Proc(IFaxIncomingQueue*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxIncomingQueue*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxIncomingQueue*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxIncomingQueue*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Blocked : Proc(IFaxIncomingQueue*, Int16*, Win32cr::Foundation::HRESULT),
    put_Blocked : Proc(IFaxIncomingQueue*, Int16, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxIncomingQueue*, Win32cr::Foundation::HRESULT),
    save : Proc(IFaxIncomingQueue*, Win32cr::Foundation::HRESULT),
    get_jobs : Proc(IFaxIncomingQueue*, Void**, Win32cr::Foundation::HRESULT),
    get_job : Proc(IFaxIncomingQueue*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("902e64ef-8fd8-4b75-9725-6014df161545")]
  record IFaxIncomingQueue, lpVtbl : IFaxIncomingQueueVtbl* do
    GUID = LibC::GUID.new(0x902e64ef_u32, 0x8fd8_u16, 0x4b75_u16, StaticArray[0x97_u8, 0x25_u8, 0x60_u8, 0x14_u8, 0xdf_u8, 0x16_u8, 0x15_u8, 0x45_u8])
    def query_interface(this : IFaxIncomingQueue*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxIncomingQueue*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxIncomingQueue*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxIncomingQueue*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxIncomingQueue*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxIncomingQueue*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxIncomingQueue*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Blocked(this : IFaxIncomingQueue*, pbBlocked : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Blocked.call(this, pbBlocked)
    end
    def put_Blocked(this : IFaxIncomingQueue*, bBlocked : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Blocked.call(this, bBlocked)
    end
    def refresh(this : IFaxIncomingQueue*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def save(this : IFaxIncomingQueue*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def get_jobs(this : IFaxIncomingQueue*, pFaxIncomingJobs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_jobs.call(this, pFaxIncomingJobs)
    end
    def get_job(this : IFaxIncomingQueue*, bstrJobId : Win32cr::Foundation::BSTR, pFaxIncomingJob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_job.call(this, bstrJobId, pFaxIncomingJob)
    end

  end

  @[Extern]
  record IFaxOutgoingArchiveVtbl,
    query_interface : Proc(IFaxOutgoingArchive*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxOutgoingArchive*, UInt32),
    release : Proc(IFaxOutgoingArchive*, UInt32),
    get_type_info_count : Proc(IFaxOutgoingArchive*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxOutgoingArchive*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxOutgoingArchive*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxOutgoingArchive*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_UseArchive : Proc(IFaxOutgoingArchive*, Int16*, Win32cr::Foundation::HRESULT),
    put_UseArchive : Proc(IFaxOutgoingArchive*, Int16, Win32cr::Foundation::HRESULT),
    get_ArchiveFolder : Proc(IFaxOutgoingArchive*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ArchiveFolder : Proc(IFaxOutgoingArchive*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SizeQuotaWarning : Proc(IFaxOutgoingArchive*, Int16*, Win32cr::Foundation::HRESULT),
    put_SizeQuotaWarning : Proc(IFaxOutgoingArchive*, Int16, Win32cr::Foundation::HRESULT),
    get_HighQuotaWaterMark : Proc(IFaxOutgoingArchive*, Int32*, Win32cr::Foundation::HRESULT),
    put_HighQuotaWaterMark : Proc(IFaxOutgoingArchive*, Int32, Win32cr::Foundation::HRESULT),
    get_LowQuotaWaterMark : Proc(IFaxOutgoingArchive*, Int32*, Win32cr::Foundation::HRESULT),
    put_LowQuotaWaterMark : Proc(IFaxOutgoingArchive*, Int32, Win32cr::Foundation::HRESULT),
    get_AgeLimit : Proc(IFaxOutgoingArchive*, Int32*, Win32cr::Foundation::HRESULT),
    put_AgeLimit : Proc(IFaxOutgoingArchive*, Int32, Win32cr::Foundation::HRESULT),
    get_SizeLow : Proc(IFaxOutgoingArchive*, Int32*, Win32cr::Foundation::HRESULT),
    get_SizeHigh : Proc(IFaxOutgoingArchive*, Int32*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxOutgoingArchive*, Win32cr::Foundation::HRESULT),
    save : Proc(IFaxOutgoingArchive*, Win32cr::Foundation::HRESULT),
    get_messages : Proc(IFaxOutgoingArchive*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_message : Proc(IFaxOutgoingArchive*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c9c28f40-8d80-4e53-810f-9a79919b49fd")]
  record IFaxOutgoingArchive, lpVtbl : IFaxOutgoingArchiveVtbl* do
    GUID = LibC::GUID.new(0xc9c28f40_u32, 0x8d80_u16, 0x4e53_u16, StaticArray[0x81_u8, 0xf_u8, 0x9a_u8, 0x79_u8, 0x91_u8, 0x9b_u8, 0x49_u8, 0xfd_u8])
    def query_interface(this : IFaxOutgoingArchive*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxOutgoingArchive*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxOutgoingArchive*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxOutgoingArchive*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxOutgoingArchive*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxOutgoingArchive*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxOutgoingArchive*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_UseArchive(this : IFaxOutgoingArchive*, pbUseArchive : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UseArchive.call(this, pbUseArchive)
    end
    def put_UseArchive(this : IFaxOutgoingArchive*, bUseArchive : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UseArchive.call(this, bUseArchive)
    end
    def get_ArchiveFolder(this : IFaxOutgoingArchive*, pbstrArchiveFolder : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ArchiveFolder.call(this, pbstrArchiveFolder)
    end
    def put_ArchiveFolder(this : IFaxOutgoingArchive*, bstrArchiveFolder : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ArchiveFolder.call(this, bstrArchiveFolder)
    end
    def get_SizeQuotaWarning(this : IFaxOutgoingArchive*, pbSizeQuotaWarning : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SizeQuotaWarning.call(this, pbSizeQuotaWarning)
    end
    def put_SizeQuotaWarning(this : IFaxOutgoingArchive*, bSizeQuotaWarning : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SizeQuotaWarning.call(this, bSizeQuotaWarning)
    end
    def get_HighQuotaWaterMark(this : IFaxOutgoingArchive*, plHighQuotaWaterMark : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HighQuotaWaterMark.call(this, plHighQuotaWaterMark)
    end
    def put_HighQuotaWaterMark(this : IFaxOutgoingArchive*, lHighQuotaWaterMark : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_HighQuotaWaterMark.call(this, lHighQuotaWaterMark)
    end
    def get_LowQuotaWaterMark(this : IFaxOutgoingArchive*, plLowQuotaWaterMark : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LowQuotaWaterMark.call(this, plLowQuotaWaterMark)
    end
    def put_LowQuotaWaterMark(this : IFaxOutgoingArchive*, lLowQuotaWaterMark : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LowQuotaWaterMark.call(this, lLowQuotaWaterMark)
    end
    def get_AgeLimit(this : IFaxOutgoingArchive*, plAgeLimit : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AgeLimit.call(this, plAgeLimit)
    end
    def put_AgeLimit(this : IFaxOutgoingArchive*, lAgeLimit : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AgeLimit.call(this, lAgeLimit)
    end
    def get_SizeLow(this : IFaxOutgoingArchive*, plSizeLow : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SizeLow.call(this, plSizeLow)
    end
    def get_SizeHigh(this : IFaxOutgoingArchive*, plSizeHigh : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SizeHigh.call(this, plSizeHigh)
    end
    def refresh(this : IFaxOutgoingArchive*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def save(this : IFaxOutgoingArchive*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def get_messages(this : IFaxOutgoingArchive*, lPrefetchSize : Int32, pFaxOutgoingMessageIterator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_messages.call(this, lPrefetchSize, pFaxOutgoingMessageIterator)
    end
    def get_message(this : IFaxOutgoingArchive*, bstrMessageId : Win32cr::Foundation::BSTR, pFaxOutgoingMessage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_message.call(this, bstrMessageId, pFaxOutgoingMessage)
    end

  end

  @[Extern]
  record IFaxOutgoingQueueVtbl,
    query_interface : Proc(IFaxOutgoingQueue*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxOutgoingQueue*, UInt32),
    release : Proc(IFaxOutgoingQueue*, UInt32),
    get_type_info_count : Proc(IFaxOutgoingQueue*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxOutgoingQueue*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxOutgoingQueue*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxOutgoingQueue*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Blocked : Proc(IFaxOutgoingQueue*, Int16*, Win32cr::Foundation::HRESULT),
    put_Blocked : Proc(IFaxOutgoingQueue*, Int16, Win32cr::Foundation::HRESULT),
    get_Paused : Proc(IFaxOutgoingQueue*, Int16*, Win32cr::Foundation::HRESULT),
    put_Paused : Proc(IFaxOutgoingQueue*, Int16, Win32cr::Foundation::HRESULT),
    get_AllowPersonalCoverPages : Proc(IFaxOutgoingQueue*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowPersonalCoverPages : Proc(IFaxOutgoingQueue*, Int16, Win32cr::Foundation::HRESULT),
    get_UseDeviceTSID : Proc(IFaxOutgoingQueue*, Int16*, Win32cr::Foundation::HRESULT),
    put_UseDeviceTSID : Proc(IFaxOutgoingQueue*, Int16, Win32cr::Foundation::HRESULT),
    get_Retries : Proc(IFaxOutgoingQueue*, Int32*, Win32cr::Foundation::HRESULT),
    put_Retries : Proc(IFaxOutgoingQueue*, Int32, Win32cr::Foundation::HRESULT),
    get_RetryDelay : Proc(IFaxOutgoingQueue*, Int32*, Win32cr::Foundation::HRESULT),
    put_RetryDelay : Proc(IFaxOutgoingQueue*, Int32, Win32cr::Foundation::HRESULT),
    get_DiscountRateStart : Proc(IFaxOutgoingQueue*, Float64*, Win32cr::Foundation::HRESULT),
    put_DiscountRateStart : Proc(IFaxOutgoingQueue*, Float64, Win32cr::Foundation::HRESULT),
    get_DiscountRateEnd : Proc(IFaxOutgoingQueue*, Float64*, Win32cr::Foundation::HRESULT),
    put_DiscountRateEnd : Proc(IFaxOutgoingQueue*, Float64, Win32cr::Foundation::HRESULT),
    get_AgeLimit : Proc(IFaxOutgoingQueue*, Int32*, Win32cr::Foundation::HRESULT),
    put_AgeLimit : Proc(IFaxOutgoingQueue*, Int32, Win32cr::Foundation::HRESULT),
    get_Branding : Proc(IFaxOutgoingQueue*, Int16*, Win32cr::Foundation::HRESULT),
    put_Branding : Proc(IFaxOutgoingQueue*, Int16, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxOutgoingQueue*, Win32cr::Foundation::HRESULT),
    save : Proc(IFaxOutgoingQueue*, Win32cr::Foundation::HRESULT),
    get_jobs : Proc(IFaxOutgoingQueue*, Void**, Win32cr::Foundation::HRESULT),
    get_job : Proc(IFaxOutgoingQueue*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("80b1df24-d9ac-4333-b373-487cedc80ce5")]
  record IFaxOutgoingQueue, lpVtbl : IFaxOutgoingQueueVtbl* do
    GUID = LibC::GUID.new(0x80b1df24_u32, 0xd9ac_u16, 0x4333_u16, StaticArray[0xb3_u8, 0x73_u8, 0x48_u8, 0x7c_u8, 0xed_u8, 0xc8_u8, 0xc_u8, 0xe5_u8])
    def query_interface(this : IFaxOutgoingQueue*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxOutgoingQueue*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxOutgoingQueue*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxOutgoingQueue*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxOutgoingQueue*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxOutgoingQueue*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxOutgoingQueue*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Blocked(this : IFaxOutgoingQueue*, pbBlocked : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Blocked.call(this, pbBlocked)
    end
    def put_Blocked(this : IFaxOutgoingQueue*, bBlocked : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Blocked.call(this, bBlocked)
    end
    def get_Paused(this : IFaxOutgoingQueue*, pbPaused : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Paused.call(this, pbPaused)
    end
    def put_Paused(this : IFaxOutgoingQueue*, bPaused : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Paused.call(this, bPaused)
    end
    def get_AllowPersonalCoverPages(this : IFaxOutgoingQueue*, pbAllowPersonalCoverPages : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowPersonalCoverPages.call(this, pbAllowPersonalCoverPages)
    end
    def put_AllowPersonalCoverPages(this : IFaxOutgoingQueue*, bAllowPersonalCoverPages : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowPersonalCoverPages.call(this, bAllowPersonalCoverPages)
    end
    def get_UseDeviceTSID(this : IFaxOutgoingQueue*, pbUseDeviceTSID : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UseDeviceTSID.call(this, pbUseDeviceTSID)
    end
    def put_UseDeviceTSID(this : IFaxOutgoingQueue*, bUseDeviceTSID : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UseDeviceTSID.call(this, bUseDeviceTSID)
    end
    def get_Retries(this : IFaxOutgoingQueue*, plRetries : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Retries.call(this, plRetries)
    end
    def put_Retries(this : IFaxOutgoingQueue*, lRetries : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Retries.call(this, lRetries)
    end
    def get_RetryDelay(this : IFaxOutgoingQueue*, plRetryDelay : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RetryDelay.call(this, plRetryDelay)
    end
    def put_RetryDelay(this : IFaxOutgoingQueue*, lRetryDelay : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RetryDelay.call(this, lRetryDelay)
    end
    def get_DiscountRateStart(this : IFaxOutgoingQueue*, pdateDiscountRateStart : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DiscountRateStart.call(this, pdateDiscountRateStart)
    end
    def put_DiscountRateStart(this : IFaxOutgoingQueue*, dateDiscountRateStart : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DiscountRateStart.call(this, dateDiscountRateStart)
    end
    def get_DiscountRateEnd(this : IFaxOutgoingQueue*, pdateDiscountRateEnd : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DiscountRateEnd.call(this, pdateDiscountRateEnd)
    end
    def put_DiscountRateEnd(this : IFaxOutgoingQueue*, dateDiscountRateEnd : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DiscountRateEnd.call(this, dateDiscountRateEnd)
    end
    def get_AgeLimit(this : IFaxOutgoingQueue*, plAgeLimit : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AgeLimit.call(this, plAgeLimit)
    end
    def put_AgeLimit(this : IFaxOutgoingQueue*, lAgeLimit : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AgeLimit.call(this, lAgeLimit)
    end
    def get_Branding(this : IFaxOutgoingQueue*, pbBranding : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Branding.call(this, pbBranding)
    end
    def put_Branding(this : IFaxOutgoingQueue*, bBranding : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Branding.call(this, bBranding)
    end
    def refresh(this : IFaxOutgoingQueue*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def save(this : IFaxOutgoingQueue*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def get_jobs(this : IFaxOutgoingQueue*, pFaxOutgoingJobs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_jobs.call(this, pFaxOutgoingJobs)
    end
    def get_job(this : IFaxOutgoingQueue*, bstrJobId : Win32cr::Foundation::BSTR, pFaxOutgoingJob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_job.call(this, bstrJobId, pFaxOutgoingJob)
    end

  end

  @[Extern]
  record IFaxIncomingMessageIteratorVtbl,
    query_interface : Proc(IFaxIncomingMessageIterator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxIncomingMessageIterator*, UInt32),
    release : Proc(IFaxIncomingMessageIterator*, UInt32),
    get_type_info_count : Proc(IFaxIncomingMessageIterator*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxIncomingMessageIterator*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxIncomingMessageIterator*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxIncomingMessageIterator*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Message : Proc(IFaxIncomingMessageIterator*, Void**, Win32cr::Foundation::HRESULT),
    get_PrefetchSize : Proc(IFaxIncomingMessageIterator*, Int32*, Win32cr::Foundation::HRESULT),
    put_PrefetchSize : Proc(IFaxIncomingMessageIterator*, Int32, Win32cr::Foundation::HRESULT),
    get_AtEOF : Proc(IFaxIncomingMessageIterator*, Int16*, Win32cr::Foundation::HRESULT),
    move_first : Proc(IFaxIncomingMessageIterator*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IFaxIncomingMessageIterator*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fd73ecc4-6f06-4f52-82a8-f7ba06ae3108")]
  record IFaxIncomingMessageIterator, lpVtbl : IFaxIncomingMessageIteratorVtbl* do
    GUID = LibC::GUID.new(0xfd73ecc4_u32, 0x6f06_u16, 0x4f52_u16, StaticArray[0x82_u8, 0xa8_u8, 0xf7_u8, 0xba_u8, 0x6_u8, 0xae_u8, 0x31_u8, 0x8_u8])
    def query_interface(this : IFaxIncomingMessageIterator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxIncomingMessageIterator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxIncomingMessageIterator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxIncomingMessageIterator*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxIncomingMessageIterator*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxIncomingMessageIterator*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxIncomingMessageIterator*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Message(this : IFaxIncomingMessageIterator*, pFaxIncomingMessage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Message.call(this, pFaxIncomingMessage)
    end
    def get_PrefetchSize(this : IFaxIncomingMessageIterator*, plPrefetchSize : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrefetchSize.call(this, plPrefetchSize)
    end
    def put_PrefetchSize(this : IFaxIncomingMessageIterator*, lPrefetchSize : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PrefetchSize.call(this, lPrefetchSize)
    end
    def get_AtEOF(this : IFaxIncomingMessageIterator*, pbEOF : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AtEOF.call(this, pbEOF)
    end
    def move_first(this : IFaxIncomingMessageIterator*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_first.call(this)
    end
    def move_next(this : IFaxIncomingMessageIterator*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this)
    end

  end

  @[Extern]
  record IFaxIncomingMessageVtbl,
    query_interface : Proc(IFaxIncomingMessage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxIncomingMessage*, UInt32),
    release : Proc(IFaxIncomingMessage*, UInt32),
    get_type_info_count : Proc(IFaxIncomingMessage*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxIncomingMessage*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxIncomingMessage*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxIncomingMessage*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFaxIncomingMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Pages : Proc(IFaxIncomingMessage*, Int32*, Win32cr::Foundation::HRESULT),
    get_Size : Proc(IFaxIncomingMessage*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceName : Proc(IFaxIncomingMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Retries : Proc(IFaxIncomingMessage*, Int32*, Win32cr::Foundation::HRESULT),
    get_TransmissionStart : Proc(IFaxIncomingMessage*, Float64*, Win32cr::Foundation::HRESULT),
    get_TransmissionEnd : Proc(IFaxIncomingMessage*, Float64*, Win32cr::Foundation::HRESULT),
    get_CSID : Proc(IFaxIncomingMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TSID : Proc(IFaxIncomingMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CallerId : Proc(IFaxIncomingMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RoutingInformation : Proc(IFaxIncomingMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    copy_tiff : Proc(IFaxIncomingMessage*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFaxIncomingMessage*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7cab88fa-2ef9-4851-b2f3-1d148fed8447")]
  record IFaxIncomingMessage, lpVtbl : IFaxIncomingMessageVtbl* do
    GUID = LibC::GUID.new(0x7cab88fa_u32, 0x2ef9_u16, 0x4851_u16, StaticArray[0xb2_u8, 0xf3_u8, 0x1d_u8, 0x14_u8, 0x8f_u8, 0xed_u8, 0x84_u8, 0x47_u8])
    def query_interface(this : IFaxIncomingMessage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxIncomingMessage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxIncomingMessage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxIncomingMessage*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxIncomingMessage*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxIncomingMessage*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxIncomingMessage*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFaxIncomingMessage*, pbstrId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pbstrId)
    end
    def get_Pages(this : IFaxIncomingMessage*, plPages : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Pages.call(this, plPages)
    end
    def get_Size(this : IFaxIncomingMessage*, plSize : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Size.call(this, plSize)
    end
    def get_DeviceName(this : IFaxIncomingMessage*, pbstrDeviceName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceName.call(this, pbstrDeviceName)
    end
    def get_Retries(this : IFaxIncomingMessage*, plRetries : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Retries.call(this, plRetries)
    end
    def get_TransmissionStart(this : IFaxIncomingMessage*, pdateTransmissionStart : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionStart.call(this, pdateTransmissionStart)
    end
    def get_TransmissionEnd(this : IFaxIncomingMessage*, pdateTransmissionEnd : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionEnd.call(this, pdateTransmissionEnd)
    end
    def get_CSID(this : IFaxIncomingMessage*, pbstrCSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CSID.call(this, pbstrCSID)
    end
    def get_TSID(this : IFaxIncomingMessage*, pbstrTSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TSID.call(this, pbstrTSID)
    end
    def get_CallerId(this : IFaxIncomingMessage*, pbstrCallerId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CallerId.call(this, pbstrCallerId)
    end
    def get_RoutingInformation(this : IFaxIncomingMessage*, pbstrRoutingInformation : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RoutingInformation.call(this, pbstrRoutingInformation)
    end
    def copy_tiff(this : IFaxIncomingMessage*, bstrTiffPath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_tiff.call(this, bstrTiffPath)
    end
    def delete(this : IFaxIncomingMessage*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end

  end

  @[Extern]
  record IFaxOutgoingJobsVtbl,
    query_interface : Proc(IFaxOutgoingJobs*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxOutgoingJobs*, UInt32),
    release : Proc(IFaxOutgoingJobs*, UInt32),
    get_type_info_count : Proc(IFaxOutgoingJobs*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxOutgoingJobs*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxOutgoingJobs*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxOutgoingJobs*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IFaxOutgoingJobs*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IFaxOutgoingJobs*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IFaxOutgoingJobs*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2c56d8e6-8c2f-4573-944c-e505f8f5aeed")]
  record IFaxOutgoingJobs, lpVtbl : IFaxOutgoingJobsVtbl* do
    GUID = LibC::GUID.new(0x2c56d8e6_u32, 0x8c2f_u16, 0x4573_u16, StaticArray[0x94_u8, 0x4c_u8, 0xe5_u8, 0x5_u8, 0xf8_u8, 0xf5_u8, 0xae_u8, 0xed_u8])
    def query_interface(this : IFaxOutgoingJobs*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxOutgoingJobs*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxOutgoingJobs*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxOutgoingJobs*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxOutgoingJobs*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxOutgoingJobs*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxOutgoingJobs*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IFaxOutgoingJobs*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppUnk)
    end
    def get_Item(this : IFaxOutgoingJobs*, vIndex : Win32cr::System::Com::VARIANT, pFaxOutgoingJob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, vIndex, pFaxOutgoingJob)
    end
    def get_Count(this : IFaxOutgoingJobs*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end

  end

  @[Extern]
  record IFaxOutgoingJobVtbl,
    query_interface : Proc(IFaxOutgoingJob*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxOutgoingJob*, UInt32),
    release : Proc(IFaxOutgoingJob*, UInt32),
    get_type_info_count : Proc(IFaxOutgoingJob*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxOutgoingJob*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxOutgoingJob*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxOutgoingJob*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Subject : Proc(IFaxOutgoingJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DocumentName : Proc(IFaxOutgoingJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Pages : Proc(IFaxOutgoingJob*, Int32*, Win32cr::Foundation::HRESULT),
    get_Size : Proc(IFaxOutgoingJob*, Int32*, Win32cr::Foundation::HRESULT),
    get_SubmissionId : Proc(IFaxOutgoingJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFaxOutgoingJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_OriginalScheduledTime : Proc(IFaxOutgoingJob*, Float64*, Win32cr::Foundation::HRESULT),
    get_SubmissionTime : Proc(IFaxOutgoingJob*, Float64*, Win32cr::Foundation::HRESULT),
    get_ReceiptType : Proc(IFaxOutgoingJob*, Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    get_Priority : Proc(IFaxOutgoingJob*, Win32cr::Devices::Fax::FAX_PRIORITY_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    get_Sender : Proc(IFaxOutgoingJob*, Void**, Win32cr::Foundation::HRESULT),
    get_Recipient : Proc(IFaxOutgoingJob*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentPage : Proc(IFaxOutgoingJob*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceId : Proc(IFaxOutgoingJob*, Int32*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(IFaxOutgoingJob*, Win32cr::Devices::Fax::FAX_JOB_STATUS_ENUM*, Win32cr::Foundation::HRESULT),
    get_ExtendedStatusCode : Proc(IFaxOutgoingJob*, Win32cr::Devices::Fax::FAX_JOB_EXTENDED_STATUS_ENUM*, Win32cr::Foundation::HRESULT),
    get_ExtendedStatus : Proc(IFaxOutgoingJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AvailableOperations : Proc(IFaxOutgoingJob*, Win32cr::Devices::Fax::FAX_JOB_OPERATIONS_ENUM*, Win32cr::Foundation::HRESULT),
    get_Retries : Proc(IFaxOutgoingJob*, Int32*, Win32cr::Foundation::HRESULT),
    get_ScheduledTime : Proc(IFaxOutgoingJob*, Float64*, Win32cr::Foundation::HRESULT),
    get_TransmissionStart : Proc(IFaxOutgoingJob*, Float64*, Win32cr::Foundation::HRESULT),
    get_TransmissionEnd : Proc(IFaxOutgoingJob*, Float64*, Win32cr::Foundation::HRESULT),
    get_CSID : Proc(IFaxOutgoingJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TSID : Proc(IFaxOutgoingJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_GroupBroadcastReceipts : Proc(IFaxOutgoingJob*, Int16*, Win32cr::Foundation::HRESULT),
    pause : Proc(IFaxOutgoingJob*, Win32cr::Foundation::HRESULT),
    resume : Proc(IFaxOutgoingJob*, Win32cr::Foundation::HRESULT),
    restart : Proc(IFaxOutgoingJob*, Win32cr::Foundation::HRESULT),
    copy_tiff : Proc(IFaxOutgoingJob*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxOutgoingJob*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IFaxOutgoingJob*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6356daad-6614-4583-bf7a-3ad67bbfc71c")]
  record IFaxOutgoingJob, lpVtbl : IFaxOutgoingJobVtbl* do
    GUID = LibC::GUID.new(0x6356daad_u32, 0x6614_u16, 0x4583_u16, StaticArray[0xbf_u8, 0x7a_u8, 0x3a_u8, 0xd6_u8, 0x7b_u8, 0xbf_u8, 0xc7_u8, 0x1c_u8])
    def query_interface(this : IFaxOutgoingJob*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxOutgoingJob*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxOutgoingJob*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxOutgoingJob*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxOutgoingJob*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxOutgoingJob*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxOutgoingJob*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Subject(this : IFaxOutgoingJob*, pbstrSubject : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Subject.call(this, pbstrSubject)
    end
    def get_DocumentName(this : IFaxOutgoingJob*, pbstrDocumentName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DocumentName.call(this, pbstrDocumentName)
    end
    def get_Pages(this : IFaxOutgoingJob*, plPages : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Pages.call(this, plPages)
    end
    def get_Size(this : IFaxOutgoingJob*, plSize : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Size.call(this, plSize)
    end
    def get_SubmissionId(this : IFaxOutgoingJob*, pbstrSubmissionId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubmissionId.call(this, pbstrSubmissionId)
    end
    def get_Id(this : IFaxOutgoingJob*, pbstrId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pbstrId)
    end
    def get_OriginalScheduledTime(this : IFaxOutgoingJob*, pdateOriginalScheduledTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OriginalScheduledTime.call(this, pdateOriginalScheduledTime)
    end
    def get_SubmissionTime(this : IFaxOutgoingJob*, pdateSubmissionTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubmissionTime.call(this, pdateSubmissionTime)
    end
    def get_ReceiptType(this : IFaxOutgoingJob*, pReceiptType : Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReceiptType.call(this, pReceiptType)
    end
    def get_Priority(this : IFaxOutgoingJob*, pPriority : Win32cr::Devices::Fax::FAX_PRIORITY_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Priority.call(this, pPriority)
    end
    def get_Sender(this : IFaxOutgoingJob*, ppFaxSender : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Sender.call(this, ppFaxSender)
    end
    def get_Recipient(this : IFaxOutgoingJob*, ppFaxRecipient : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Recipient.call(this, ppFaxRecipient)
    end
    def get_CurrentPage(this : IFaxOutgoingJob*, plCurrentPage : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentPage.call(this, plCurrentPage)
    end
    def get_DeviceId(this : IFaxOutgoingJob*, plDeviceId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceId.call(this, plDeviceId)
    end
    def get_Status(this : IFaxOutgoingJob*, pStatus : Win32cr::Devices::Fax::FAX_JOB_STATUS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, pStatus)
    end
    def get_ExtendedStatusCode(this : IFaxOutgoingJob*, pExtendedStatusCode : Win32cr::Devices::Fax::FAX_JOB_EXTENDED_STATUS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtendedStatusCode.call(this, pExtendedStatusCode)
    end
    def get_ExtendedStatus(this : IFaxOutgoingJob*, pbstrExtendedStatus : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtendedStatus.call(this, pbstrExtendedStatus)
    end
    def get_AvailableOperations(this : IFaxOutgoingJob*, pAvailableOperations : Win32cr::Devices::Fax::FAX_JOB_OPERATIONS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AvailableOperations.call(this, pAvailableOperations)
    end
    def get_Retries(this : IFaxOutgoingJob*, plRetries : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Retries.call(this, plRetries)
    end
    def get_ScheduledTime(this : IFaxOutgoingJob*, pdateScheduledTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScheduledTime.call(this, pdateScheduledTime)
    end
    def get_TransmissionStart(this : IFaxOutgoingJob*, pdateTransmissionStart : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionStart.call(this, pdateTransmissionStart)
    end
    def get_TransmissionEnd(this : IFaxOutgoingJob*, pdateTransmissionEnd : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionEnd.call(this, pdateTransmissionEnd)
    end
    def get_CSID(this : IFaxOutgoingJob*, pbstrCSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CSID.call(this, pbstrCSID)
    end
    def get_TSID(this : IFaxOutgoingJob*, pbstrTSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TSID.call(this, pbstrTSID)
    end
    def get_GroupBroadcastReceipts(this : IFaxOutgoingJob*, pbGroupBroadcastReceipts : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GroupBroadcastReceipts.call(this, pbGroupBroadcastReceipts)
    end
    def pause(this : IFaxOutgoingJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def resume(this : IFaxOutgoingJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def restart(this : IFaxOutgoingJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restart.call(this)
    end
    def copy_tiff(this : IFaxOutgoingJob*, bstrTiffPath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_tiff.call(this, bstrTiffPath)
    end
    def refresh(this : IFaxOutgoingJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def cancel(this : IFaxOutgoingJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end

  end

  @[Extern]
  record IFaxOutgoingMessageIteratorVtbl,
    query_interface : Proc(IFaxOutgoingMessageIterator*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxOutgoingMessageIterator*, UInt32),
    release : Proc(IFaxOutgoingMessageIterator*, UInt32),
    get_type_info_count : Proc(IFaxOutgoingMessageIterator*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxOutgoingMessageIterator*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxOutgoingMessageIterator*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxOutgoingMessageIterator*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Message : Proc(IFaxOutgoingMessageIterator*, Void**, Win32cr::Foundation::HRESULT),
    get_AtEOF : Proc(IFaxOutgoingMessageIterator*, Int16*, Win32cr::Foundation::HRESULT),
    get_PrefetchSize : Proc(IFaxOutgoingMessageIterator*, Int32*, Win32cr::Foundation::HRESULT),
    put_PrefetchSize : Proc(IFaxOutgoingMessageIterator*, Int32, Win32cr::Foundation::HRESULT),
    move_first : Proc(IFaxOutgoingMessageIterator*, Win32cr::Foundation::HRESULT),
    move_next : Proc(IFaxOutgoingMessageIterator*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f5ec5d4f-b840-432f-9980-112fe42a9b7a")]
  record IFaxOutgoingMessageIterator, lpVtbl : IFaxOutgoingMessageIteratorVtbl* do
    GUID = LibC::GUID.new(0xf5ec5d4f_u32, 0xb840_u16, 0x432f_u16, StaticArray[0x99_u8, 0x80_u8, 0x11_u8, 0x2f_u8, 0xe4_u8, 0x2a_u8, 0x9b_u8, 0x7a_u8])
    def query_interface(this : IFaxOutgoingMessageIterator*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxOutgoingMessageIterator*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxOutgoingMessageIterator*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxOutgoingMessageIterator*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxOutgoingMessageIterator*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxOutgoingMessageIterator*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxOutgoingMessageIterator*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Message(this : IFaxOutgoingMessageIterator*, pFaxOutgoingMessage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Message.call(this, pFaxOutgoingMessage)
    end
    def get_AtEOF(this : IFaxOutgoingMessageIterator*, pbEOF : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AtEOF.call(this, pbEOF)
    end
    def get_PrefetchSize(this : IFaxOutgoingMessageIterator*, plPrefetchSize : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PrefetchSize.call(this, plPrefetchSize)
    end
    def put_PrefetchSize(this : IFaxOutgoingMessageIterator*, lPrefetchSize : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PrefetchSize.call(this, lPrefetchSize)
    end
    def move_first(this : IFaxOutgoingMessageIterator*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_first.call(this)
    end
    def move_next(this : IFaxOutgoingMessageIterator*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_next.call(this)
    end

  end

  @[Extern]
  record IFaxOutgoingMessageVtbl,
    query_interface : Proc(IFaxOutgoingMessage*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxOutgoingMessage*, UInt32),
    release : Proc(IFaxOutgoingMessage*, UInt32),
    get_type_info_count : Proc(IFaxOutgoingMessage*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxOutgoingMessage*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxOutgoingMessage*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxOutgoingMessage*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_SubmissionId : Proc(IFaxOutgoingMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFaxOutgoingMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Subject : Proc(IFaxOutgoingMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DocumentName : Proc(IFaxOutgoingMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Retries : Proc(IFaxOutgoingMessage*, Int32*, Win32cr::Foundation::HRESULT),
    get_Pages : Proc(IFaxOutgoingMessage*, Int32*, Win32cr::Foundation::HRESULT),
    get_Size : Proc(IFaxOutgoingMessage*, Int32*, Win32cr::Foundation::HRESULT),
    get_OriginalScheduledTime : Proc(IFaxOutgoingMessage*, Float64*, Win32cr::Foundation::HRESULT),
    get_SubmissionTime : Proc(IFaxOutgoingMessage*, Float64*, Win32cr::Foundation::HRESULT),
    get_Priority : Proc(IFaxOutgoingMessage*, Win32cr::Devices::Fax::FAX_PRIORITY_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    get_Sender : Proc(IFaxOutgoingMessage*, Void**, Win32cr::Foundation::HRESULT),
    get_Recipient : Proc(IFaxOutgoingMessage*, Void**, Win32cr::Foundation::HRESULT),
    get_DeviceName : Proc(IFaxOutgoingMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TransmissionStart : Proc(IFaxOutgoingMessage*, Float64*, Win32cr::Foundation::HRESULT),
    get_TransmissionEnd : Proc(IFaxOutgoingMessage*, Float64*, Win32cr::Foundation::HRESULT),
    get_CSID : Proc(IFaxOutgoingMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TSID : Proc(IFaxOutgoingMessage*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    copy_tiff : Proc(IFaxOutgoingMessage*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFaxOutgoingMessage*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f0ea35de-caa5-4a7c-82c7-2b60ba5f2be2")]
  record IFaxOutgoingMessage, lpVtbl : IFaxOutgoingMessageVtbl* do
    GUID = LibC::GUID.new(0xf0ea35de_u32, 0xcaa5_u16, 0x4a7c_u16, StaticArray[0x82_u8, 0xc7_u8, 0x2b_u8, 0x60_u8, 0xba_u8, 0x5f_u8, 0x2b_u8, 0xe2_u8])
    def query_interface(this : IFaxOutgoingMessage*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxOutgoingMessage*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxOutgoingMessage*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxOutgoingMessage*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxOutgoingMessage*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxOutgoingMessage*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxOutgoingMessage*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_SubmissionId(this : IFaxOutgoingMessage*, pbstrSubmissionId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubmissionId.call(this, pbstrSubmissionId)
    end
    def get_Id(this : IFaxOutgoingMessage*, pbstrId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pbstrId)
    end
    def get_Subject(this : IFaxOutgoingMessage*, pbstrSubject : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Subject.call(this, pbstrSubject)
    end
    def get_DocumentName(this : IFaxOutgoingMessage*, pbstrDocumentName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DocumentName.call(this, pbstrDocumentName)
    end
    def get_Retries(this : IFaxOutgoingMessage*, plRetries : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Retries.call(this, plRetries)
    end
    def get_Pages(this : IFaxOutgoingMessage*, plPages : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Pages.call(this, plPages)
    end
    def get_Size(this : IFaxOutgoingMessage*, plSize : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Size.call(this, plSize)
    end
    def get_OriginalScheduledTime(this : IFaxOutgoingMessage*, pdateOriginalScheduledTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OriginalScheduledTime.call(this, pdateOriginalScheduledTime)
    end
    def get_SubmissionTime(this : IFaxOutgoingMessage*, pdateSubmissionTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubmissionTime.call(this, pdateSubmissionTime)
    end
    def get_Priority(this : IFaxOutgoingMessage*, pPriority : Win32cr::Devices::Fax::FAX_PRIORITY_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Priority.call(this, pPriority)
    end
    def get_Sender(this : IFaxOutgoingMessage*, ppFaxSender : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Sender.call(this, ppFaxSender)
    end
    def get_Recipient(this : IFaxOutgoingMessage*, ppFaxRecipient : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Recipient.call(this, ppFaxRecipient)
    end
    def get_DeviceName(this : IFaxOutgoingMessage*, pbstrDeviceName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceName.call(this, pbstrDeviceName)
    end
    def get_TransmissionStart(this : IFaxOutgoingMessage*, pdateTransmissionStart : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionStart.call(this, pdateTransmissionStart)
    end
    def get_TransmissionEnd(this : IFaxOutgoingMessage*, pdateTransmissionEnd : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionEnd.call(this, pdateTransmissionEnd)
    end
    def get_CSID(this : IFaxOutgoingMessage*, pbstrCSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CSID.call(this, pbstrCSID)
    end
    def get_TSID(this : IFaxOutgoingMessage*, pbstrTSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TSID.call(this, pbstrTSID)
    end
    def copy_tiff(this : IFaxOutgoingMessage*, bstrTiffPath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_tiff.call(this, bstrTiffPath)
    end
    def delete(this : IFaxOutgoingMessage*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end

  end

  @[Extern]
  record IFaxIncomingJobsVtbl,
    query_interface : Proc(IFaxIncomingJobs*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxIncomingJobs*, UInt32),
    release : Proc(IFaxIncomingJobs*, UInt32),
    get_type_info_count : Proc(IFaxIncomingJobs*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxIncomingJobs*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxIncomingJobs*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxIncomingJobs*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IFaxIncomingJobs*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IFaxIncomingJobs*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IFaxIncomingJobs*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("011f04e9-4fd6-4c23-9513-b6b66bb26be9")]
  record IFaxIncomingJobs, lpVtbl : IFaxIncomingJobsVtbl* do
    GUID = LibC::GUID.new(0x11f04e9_u32, 0x4fd6_u16, 0x4c23_u16, StaticArray[0x95_u8, 0x13_u8, 0xb6_u8, 0xb6_u8, 0x6b_u8, 0xb2_u8, 0x6b_u8, 0xe9_u8])
    def query_interface(this : IFaxIncomingJobs*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxIncomingJobs*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxIncomingJobs*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxIncomingJobs*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxIncomingJobs*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxIncomingJobs*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxIncomingJobs*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IFaxIncomingJobs*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppUnk)
    end
    def get_Item(this : IFaxIncomingJobs*, vIndex : Win32cr::System::Com::VARIANT, pFaxIncomingJob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, vIndex, pFaxIncomingJob)
    end
    def get_Count(this : IFaxIncomingJobs*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end

  end

  @[Extern]
  record IFaxIncomingJobVtbl,
    query_interface : Proc(IFaxIncomingJob*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxIncomingJob*, UInt32),
    release : Proc(IFaxIncomingJob*, UInt32),
    get_type_info_count : Proc(IFaxIncomingJob*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxIncomingJob*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxIncomingJob*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxIncomingJob*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Size : Proc(IFaxIncomingJob*, Int32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFaxIncomingJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentPage : Proc(IFaxIncomingJob*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceId : Proc(IFaxIncomingJob*, Int32*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(IFaxIncomingJob*, Win32cr::Devices::Fax::FAX_JOB_STATUS_ENUM*, Win32cr::Foundation::HRESULT),
    get_ExtendedStatusCode : Proc(IFaxIncomingJob*, Win32cr::Devices::Fax::FAX_JOB_EXTENDED_STATUS_ENUM*, Win32cr::Foundation::HRESULT),
    get_ExtendedStatus : Proc(IFaxIncomingJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AvailableOperations : Proc(IFaxIncomingJob*, Win32cr::Devices::Fax::FAX_JOB_OPERATIONS_ENUM*, Win32cr::Foundation::HRESULT),
    get_Retries : Proc(IFaxIncomingJob*, Int32*, Win32cr::Foundation::HRESULT),
    get_TransmissionStart : Proc(IFaxIncomingJob*, Float64*, Win32cr::Foundation::HRESULT),
    get_TransmissionEnd : Proc(IFaxIncomingJob*, Float64*, Win32cr::Foundation::HRESULT),
    get_CSID : Proc(IFaxIncomingJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TSID : Proc(IFaxIncomingJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CallerId : Proc(IFaxIncomingJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RoutingInformation : Proc(IFaxIncomingJob*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_JobType : Proc(IFaxIncomingJob*, Win32cr::Devices::Fax::FAX_JOB_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IFaxIncomingJob*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxIncomingJob*, Win32cr::Foundation::HRESULT),
    copy_tiff : Proc(IFaxIncomingJob*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("207529e6-654a-4916-9f88-4d232ee8a107")]
  record IFaxIncomingJob, lpVtbl : IFaxIncomingJobVtbl* do
    GUID = LibC::GUID.new(0x207529e6_u32, 0x654a_u16, 0x4916_u16, StaticArray[0x9f_u8, 0x88_u8, 0x4d_u8, 0x23_u8, 0x2e_u8, 0xe8_u8, 0xa1_u8, 0x7_u8])
    def query_interface(this : IFaxIncomingJob*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxIncomingJob*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxIncomingJob*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxIncomingJob*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxIncomingJob*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxIncomingJob*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxIncomingJob*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Size(this : IFaxIncomingJob*, plSize : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Size.call(this, plSize)
    end
    def get_Id(this : IFaxIncomingJob*, pbstrId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pbstrId)
    end
    def get_CurrentPage(this : IFaxIncomingJob*, plCurrentPage : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentPage.call(this, plCurrentPage)
    end
    def get_DeviceId(this : IFaxIncomingJob*, plDeviceId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceId.call(this, plDeviceId)
    end
    def get_Status(this : IFaxIncomingJob*, pStatus : Win32cr::Devices::Fax::FAX_JOB_STATUS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, pStatus)
    end
    def get_ExtendedStatusCode(this : IFaxIncomingJob*, pExtendedStatusCode : Win32cr::Devices::Fax::FAX_JOB_EXTENDED_STATUS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtendedStatusCode.call(this, pExtendedStatusCode)
    end
    def get_ExtendedStatus(this : IFaxIncomingJob*, pbstrExtendedStatus : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtendedStatus.call(this, pbstrExtendedStatus)
    end
    def get_AvailableOperations(this : IFaxIncomingJob*, pAvailableOperations : Win32cr::Devices::Fax::FAX_JOB_OPERATIONS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AvailableOperations.call(this, pAvailableOperations)
    end
    def get_Retries(this : IFaxIncomingJob*, plRetries : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Retries.call(this, plRetries)
    end
    def get_TransmissionStart(this : IFaxIncomingJob*, pdateTransmissionStart : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionStart.call(this, pdateTransmissionStart)
    end
    def get_TransmissionEnd(this : IFaxIncomingJob*, pdateTransmissionEnd : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionEnd.call(this, pdateTransmissionEnd)
    end
    def get_CSID(this : IFaxIncomingJob*, pbstrCSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CSID.call(this, pbstrCSID)
    end
    def get_TSID(this : IFaxIncomingJob*, pbstrTSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TSID.call(this, pbstrTSID)
    end
    def get_CallerId(this : IFaxIncomingJob*, pbstrCallerId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CallerId.call(this, pbstrCallerId)
    end
    def get_RoutingInformation(this : IFaxIncomingJob*, pbstrRoutingInformation : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RoutingInformation.call(this, pbstrRoutingInformation)
    end
    def get_JobType(this : IFaxIncomingJob*, pJobType : Win32cr::Devices::Fax::FAX_JOB_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_JobType.call(this, pJobType)
    end
    def cancel(this : IFaxIncomingJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def refresh(this : IFaxIncomingJob*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def copy_tiff(this : IFaxIncomingJob*, bstrTiffPath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_tiff.call(this, bstrTiffPath)
    end

  end

  @[Extern]
  record IFaxDeviceProviderVtbl,
    query_interface : Proc(IFaxDeviceProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxDeviceProvider*, UInt32),
    release : Proc(IFaxDeviceProvider*, UInt32),
    get_type_info_count : Proc(IFaxDeviceProvider*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxDeviceProvider*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxDeviceProvider*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxDeviceProvider*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_FriendlyName : Proc(IFaxDeviceProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ImageName : Proc(IFaxDeviceProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UniqueName : Proc(IFaxDeviceProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TapiProviderName : Proc(IFaxDeviceProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_MajorVersion : Proc(IFaxDeviceProvider*, Int32*, Win32cr::Foundation::HRESULT),
    get_MinorVersion : Proc(IFaxDeviceProvider*, Int32*, Win32cr::Foundation::HRESULT),
    get_MajorBuild : Proc(IFaxDeviceProvider*, Int32*, Win32cr::Foundation::HRESULT),
    get_MinorBuild : Proc(IFaxDeviceProvider*, Int32*, Win32cr::Foundation::HRESULT),
    get_Debug : Proc(IFaxDeviceProvider*, Int16*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(IFaxDeviceProvider*, Win32cr::Devices::Fax::FAX_PROVIDER_STATUS_ENUM*, Win32cr::Foundation::HRESULT),
    get_InitErrorCode : Proc(IFaxDeviceProvider*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceIds : Proc(IFaxDeviceProvider*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("290eac63-83ec-449c-8417-f148df8c682a")]
  record IFaxDeviceProvider, lpVtbl : IFaxDeviceProviderVtbl* do
    GUID = LibC::GUID.new(0x290eac63_u32, 0x83ec_u16, 0x449c_u16, StaticArray[0x84_u8, 0x17_u8, 0xf1_u8, 0x48_u8, 0xdf_u8, 0x8c_u8, 0x68_u8, 0x2a_u8])
    def query_interface(this : IFaxDeviceProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxDeviceProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxDeviceProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxDeviceProvider*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxDeviceProvider*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxDeviceProvider*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxDeviceProvider*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_FriendlyName(this : IFaxDeviceProvider*, pbstrFriendlyName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FriendlyName.call(this, pbstrFriendlyName)
    end
    def get_ImageName(this : IFaxDeviceProvider*, pbstrImageName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ImageName.call(this, pbstrImageName)
    end
    def get_UniqueName(this : IFaxDeviceProvider*, pbstrUniqueName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UniqueName.call(this, pbstrUniqueName)
    end
    def get_TapiProviderName(this : IFaxDeviceProvider*, pbstrTapiProviderName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TapiProviderName.call(this, pbstrTapiProviderName)
    end
    def get_MajorVersion(this : IFaxDeviceProvider*, plMajorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MajorVersion.call(this, plMajorVersion)
    end
    def get_MinorVersion(this : IFaxDeviceProvider*, plMinorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinorVersion.call(this, plMinorVersion)
    end
    def get_MajorBuild(this : IFaxDeviceProvider*, plMajorBuild : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MajorBuild.call(this, plMajorBuild)
    end
    def get_MinorBuild(this : IFaxDeviceProvider*, plMinorBuild : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinorBuild.call(this, plMinorBuild)
    end
    def get_Debug(this : IFaxDeviceProvider*, pbDebug : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Debug.call(this, pbDebug)
    end
    def get_Status(this : IFaxDeviceProvider*, pStatus : Win32cr::Devices::Fax::FAX_PROVIDER_STATUS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, pStatus)
    end
    def get_InitErrorCode(this : IFaxDeviceProvider*, plInitErrorCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InitErrorCode.call(this, plInitErrorCode)
    end
    def get_DeviceIds(this : IFaxDeviceProvider*, pvDeviceIds : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceIds.call(this, pvDeviceIds)
    end

  end

  @[Extern]
  record IFaxDeviceVtbl,
    query_interface : Proc(IFaxDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxDevice*, UInt32),
    release : Proc(IFaxDevice*, UInt32),
    get_type_info_count : Proc(IFaxDevice*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxDevice*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxDevice*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxDevice*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFaxDevice*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceName : Proc(IFaxDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ProviderUniqueName : Proc(IFaxDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_PoweredOff : Proc(IFaxDevice*, Int16*, Win32cr::Foundation::HRESULT),
    get_ReceivingNow : Proc(IFaxDevice*, Int16*, Win32cr::Foundation::HRESULT),
    get_SendingNow : Proc(IFaxDevice*, Int16*, Win32cr::Foundation::HRESULT),
    get_UsedRoutingMethods : Proc(IFaxDevice*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IFaxDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IFaxDevice*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SendEnabled : Proc(IFaxDevice*, Int16*, Win32cr::Foundation::HRESULT),
    put_SendEnabled : Proc(IFaxDevice*, Int16, Win32cr::Foundation::HRESULT),
    get_ReceiveMode : Proc(IFaxDevice*, Win32cr::Devices::Fax::FAX_DEVICE_RECEIVE_MODE_ENUM*, Win32cr::Foundation::HRESULT),
    put_ReceiveMode : Proc(IFaxDevice*, Win32cr::Devices::Fax::FAX_DEVICE_RECEIVE_MODE_ENUM, Win32cr::Foundation::HRESULT),
    get_RingsBeforeAnswer : Proc(IFaxDevice*, Int32*, Win32cr::Foundation::HRESULT),
    put_RingsBeforeAnswer : Proc(IFaxDevice*, Int32, Win32cr::Foundation::HRESULT),
    get_CSID : Proc(IFaxDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_CSID : Proc(IFaxDevice*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TSID : Proc(IFaxDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TSID : Proc(IFaxDevice*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxDevice*, Win32cr::Foundation::HRESULT),
    save : Proc(IFaxDevice*, Win32cr::Foundation::HRESULT),
    get_extension_property : Proc(IFaxDevice*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_extension_property : Proc(IFaxDevice*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    use_routing_method : Proc(IFaxDevice*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    get_RingingNow : Proc(IFaxDevice*, Int16*, Win32cr::Foundation::HRESULT),
    answer_call : Proc(IFaxDevice*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("49306c59-b52e-4867-9df4-ca5841c956d0")]
  record IFaxDevice, lpVtbl : IFaxDeviceVtbl* do
    GUID = LibC::GUID.new(0x49306c59_u32, 0xb52e_u16, 0x4867_u16, StaticArray[0x9d_u8, 0xf4_u8, 0xca_u8, 0x58_u8, 0x41_u8, 0xc9_u8, 0x56_u8, 0xd0_u8])
    def query_interface(this : IFaxDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxDevice*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxDevice*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxDevice*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxDevice*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFaxDevice*, plId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, plId)
    end
    def get_DeviceName(this : IFaxDevice*, pbstrDeviceName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceName.call(this, pbstrDeviceName)
    end
    def get_ProviderUniqueName(this : IFaxDevice*, pbstrProviderUniqueName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProviderUniqueName.call(this, pbstrProviderUniqueName)
    end
    def get_PoweredOff(this : IFaxDevice*, pbPoweredOff : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PoweredOff.call(this, pbPoweredOff)
    end
    def get_ReceivingNow(this : IFaxDevice*, pbReceivingNow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReceivingNow.call(this, pbReceivingNow)
    end
    def get_SendingNow(this : IFaxDevice*, pbSendingNow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SendingNow.call(this, pbSendingNow)
    end
    def get_UsedRoutingMethods(this : IFaxDevice*, pvUsedRoutingMethods : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UsedRoutingMethods.call(this, pvUsedRoutingMethods)
    end
    def get_Description(this : IFaxDevice*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IFaxDevice*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_SendEnabled(this : IFaxDevice*, pbSendEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SendEnabled.call(this, pbSendEnabled)
    end
    def put_SendEnabled(this : IFaxDevice*, bSendEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SendEnabled.call(this, bSendEnabled)
    end
    def get_ReceiveMode(this : IFaxDevice*, pReceiveMode : Win32cr::Devices::Fax::FAX_DEVICE_RECEIVE_MODE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReceiveMode.call(this, pReceiveMode)
    end
    def put_ReceiveMode(this : IFaxDevice*, receive_mode : Win32cr::Devices::Fax::FAX_DEVICE_RECEIVE_MODE_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReceiveMode.call(this, receive_mode)
    end
    def get_RingsBeforeAnswer(this : IFaxDevice*, plRingsBeforeAnswer : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RingsBeforeAnswer.call(this, plRingsBeforeAnswer)
    end
    def put_RingsBeforeAnswer(this : IFaxDevice*, lRingsBeforeAnswer : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RingsBeforeAnswer.call(this, lRingsBeforeAnswer)
    end
    def get_CSID(this : IFaxDevice*, pbstrCSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CSID.call(this, pbstrCSID)
    end
    def put_CSID(this : IFaxDevice*, bstrCSID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CSID.call(this, bstrCSID)
    end
    def get_TSID(this : IFaxDevice*, pbstrTSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TSID.call(this, pbstrTSID)
    end
    def put_TSID(this : IFaxDevice*, bstrTSID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TSID.call(this, bstrTSID)
    end
    def refresh(this : IFaxDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def save(this : IFaxDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def get_extension_property(this : IFaxDevice*, bstrGUID : Win32cr::Foundation::BSTR, pvProperty : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_extension_property.call(this, bstrGUID, pvProperty)
    end
    def set_extension_property(this : IFaxDevice*, bstrGUID : Win32cr::Foundation::BSTR, vProperty : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_extension_property.call(this, bstrGUID, vProperty)
    end
    def use_routing_method(this : IFaxDevice*, bstrMethodGUID : Win32cr::Foundation::BSTR, bUse : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.use_routing_method.call(this, bstrMethodGUID, bUse)
    end
    def get_RingingNow(this : IFaxDevice*, pbRingingNow : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RingingNow.call(this, pbRingingNow)
    end
    def answer_call(this : IFaxDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.answer_call.call(this)
    end

  end

  @[Extern]
  record IFaxActivityLoggingVtbl,
    query_interface : Proc(IFaxActivityLogging*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxActivityLogging*, UInt32),
    release : Proc(IFaxActivityLogging*, UInt32),
    get_type_info_count : Proc(IFaxActivityLogging*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxActivityLogging*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxActivityLogging*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxActivityLogging*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_LogIncoming : Proc(IFaxActivityLogging*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogIncoming : Proc(IFaxActivityLogging*, Int16, Win32cr::Foundation::HRESULT),
    get_LogOutgoing : Proc(IFaxActivityLogging*, Int16*, Win32cr::Foundation::HRESULT),
    put_LogOutgoing : Proc(IFaxActivityLogging*, Int16, Win32cr::Foundation::HRESULT),
    get_DatabasePath : Proc(IFaxActivityLogging*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_DatabasePath : Proc(IFaxActivityLogging*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxActivityLogging*, Win32cr::Foundation::HRESULT),
    save : Proc(IFaxActivityLogging*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1e29078b-5a69-497b-9592-49b7e7faddb5")]
  record IFaxActivityLogging, lpVtbl : IFaxActivityLoggingVtbl* do
    GUID = LibC::GUID.new(0x1e29078b_u32, 0x5a69_u16, 0x497b_u16, StaticArray[0x95_u8, 0x92_u8, 0x49_u8, 0xb7_u8, 0xe7_u8, 0xfa_u8, 0xdd_u8, 0xb5_u8])
    def query_interface(this : IFaxActivityLogging*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxActivityLogging*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxActivityLogging*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxActivityLogging*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxActivityLogging*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxActivityLogging*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxActivityLogging*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_LogIncoming(this : IFaxActivityLogging*, pbLogIncoming : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogIncoming.call(this, pbLogIncoming)
    end
    def put_LogIncoming(this : IFaxActivityLogging*, bLogIncoming : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogIncoming.call(this, bLogIncoming)
    end
    def get_LogOutgoing(this : IFaxActivityLogging*, pbLogOutgoing : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LogOutgoing.call(this, pbLogOutgoing)
    end
    def put_LogOutgoing(this : IFaxActivityLogging*, bLogOutgoing : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LogOutgoing.call(this, bLogOutgoing)
    end
    def get_DatabasePath(this : IFaxActivityLogging*, pbstrDatabasePath : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DatabasePath.call(this, pbstrDatabasePath)
    end
    def put_DatabasePath(this : IFaxActivityLogging*, bstrDatabasePath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DatabasePath.call(this, bstrDatabasePath)
    end
    def refresh(this : IFaxActivityLogging*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def save(this : IFaxActivityLogging*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end

  end

  @[Extern]
  record IFaxEventLoggingVtbl,
    query_interface : Proc(IFaxEventLogging*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxEventLogging*, UInt32),
    release : Proc(IFaxEventLogging*, UInt32),
    get_type_info_count : Proc(IFaxEventLogging*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxEventLogging*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxEventLogging*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxEventLogging*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_InitEventsLevel : Proc(IFaxEventLogging*, Win32cr::Devices::Fax::FAX_LOG_LEVEL_ENUM*, Win32cr::Foundation::HRESULT),
    put_InitEventsLevel : Proc(IFaxEventLogging*, Win32cr::Devices::Fax::FAX_LOG_LEVEL_ENUM, Win32cr::Foundation::HRESULT),
    get_InboundEventsLevel : Proc(IFaxEventLogging*, Win32cr::Devices::Fax::FAX_LOG_LEVEL_ENUM*, Win32cr::Foundation::HRESULT),
    put_InboundEventsLevel : Proc(IFaxEventLogging*, Win32cr::Devices::Fax::FAX_LOG_LEVEL_ENUM, Win32cr::Foundation::HRESULT),
    get_OutboundEventsLevel : Proc(IFaxEventLogging*, Win32cr::Devices::Fax::FAX_LOG_LEVEL_ENUM*, Win32cr::Foundation::HRESULT),
    put_OutboundEventsLevel : Proc(IFaxEventLogging*, Win32cr::Devices::Fax::FAX_LOG_LEVEL_ENUM, Win32cr::Foundation::HRESULT),
    get_GeneralEventsLevel : Proc(IFaxEventLogging*, Win32cr::Devices::Fax::FAX_LOG_LEVEL_ENUM*, Win32cr::Foundation::HRESULT),
    put_GeneralEventsLevel : Proc(IFaxEventLogging*, Win32cr::Devices::Fax::FAX_LOG_LEVEL_ENUM, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxEventLogging*, Win32cr::Foundation::HRESULT),
    save : Proc(IFaxEventLogging*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0880d965-20e8-42e4-8e17-944f192caad4")]
  record IFaxEventLogging, lpVtbl : IFaxEventLoggingVtbl* do
    GUID = LibC::GUID.new(0x880d965_u32, 0x20e8_u16, 0x42e4_u16, StaticArray[0x8e_u8, 0x17_u8, 0x94_u8, 0x4f_u8, 0x19_u8, 0x2c_u8, 0xaa_u8, 0xd4_u8])
    def query_interface(this : IFaxEventLogging*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxEventLogging*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxEventLogging*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxEventLogging*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxEventLogging*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxEventLogging*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxEventLogging*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_InitEventsLevel(this : IFaxEventLogging*, pInitEventLevel : Win32cr::Devices::Fax::FAX_LOG_LEVEL_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InitEventsLevel.call(this, pInitEventLevel)
    end
    def put_InitEventsLevel(this : IFaxEventLogging*, init_event_level : Win32cr::Devices::Fax::FAX_LOG_LEVEL_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InitEventsLevel.call(this, init_event_level)
    end
    def get_InboundEventsLevel(this : IFaxEventLogging*, pInboundEventLevel : Win32cr::Devices::Fax::FAX_LOG_LEVEL_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InboundEventsLevel.call(this, pInboundEventLevel)
    end
    def put_InboundEventsLevel(this : IFaxEventLogging*, inbound_event_level : Win32cr::Devices::Fax::FAX_LOG_LEVEL_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InboundEventsLevel.call(this, inbound_event_level)
    end
    def get_OutboundEventsLevel(this : IFaxEventLogging*, pOutboundEventLevel : Win32cr::Devices::Fax::FAX_LOG_LEVEL_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutboundEventsLevel.call(this, pOutboundEventLevel)
    end
    def put_OutboundEventsLevel(this : IFaxEventLogging*, outbound_event_level : Win32cr::Devices::Fax::FAX_LOG_LEVEL_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OutboundEventsLevel.call(this, outbound_event_level)
    end
    def get_GeneralEventsLevel(this : IFaxEventLogging*, pGeneralEventLevel : Win32cr::Devices::Fax::FAX_LOG_LEVEL_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GeneralEventsLevel.call(this, pGeneralEventLevel)
    end
    def put_GeneralEventsLevel(this : IFaxEventLogging*, general_event_level : Win32cr::Devices::Fax::FAX_LOG_LEVEL_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GeneralEventsLevel.call(this, general_event_level)
    end
    def refresh(this : IFaxEventLogging*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def save(this : IFaxEventLogging*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end

  end

  @[Extern]
  record IFaxOutboundRoutingGroupsVtbl,
    query_interface : Proc(IFaxOutboundRoutingGroups*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxOutboundRoutingGroups*, UInt32),
    release : Proc(IFaxOutboundRoutingGroups*, UInt32),
    get_type_info_count : Proc(IFaxOutboundRoutingGroups*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxOutboundRoutingGroups*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxOutboundRoutingGroups*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxOutboundRoutingGroups*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IFaxOutboundRoutingGroups*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IFaxOutboundRoutingGroups*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IFaxOutboundRoutingGroups*, Int32*, Win32cr::Foundation::HRESULT),
    add : Proc(IFaxOutboundRoutingGroups*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    remove : Proc(IFaxOutboundRoutingGroups*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("235cbef7-c2de-4bfd-b8da-75097c82c87f")]
  record IFaxOutboundRoutingGroups, lpVtbl : IFaxOutboundRoutingGroupsVtbl* do
    GUID = LibC::GUID.new(0x235cbef7_u32, 0xc2de_u16, 0x4bfd_u16, StaticArray[0xb8_u8, 0xda_u8, 0x75_u8, 0x9_u8, 0x7c_u8, 0x82_u8, 0xc8_u8, 0x7f_u8])
    def query_interface(this : IFaxOutboundRoutingGroups*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxOutboundRoutingGroups*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxOutboundRoutingGroups*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxOutboundRoutingGroups*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxOutboundRoutingGroups*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxOutboundRoutingGroups*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxOutboundRoutingGroups*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IFaxOutboundRoutingGroups*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppUnk)
    end
    def get_Item(this : IFaxOutboundRoutingGroups*, vIndex : Win32cr::System::Com::VARIANT, pFaxOutboundRoutingGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, vIndex, pFaxOutboundRoutingGroup)
    end
    def get_Count(this : IFaxOutboundRoutingGroups*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def add(this : IFaxOutboundRoutingGroups*, bstrName : Win32cr::Foundation::BSTR, pFaxOutboundRoutingGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, bstrName, pFaxOutboundRoutingGroup)
    end
    def remove(this : IFaxOutboundRoutingGroups*, vIndex : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, vIndex)
    end

  end

  @[Extern]
  record IFaxOutboundRoutingGroupVtbl,
    query_interface : Proc(IFaxOutboundRoutingGroup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxOutboundRoutingGroup*, UInt32),
    release : Proc(IFaxOutboundRoutingGroup*, UInt32),
    get_type_info_count : Proc(IFaxOutboundRoutingGroup*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxOutboundRoutingGroup*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxOutboundRoutingGroup*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxOutboundRoutingGroup*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFaxOutboundRoutingGroup*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(IFaxOutboundRoutingGroup*, Win32cr::Devices::Fax::FAX_GROUP_STATUS_ENUM*, Win32cr::Foundation::HRESULT),
    get_DeviceIds : Proc(IFaxOutboundRoutingGroup*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ca6289a1-7e25-4f87-9a0b-93365734962c")]
  record IFaxOutboundRoutingGroup, lpVtbl : IFaxOutboundRoutingGroupVtbl* do
    GUID = LibC::GUID.new(0xca6289a1_u32, 0x7e25_u16, 0x4f87_u16, StaticArray[0x9a_u8, 0xb_u8, 0x93_u8, 0x36_u8, 0x57_u8, 0x34_u8, 0x96_u8, 0x2c_u8])
    def query_interface(this : IFaxOutboundRoutingGroup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxOutboundRoutingGroup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxOutboundRoutingGroup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxOutboundRoutingGroup*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxOutboundRoutingGroup*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxOutboundRoutingGroup*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxOutboundRoutingGroup*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IFaxOutboundRoutingGroup*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def get_Status(this : IFaxOutboundRoutingGroup*, pStatus : Win32cr::Devices::Fax::FAX_GROUP_STATUS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, pStatus)
    end
    def get_DeviceIds(this : IFaxOutboundRoutingGroup*, pFaxDeviceIds : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceIds.call(this, pFaxDeviceIds)
    end

  end

  @[Extern]
  record IFaxDeviceIdsVtbl,
    query_interface : Proc(IFaxDeviceIds*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxDeviceIds*, UInt32),
    release : Proc(IFaxDeviceIds*, UInt32),
    get_type_info_count : Proc(IFaxDeviceIds*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxDeviceIds*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxDeviceIds*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxDeviceIds*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IFaxDeviceIds*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IFaxDeviceIds*, Int32, Int32*, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IFaxDeviceIds*, Int32*, Win32cr::Foundation::HRESULT),
    add : Proc(IFaxDeviceIds*, Int32, Win32cr::Foundation::HRESULT),
    remove : Proc(IFaxDeviceIds*, Int32, Win32cr::Foundation::HRESULT),
    set_order : Proc(IFaxDeviceIds*, Int32, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2f0f813f-4ce9-443e-8ca1-738cfaeee149")]
  record IFaxDeviceIds, lpVtbl : IFaxDeviceIdsVtbl* do
    GUID = LibC::GUID.new(0x2f0f813f_u32, 0x4ce9_u16, 0x443e_u16, StaticArray[0x8c_u8, 0xa1_u8, 0x73_u8, 0x8c_u8, 0xfa_u8, 0xee_u8, 0xe1_u8, 0x49_u8])
    def query_interface(this : IFaxDeviceIds*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxDeviceIds*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxDeviceIds*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxDeviceIds*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxDeviceIds*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxDeviceIds*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxDeviceIds*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IFaxDeviceIds*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppUnk)
    end
    def get_Item(this : IFaxDeviceIds*, lIndex : Int32, plDeviceId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lIndex, plDeviceId)
    end
    def get_Count(this : IFaxDeviceIds*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def add(this : IFaxDeviceIds*, lDeviceId : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, lDeviceId)
    end
    def remove(this : IFaxDeviceIds*, lIndex : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, lIndex)
    end
    def set_order(this : IFaxDeviceIds*, lDeviceId : Int32, lNewOrder : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_order.call(this, lDeviceId, lNewOrder)
    end

  end

  @[Extern]
  record IFaxOutboundRoutingRulesVtbl,
    query_interface : Proc(IFaxOutboundRoutingRules*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxOutboundRoutingRules*, UInt32),
    release : Proc(IFaxOutboundRoutingRules*, UInt32),
    get_type_info_count : Proc(IFaxOutboundRoutingRules*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxOutboundRoutingRules*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxOutboundRoutingRules*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxOutboundRoutingRules*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IFaxOutboundRoutingRules*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IFaxOutboundRoutingRules*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IFaxOutboundRoutingRules*, Int32*, Win32cr::Foundation::HRESULT),
    item_by_country_and_area : Proc(IFaxOutboundRoutingRules*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    remove_by_country_and_area : Proc(IFaxOutboundRoutingRules*, Int32, Int32, Win32cr::Foundation::HRESULT),
    remove : Proc(IFaxOutboundRoutingRules*, Int32, Win32cr::Foundation::HRESULT),
    add : Proc(IFaxOutboundRoutingRules*, Int32, Int32, Int16, Win32cr::Foundation::BSTR, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcefa1e7-ae7d-4ed6-8521-369edcca5120")]
  record IFaxOutboundRoutingRules, lpVtbl : IFaxOutboundRoutingRulesVtbl* do
    GUID = LibC::GUID.new(0xdcefa1e7_u32, 0xae7d_u16, 0x4ed6_u16, StaticArray[0x85_u8, 0x21_u8, 0x36_u8, 0x9e_u8, 0xdc_u8, 0xca_u8, 0x51_u8, 0x20_u8])
    def query_interface(this : IFaxOutboundRoutingRules*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxOutboundRoutingRules*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxOutboundRoutingRules*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxOutboundRoutingRules*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxOutboundRoutingRules*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxOutboundRoutingRules*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxOutboundRoutingRules*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IFaxOutboundRoutingRules*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppUnk)
    end
    def get_Item(this : IFaxOutboundRoutingRules*, lIndex : Int32, pFaxOutboundRoutingRule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, lIndex, pFaxOutboundRoutingRule)
    end
    def get_Count(this : IFaxOutboundRoutingRules*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end
    def item_by_country_and_area(this : IFaxOutboundRoutingRules*, lCountryCode : Int32, lAreaCode : Int32, pFaxOutboundRoutingRule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.item_by_country_and_area.call(this, lCountryCode, lAreaCode, pFaxOutboundRoutingRule)
    end
    def remove_by_country_and_area(this : IFaxOutboundRoutingRules*, lCountryCode : Int32, lAreaCode : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_by_country_and_area.call(this, lCountryCode, lAreaCode)
    end
    def remove(this : IFaxOutboundRoutingRules*, lIndex : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, lIndex)
    end
    def add(this : IFaxOutboundRoutingRules*, lCountryCode : Int32, lAreaCode : Int32, bUseDevice : Int16, bstrGroupName : Win32cr::Foundation::BSTR, lDeviceId : Int32, pFaxOutboundRoutingRule : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, lCountryCode, lAreaCode, bUseDevice, bstrGroupName, lDeviceId, pFaxOutboundRoutingRule)
    end

  end

  @[Extern]
  record IFaxOutboundRoutingRuleVtbl,
    query_interface : Proc(IFaxOutboundRoutingRule*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxOutboundRoutingRule*, UInt32),
    release : Proc(IFaxOutboundRoutingRule*, UInt32),
    get_type_info_count : Proc(IFaxOutboundRoutingRule*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxOutboundRoutingRule*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxOutboundRoutingRule*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxOutboundRoutingRule*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CountryCode : Proc(IFaxOutboundRoutingRule*, Int32*, Win32cr::Foundation::HRESULT),
    get_AreaCode : Proc(IFaxOutboundRoutingRule*, Int32*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(IFaxOutboundRoutingRule*, Win32cr::Devices::Fax::FAX_RULE_STATUS_ENUM*, Win32cr::Foundation::HRESULT),
    get_UseDevice : Proc(IFaxOutboundRoutingRule*, Int16*, Win32cr::Foundation::HRESULT),
    put_UseDevice : Proc(IFaxOutboundRoutingRule*, Int16, Win32cr::Foundation::HRESULT),
    get_DeviceId : Proc(IFaxOutboundRoutingRule*, Int32*, Win32cr::Foundation::HRESULT),
    put_DeviceId : Proc(IFaxOutboundRoutingRule*, Int32, Win32cr::Foundation::HRESULT),
    get_GroupName : Proc(IFaxOutboundRoutingRule*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_GroupName : Proc(IFaxOutboundRoutingRule*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxOutboundRoutingRule*, Win32cr::Foundation::HRESULT),
    save : Proc(IFaxOutboundRoutingRule*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e1f795d5-07c2-469f-b027-acacc23219da")]
  record IFaxOutboundRoutingRule, lpVtbl : IFaxOutboundRoutingRuleVtbl* do
    GUID = LibC::GUID.new(0xe1f795d5_u32, 0x7c2_u16, 0x469f_u16, StaticArray[0xb0_u8, 0x27_u8, 0xac_u8, 0xac_u8, 0xc2_u8, 0x32_u8, 0x19_u8, 0xda_u8])
    def query_interface(this : IFaxOutboundRoutingRule*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxOutboundRoutingRule*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxOutboundRoutingRule*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxOutboundRoutingRule*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxOutboundRoutingRule*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxOutboundRoutingRule*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxOutboundRoutingRule*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_CountryCode(this : IFaxOutboundRoutingRule*, plCountryCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CountryCode.call(this, plCountryCode)
    end
    def get_AreaCode(this : IFaxOutboundRoutingRule*, plAreaCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AreaCode.call(this, plAreaCode)
    end
    def get_Status(this : IFaxOutboundRoutingRule*, pStatus : Win32cr::Devices::Fax::FAX_RULE_STATUS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, pStatus)
    end
    def get_UseDevice(this : IFaxOutboundRoutingRule*, pbUseDevice : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UseDevice.call(this, pbUseDevice)
    end
    def put_UseDevice(this : IFaxOutboundRoutingRule*, bUseDevice : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UseDevice.call(this, bUseDevice)
    end
    def get_DeviceId(this : IFaxOutboundRoutingRule*, plDeviceId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceId.call(this, plDeviceId)
    end
    def put_DeviceId(this : IFaxOutboundRoutingRule*, device_id : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DeviceId.call(this, device_id)
    end
    def get_GroupName(this : IFaxOutboundRoutingRule*, pbstrGroupName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GroupName.call(this, pbstrGroupName)
    end
    def put_GroupName(this : IFaxOutboundRoutingRule*, bstrGroupName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GroupName.call(this, bstrGroupName)
    end
    def refresh(this : IFaxOutboundRoutingRule*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def save(this : IFaxOutboundRoutingRule*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end

  end

  @[Extern]
  record IFaxInboundRoutingExtensionsVtbl,
    query_interface : Proc(IFaxInboundRoutingExtensions*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxInboundRoutingExtensions*, UInt32),
    release : Proc(IFaxInboundRoutingExtensions*, UInt32),
    get_type_info_count : Proc(IFaxInboundRoutingExtensions*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxInboundRoutingExtensions*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxInboundRoutingExtensions*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxInboundRoutingExtensions*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IFaxInboundRoutingExtensions*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IFaxInboundRoutingExtensions*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IFaxInboundRoutingExtensions*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2f6c9673-7b26-42de-8eb0-915dcd2a4f4c")]
  record IFaxInboundRoutingExtensions, lpVtbl : IFaxInboundRoutingExtensionsVtbl* do
    GUID = LibC::GUID.new(0x2f6c9673_u32, 0x7b26_u16, 0x42de_u16, StaticArray[0x8e_u8, 0xb0_u8, 0x91_u8, 0x5d_u8, 0xcd_u8, 0x2a_u8, 0x4f_u8, 0x4c_u8])
    def query_interface(this : IFaxInboundRoutingExtensions*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxInboundRoutingExtensions*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxInboundRoutingExtensions*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxInboundRoutingExtensions*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxInboundRoutingExtensions*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxInboundRoutingExtensions*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxInboundRoutingExtensions*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IFaxInboundRoutingExtensions*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppUnk)
    end
    def get_Item(this : IFaxInboundRoutingExtensions*, vIndex : Win32cr::System::Com::VARIANT, pFaxInboundRoutingExtension : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, vIndex, pFaxInboundRoutingExtension)
    end
    def get_Count(this : IFaxInboundRoutingExtensions*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end

  end

  @[Extern]
  record IFaxInboundRoutingExtensionVtbl,
    query_interface : Proc(IFaxInboundRoutingExtension*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxInboundRoutingExtension*, UInt32),
    release : Proc(IFaxInboundRoutingExtension*, UInt32),
    get_type_info_count : Proc(IFaxInboundRoutingExtension*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxInboundRoutingExtension*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxInboundRoutingExtension*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxInboundRoutingExtension*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_FriendlyName : Proc(IFaxInboundRoutingExtension*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ImageName : Proc(IFaxInboundRoutingExtension*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_UniqueName : Proc(IFaxInboundRoutingExtension*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_MajorVersion : Proc(IFaxInboundRoutingExtension*, Int32*, Win32cr::Foundation::HRESULT),
    get_MinorVersion : Proc(IFaxInboundRoutingExtension*, Int32*, Win32cr::Foundation::HRESULT),
    get_MajorBuild : Proc(IFaxInboundRoutingExtension*, Int32*, Win32cr::Foundation::HRESULT),
    get_MinorBuild : Proc(IFaxInboundRoutingExtension*, Int32*, Win32cr::Foundation::HRESULT),
    get_Debug : Proc(IFaxInboundRoutingExtension*, Int16*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(IFaxInboundRoutingExtension*, Win32cr::Devices::Fax::FAX_PROVIDER_STATUS_ENUM*, Win32cr::Foundation::HRESULT),
    get_InitErrorCode : Proc(IFaxInboundRoutingExtension*, Int32*, Win32cr::Foundation::HRESULT),
    get_Methods : Proc(IFaxInboundRoutingExtension*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("885b5e08-c26c-4ef9-af83-51580a750be1")]
  record IFaxInboundRoutingExtension, lpVtbl : IFaxInboundRoutingExtensionVtbl* do
    GUID = LibC::GUID.new(0x885b5e08_u32, 0xc26c_u16, 0x4ef9_u16, StaticArray[0xaf_u8, 0x83_u8, 0x51_u8, 0x58_u8, 0xa_u8, 0x75_u8, 0xb_u8, 0xe1_u8])
    def query_interface(this : IFaxInboundRoutingExtension*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxInboundRoutingExtension*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxInboundRoutingExtension*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxInboundRoutingExtension*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxInboundRoutingExtension*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxInboundRoutingExtension*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxInboundRoutingExtension*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_FriendlyName(this : IFaxInboundRoutingExtension*, pbstrFriendlyName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FriendlyName.call(this, pbstrFriendlyName)
    end
    def get_ImageName(this : IFaxInboundRoutingExtension*, pbstrImageName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ImageName.call(this, pbstrImageName)
    end
    def get_UniqueName(this : IFaxInboundRoutingExtension*, pbstrUniqueName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UniqueName.call(this, pbstrUniqueName)
    end
    def get_MajorVersion(this : IFaxInboundRoutingExtension*, plMajorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MajorVersion.call(this, plMajorVersion)
    end
    def get_MinorVersion(this : IFaxInboundRoutingExtension*, plMinorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinorVersion.call(this, plMinorVersion)
    end
    def get_MajorBuild(this : IFaxInboundRoutingExtension*, plMajorBuild : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MajorBuild.call(this, plMajorBuild)
    end
    def get_MinorBuild(this : IFaxInboundRoutingExtension*, plMinorBuild : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinorBuild.call(this, plMinorBuild)
    end
    def get_Debug(this : IFaxInboundRoutingExtension*, pbDebug : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Debug.call(this, pbDebug)
    end
    def get_Status(this : IFaxInboundRoutingExtension*, pStatus : Win32cr::Devices::Fax::FAX_PROVIDER_STATUS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, pStatus)
    end
    def get_InitErrorCode(this : IFaxInboundRoutingExtension*, plInitErrorCode : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InitErrorCode.call(this, plInitErrorCode)
    end
    def get_Methods(this : IFaxInboundRoutingExtension*, pvMethods : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Methods.call(this, pvMethods)
    end

  end

  @[Extern]
  record IFaxInboundRoutingMethodsVtbl,
    query_interface : Proc(IFaxInboundRoutingMethods*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxInboundRoutingMethods*, UInt32),
    release : Proc(IFaxInboundRoutingMethods*, UInt32),
    get_type_info_count : Proc(IFaxInboundRoutingMethods*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxInboundRoutingMethods*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxInboundRoutingMethods*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxInboundRoutingMethods*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IFaxInboundRoutingMethods*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IFaxInboundRoutingMethods*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IFaxInboundRoutingMethods*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("783fca10-8908-4473-9d69-f67fbea0c6b9")]
  record IFaxInboundRoutingMethods, lpVtbl : IFaxInboundRoutingMethodsVtbl* do
    GUID = LibC::GUID.new(0x783fca10_u32, 0x8908_u16, 0x4473_u16, StaticArray[0x9d_u8, 0x69_u8, 0xf6_u8, 0x7f_u8, 0xbe_u8, 0xa0_u8, 0xc6_u8, 0xb9_u8])
    def query_interface(this : IFaxInboundRoutingMethods*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxInboundRoutingMethods*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxInboundRoutingMethods*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxInboundRoutingMethods*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxInboundRoutingMethods*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxInboundRoutingMethods*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxInboundRoutingMethods*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IFaxInboundRoutingMethods*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppUnk)
    end
    def get_Item(this : IFaxInboundRoutingMethods*, vIndex : Win32cr::System::Com::VARIANT, pFaxInboundRoutingMethod : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, vIndex, pFaxInboundRoutingMethod)
    end
    def get_Count(this : IFaxInboundRoutingMethods*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end

  end

  @[Extern]
  record IFaxInboundRoutingMethodVtbl,
    query_interface : Proc(IFaxInboundRoutingMethod*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxInboundRoutingMethod*, UInt32),
    release : Proc(IFaxInboundRoutingMethod*, UInt32),
    get_type_info_count : Proc(IFaxInboundRoutingMethod*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxInboundRoutingMethod*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxInboundRoutingMethod*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxInboundRoutingMethod*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IFaxInboundRoutingMethod*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_GUID : Proc(IFaxInboundRoutingMethod*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_FunctionName : Proc(IFaxInboundRoutingMethod*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ExtensionFriendlyName : Proc(IFaxInboundRoutingMethod*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ExtensionImageName : Proc(IFaxInboundRoutingMethod*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Priority : Proc(IFaxInboundRoutingMethod*, Int32*, Win32cr::Foundation::HRESULT),
    put_Priority : Proc(IFaxInboundRoutingMethod*, Int32, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxInboundRoutingMethod*, Win32cr::Foundation::HRESULT),
    save : Proc(IFaxInboundRoutingMethod*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("45700061-ad9d-4776-a8c4-64065492cf4b")]
  record IFaxInboundRoutingMethod, lpVtbl : IFaxInboundRoutingMethodVtbl* do
    GUID = LibC::GUID.new(0x45700061_u32, 0xad9d_u16, 0x4776_u16, StaticArray[0xa8_u8, 0xc4_u8, 0x64_u8, 0x6_u8, 0x54_u8, 0x92_u8, 0xcf_u8, 0x4b_u8])
    def query_interface(this : IFaxInboundRoutingMethod*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxInboundRoutingMethod*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxInboundRoutingMethod*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxInboundRoutingMethod*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxInboundRoutingMethod*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxInboundRoutingMethod*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxInboundRoutingMethod*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IFaxInboundRoutingMethod*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pbstrName)
    end
    def get_GUID(this : IFaxInboundRoutingMethod*, pbstrGUID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GUID.call(this, pbstrGUID)
    end
    def get_FunctionName(this : IFaxInboundRoutingMethod*, pbstrFunctionName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FunctionName.call(this, pbstrFunctionName)
    end
    def get_ExtensionFriendlyName(this : IFaxInboundRoutingMethod*, pbstrExtensionFriendlyName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtensionFriendlyName.call(this, pbstrExtensionFriendlyName)
    end
    def get_ExtensionImageName(this : IFaxInboundRoutingMethod*, pbstrExtensionImageName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtensionImageName.call(this, pbstrExtensionImageName)
    end
    def get_Priority(this : IFaxInboundRoutingMethod*, plPriority : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Priority.call(this, plPriority)
    end
    def put_Priority(this : IFaxInboundRoutingMethod*, lPriority : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Priority.call(this, lPriority)
    end
    def refresh(this : IFaxInboundRoutingMethod*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def save(this : IFaxInboundRoutingMethod*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end

  end

  @[Extern]
  record IFaxDocument2Vtbl,
    query_interface : Proc(IFaxDocument2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxDocument2*, UInt32),
    release : Proc(IFaxDocument2*, UInt32),
    get_type_info_count : Proc(IFaxDocument2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxDocument2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxDocument2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxDocument2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Body : Proc(IFaxDocument2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Body : Proc(IFaxDocument2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Sender : Proc(IFaxDocument2*, Void**, Win32cr::Foundation::HRESULT),
    get_Recipients : Proc(IFaxDocument2*, Void**, Win32cr::Foundation::HRESULT),
    get_CoverPage : Proc(IFaxDocument2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_CoverPage : Proc(IFaxDocument2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Subject : Proc(IFaxDocument2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Subject : Proc(IFaxDocument2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Note : Proc(IFaxDocument2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Note : Proc(IFaxDocument2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ScheduleTime : Proc(IFaxDocument2*, Float64*, Win32cr::Foundation::HRESULT),
    put_ScheduleTime : Proc(IFaxDocument2*, Float64, Win32cr::Foundation::HRESULT),
    get_ReceiptAddress : Proc(IFaxDocument2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ReceiptAddress : Proc(IFaxDocument2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_DocumentName : Proc(IFaxDocument2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_DocumentName : Proc(IFaxDocument2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_CallHandle : Proc(IFaxDocument2*, Int32*, Win32cr::Foundation::HRESULT),
    put_CallHandle : Proc(IFaxDocument2*, Int32, Win32cr::Foundation::HRESULT),
    get_CoverPageType : Proc(IFaxDocument2*, Win32cr::Devices::Fax::FAX_COVERPAGE_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    put_CoverPageType : Proc(IFaxDocument2*, Win32cr::Devices::Fax::FAX_COVERPAGE_TYPE_ENUM, Win32cr::Foundation::HRESULT),
    get_ScheduleType : Proc(IFaxDocument2*, Win32cr::Devices::Fax::FAX_SCHEDULE_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    put_ScheduleType : Proc(IFaxDocument2*, Win32cr::Devices::Fax::FAX_SCHEDULE_TYPE_ENUM, Win32cr::Foundation::HRESULT),
    get_ReceiptType : Proc(IFaxDocument2*, Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    put_ReceiptType : Proc(IFaxDocument2*, Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM, Win32cr::Foundation::HRESULT),
    get_GroupBroadcastReceipts : Proc(IFaxDocument2*, Int16*, Win32cr::Foundation::HRESULT),
    put_GroupBroadcastReceipts : Proc(IFaxDocument2*, Int16, Win32cr::Foundation::HRESULT),
    get_Priority : Proc(IFaxDocument2*, Win32cr::Devices::Fax::FAX_PRIORITY_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    put_Priority : Proc(IFaxDocument2*, Win32cr::Devices::Fax::FAX_PRIORITY_TYPE_ENUM, Win32cr::Foundation::HRESULT),
    get_TapiConnection : Proc(IFaxDocument2*, Void**, Win32cr::Foundation::HRESULT),
    putref_TapiConnection : Proc(IFaxDocument2*, Void*, Win32cr::Foundation::HRESULT),
    submit : Proc(IFaxDocument2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    connected_submit : Proc(IFaxDocument2*, Void*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_AttachFaxToReceipt : Proc(IFaxDocument2*, Int16*, Win32cr::Foundation::HRESULT),
    put_AttachFaxToReceipt : Proc(IFaxDocument2*, Int16, Win32cr::Foundation::HRESULT),
    get_SubmissionId : Proc(IFaxDocument2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Bodies : Proc(IFaxDocument2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Bodies : Proc(IFaxDocument2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    submit2 : Proc(IFaxDocument2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Int32*, Win32cr::Foundation::HRESULT),
    connected_submit2 : Proc(IFaxDocument2*, Void*, Win32cr::System::Com::VARIANT*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e1347661-f9ef-4d6d-b4a5-c0a068b65cff")]
  record IFaxDocument2, lpVtbl : IFaxDocument2Vtbl* do
    GUID = LibC::GUID.new(0xe1347661_u32, 0xf9ef_u16, 0x4d6d_u16, StaticArray[0xb4_u8, 0xa5_u8, 0xc0_u8, 0xa0_u8, 0x68_u8, 0xb6_u8, 0x5c_u8, 0xff_u8])
    def query_interface(this : IFaxDocument2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxDocument2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxDocument2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxDocument2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxDocument2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxDocument2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxDocument2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Body(this : IFaxDocument2*, pbstrBody : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Body.call(this, pbstrBody)
    end
    def put_Body(this : IFaxDocument2*, bstrBody : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Body.call(this, bstrBody)
    end
    def get_Sender(this : IFaxDocument2*, ppFaxSender : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Sender.call(this, ppFaxSender)
    end
    def get_Recipients(this : IFaxDocument2*, ppFaxRecipients : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Recipients.call(this, ppFaxRecipients)
    end
    def get_CoverPage(this : IFaxDocument2*, pbstrCoverPage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CoverPage.call(this, pbstrCoverPage)
    end
    def put_CoverPage(this : IFaxDocument2*, bstrCoverPage : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CoverPage.call(this, bstrCoverPage)
    end
    def get_Subject(this : IFaxDocument2*, pbstrSubject : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Subject.call(this, pbstrSubject)
    end
    def put_Subject(this : IFaxDocument2*, bstrSubject : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Subject.call(this, bstrSubject)
    end
    def get_Note(this : IFaxDocument2*, pbstrNote : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Note.call(this, pbstrNote)
    end
    def put_Note(this : IFaxDocument2*, bstrNote : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Note.call(this, bstrNote)
    end
    def get_ScheduleTime(this : IFaxDocument2*, pdateScheduleTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScheduleTime.call(this, pdateScheduleTime)
    end
    def put_ScheduleTime(this : IFaxDocument2*, dateScheduleTime : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScheduleTime.call(this, dateScheduleTime)
    end
    def get_ReceiptAddress(this : IFaxDocument2*, pbstrReceiptAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReceiptAddress.call(this, pbstrReceiptAddress)
    end
    def put_ReceiptAddress(this : IFaxDocument2*, bstrReceiptAddress : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReceiptAddress.call(this, bstrReceiptAddress)
    end
    def get_DocumentName(this : IFaxDocument2*, pbstrDocumentName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DocumentName.call(this, pbstrDocumentName)
    end
    def put_DocumentName(this : IFaxDocument2*, bstrDocumentName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DocumentName.call(this, bstrDocumentName)
    end
    def get_CallHandle(this : IFaxDocument2*, plCallHandle : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CallHandle.call(this, plCallHandle)
    end
    def put_CallHandle(this : IFaxDocument2*, lCallHandle : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CallHandle.call(this, lCallHandle)
    end
    def get_CoverPageType(this : IFaxDocument2*, pCoverPageType : Win32cr::Devices::Fax::FAX_COVERPAGE_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CoverPageType.call(this, pCoverPageType)
    end
    def put_CoverPageType(this : IFaxDocument2*, cover_page_type : Win32cr::Devices::Fax::FAX_COVERPAGE_TYPE_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CoverPageType.call(this, cover_page_type)
    end
    def get_ScheduleType(this : IFaxDocument2*, pScheduleType : Win32cr::Devices::Fax::FAX_SCHEDULE_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScheduleType.call(this, pScheduleType)
    end
    def put_ScheduleType(this : IFaxDocument2*, schedule_type : Win32cr::Devices::Fax::FAX_SCHEDULE_TYPE_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ScheduleType.call(this, schedule_type)
    end
    def get_ReceiptType(this : IFaxDocument2*, pReceiptType : Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReceiptType.call(this, pReceiptType)
    end
    def put_ReceiptType(this : IFaxDocument2*, receipt_type : Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ReceiptType.call(this, receipt_type)
    end
    def get_GroupBroadcastReceipts(this : IFaxDocument2*, pbUseGrouping : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GroupBroadcastReceipts.call(this, pbUseGrouping)
    end
    def put_GroupBroadcastReceipts(this : IFaxDocument2*, bUseGrouping : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GroupBroadcastReceipts.call(this, bUseGrouping)
    end
    def get_Priority(this : IFaxDocument2*, pPriority : Win32cr::Devices::Fax::FAX_PRIORITY_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Priority.call(this, pPriority)
    end
    def put_Priority(this : IFaxDocument2*, priority : Win32cr::Devices::Fax::FAX_PRIORITY_TYPE_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Priority.call(this, priority)
    end
    def get_TapiConnection(this : IFaxDocument2*, ppTapiConnection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TapiConnection.call(this, ppTapiConnection)
    end
    def putref_TapiConnection(this : IFaxDocument2*, pTapiConnection : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.putref_TapiConnection.call(this, pTapiConnection)
    end
    def submit(this : IFaxDocument2*, bstrFaxServerName : Win32cr::Foundation::BSTR, pvFaxOutgoingJobIDs : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit.call(this, bstrFaxServerName, pvFaxOutgoingJobIDs)
    end
    def connected_submit(this : IFaxDocument2*, pFaxServer : Void*, pvFaxOutgoingJobIDs : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connected_submit.call(this, pFaxServer, pvFaxOutgoingJobIDs)
    end
    def get_AttachFaxToReceipt(this : IFaxDocument2*, pbAttachFax : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AttachFaxToReceipt.call(this, pbAttachFax)
    end
    def put_AttachFaxToReceipt(this : IFaxDocument2*, bAttachFax : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AttachFaxToReceipt.call(this, bAttachFax)
    end
    def get_SubmissionId(this : IFaxDocument2*, pbstrSubmissionId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubmissionId.call(this, pbstrSubmissionId)
    end
    def get_Bodies(this : IFaxDocument2*, pvBodies : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Bodies.call(this, pvBodies)
    end
    def put_Bodies(this : IFaxDocument2*, vBodies : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Bodies.call(this, vBodies)
    end
    def submit2(this : IFaxDocument2*, bstrFaxServerName : Win32cr::Foundation::BSTR, pvFaxOutgoingJobIDs : Win32cr::System::Com::VARIANT*, plErrorBodyFile : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.submit2.call(this, bstrFaxServerName, pvFaxOutgoingJobIDs, plErrorBodyFile)
    end
    def connected_submit2(this : IFaxDocument2*, pFaxServer : Void*, pvFaxOutgoingJobIDs : Win32cr::System::Com::VARIANT*, plErrorBodyFile : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connected_submit2.call(this, pFaxServer, pvFaxOutgoingJobIDs, plErrorBodyFile)
    end

  end

  @[Extern]
  record IFaxConfigurationVtbl,
    query_interface : Proc(IFaxConfiguration*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxConfiguration*, UInt32),
    release : Proc(IFaxConfiguration*, UInt32),
    get_type_info_count : Proc(IFaxConfiguration*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxConfiguration*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxConfiguration*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxConfiguration*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_UseArchive : Proc(IFaxConfiguration*, Int16*, Win32cr::Foundation::HRESULT),
    put_UseArchive : Proc(IFaxConfiguration*, Int16, Win32cr::Foundation::HRESULT),
    get_ArchiveLocation : Proc(IFaxConfiguration*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_ArchiveLocation : Proc(IFaxConfiguration*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SizeQuotaWarning : Proc(IFaxConfiguration*, Int16*, Win32cr::Foundation::HRESULT),
    put_SizeQuotaWarning : Proc(IFaxConfiguration*, Int16, Win32cr::Foundation::HRESULT),
    get_HighQuotaWaterMark : Proc(IFaxConfiguration*, Int32*, Win32cr::Foundation::HRESULT),
    put_HighQuotaWaterMark : Proc(IFaxConfiguration*, Int32, Win32cr::Foundation::HRESULT),
    get_LowQuotaWaterMark : Proc(IFaxConfiguration*, Int32*, Win32cr::Foundation::HRESULT),
    put_LowQuotaWaterMark : Proc(IFaxConfiguration*, Int32, Win32cr::Foundation::HRESULT),
    get_ArchiveAgeLimit : Proc(IFaxConfiguration*, Int32*, Win32cr::Foundation::HRESULT),
    put_ArchiveAgeLimit : Proc(IFaxConfiguration*, Int32, Win32cr::Foundation::HRESULT),
    get_ArchiveSizeLow : Proc(IFaxConfiguration*, Int32*, Win32cr::Foundation::HRESULT),
    get_ArchiveSizeHigh : Proc(IFaxConfiguration*, Int32*, Win32cr::Foundation::HRESULT),
    get_OutgoingQueueBlocked : Proc(IFaxConfiguration*, Int16*, Win32cr::Foundation::HRESULT),
    put_OutgoingQueueBlocked : Proc(IFaxConfiguration*, Int16, Win32cr::Foundation::HRESULT),
    get_OutgoingQueuePaused : Proc(IFaxConfiguration*, Int16*, Win32cr::Foundation::HRESULT),
    put_OutgoingQueuePaused : Proc(IFaxConfiguration*, Int16, Win32cr::Foundation::HRESULT),
    get_AllowPersonalCoverPages : Proc(IFaxConfiguration*, Int16*, Win32cr::Foundation::HRESULT),
    put_AllowPersonalCoverPages : Proc(IFaxConfiguration*, Int16, Win32cr::Foundation::HRESULT),
    get_UseDeviceTSID : Proc(IFaxConfiguration*, Int16*, Win32cr::Foundation::HRESULT),
    put_UseDeviceTSID : Proc(IFaxConfiguration*, Int16, Win32cr::Foundation::HRESULT),
    get_Retries : Proc(IFaxConfiguration*, Int32*, Win32cr::Foundation::HRESULT),
    put_Retries : Proc(IFaxConfiguration*, Int32, Win32cr::Foundation::HRESULT),
    get_RetryDelay : Proc(IFaxConfiguration*, Int32*, Win32cr::Foundation::HRESULT),
    put_RetryDelay : Proc(IFaxConfiguration*, Int32, Win32cr::Foundation::HRESULT),
    get_DiscountRateStart : Proc(IFaxConfiguration*, Float64*, Win32cr::Foundation::HRESULT),
    put_DiscountRateStart : Proc(IFaxConfiguration*, Float64, Win32cr::Foundation::HRESULT),
    get_DiscountRateEnd : Proc(IFaxConfiguration*, Float64*, Win32cr::Foundation::HRESULT),
    put_DiscountRateEnd : Proc(IFaxConfiguration*, Float64, Win32cr::Foundation::HRESULT),
    get_OutgoingQueueAgeLimit : Proc(IFaxConfiguration*, Int32*, Win32cr::Foundation::HRESULT),
    put_OutgoingQueueAgeLimit : Proc(IFaxConfiguration*, Int32, Win32cr::Foundation::HRESULT),
    get_Branding : Proc(IFaxConfiguration*, Int16*, Win32cr::Foundation::HRESULT),
    put_Branding : Proc(IFaxConfiguration*, Int16, Win32cr::Foundation::HRESULT),
    get_IncomingQueueBlocked : Proc(IFaxConfiguration*, Int16*, Win32cr::Foundation::HRESULT),
    put_IncomingQueueBlocked : Proc(IFaxConfiguration*, Int16, Win32cr::Foundation::HRESULT),
    get_AutoCreateAccountOnConnect : Proc(IFaxConfiguration*, Int16*, Win32cr::Foundation::HRESULT),
    put_AutoCreateAccountOnConnect : Proc(IFaxConfiguration*, Int16, Win32cr::Foundation::HRESULT),
    get_IncomingFaxesArePublic : Proc(IFaxConfiguration*, Int16*, Win32cr::Foundation::HRESULT),
    put_IncomingFaxesArePublic : Proc(IFaxConfiguration*, Int16, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxConfiguration*, Win32cr::Foundation::HRESULT),
    save : Proc(IFaxConfiguration*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("10f4d0f7-0994-4543-ab6e-506949128c40")]
  record IFaxConfiguration, lpVtbl : IFaxConfigurationVtbl* do
    GUID = LibC::GUID.new(0x10f4d0f7_u32, 0x994_u16, 0x4543_u16, StaticArray[0xab_u8, 0x6e_u8, 0x50_u8, 0x69_u8, 0x49_u8, 0x12_u8, 0x8c_u8, 0x40_u8])
    def query_interface(this : IFaxConfiguration*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxConfiguration*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxConfiguration*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxConfiguration*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxConfiguration*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxConfiguration*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxConfiguration*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_UseArchive(this : IFaxConfiguration*, pbUseArchive : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UseArchive.call(this, pbUseArchive)
    end
    def put_UseArchive(this : IFaxConfiguration*, bUseArchive : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UseArchive.call(this, bUseArchive)
    end
    def get_ArchiveLocation(this : IFaxConfiguration*, pbstrArchiveLocation : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ArchiveLocation.call(this, pbstrArchiveLocation)
    end
    def put_ArchiveLocation(this : IFaxConfiguration*, bstrArchiveLocation : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ArchiveLocation.call(this, bstrArchiveLocation)
    end
    def get_SizeQuotaWarning(this : IFaxConfiguration*, pbSizeQuotaWarning : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SizeQuotaWarning.call(this, pbSizeQuotaWarning)
    end
    def put_SizeQuotaWarning(this : IFaxConfiguration*, bSizeQuotaWarning : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SizeQuotaWarning.call(this, bSizeQuotaWarning)
    end
    def get_HighQuotaWaterMark(this : IFaxConfiguration*, plHighQuotaWaterMark : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HighQuotaWaterMark.call(this, plHighQuotaWaterMark)
    end
    def put_HighQuotaWaterMark(this : IFaxConfiguration*, lHighQuotaWaterMark : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_HighQuotaWaterMark.call(this, lHighQuotaWaterMark)
    end
    def get_LowQuotaWaterMark(this : IFaxConfiguration*, plLowQuotaWaterMark : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LowQuotaWaterMark.call(this, plLowQuotaWaterMark)
    end
    def put_LowQuotaWaterMark(this : IFaxConfiguration*, lLowQuotaWaterMark : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LowQuotaWaterMark.call(this, lLowQuotaWaterMark)
    end
    def get_ArchiveAgeLimit(this : IFaxConfiguration*, plArchiveAgeLimit : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ArchiveAgeLimit.call(this, plArchiveAgeLimit)
    end
    def put_ArchiveAgeLimit(this : IFaxConfiguration*, lArchiveAgeLimit : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ArchiveAgeLimit.call(this, lArchiveAgeLimit)
    end
    def get_ArchiveSizeLow(this : IFaxConfiguration*, plSizeLow : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ArchiveSizeLow.call(this, plSizeLow)
    end
    def get_ArchiveSizeHigh(this : IFaxConfiguration*, plSizeHigh : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ArchiveSizeHigh.call(this, plSizeHigh)
    end
    def get_OutgoingQueueBlocked(this : IFaxConfiguration*, pbOutgoingBlocked : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutgoingQueueBlocked.call(this, pbOutgoingBlocked)
    end
    def put_OutgoingQueueBlocked(this : IFaxConfiguration*, bOutgoingBlocked : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OutgoingQueueBlocked.call(this, bOutgoingBlocked)
    end
    def get_OutgoingQueuePaused(this : IFaxConfiguration*, pbOutgoingPaused : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutgoingQueuePaused.call(this, pbOutgoingPaused)
    end
    def put_OutgoingQueuePaused(this : IFaxConfiguration*, bOutgoingPaused : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OutgoingQueuePaused.call(this, bOutgoingPaused)
    end
    def get_AllowPersonalCoverPages(this : IFaxConfiguration*, pbAllowPersonalCoverPages : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowPersonalCoverPages.call(this, pbAllowPersonalCoverPages)
    end
    def put_AllowPersonalCoverPages(this : IFaxConfiguration*, bAllowPersonalCoverPages : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowPersonalCoverPages.call(this, bAllowPersonalCoverPages)
    end
    def get_UseDeviceTSID(this : IFaxConfiguration*, pbUseDeviceTSID : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_UseDeviceTSID.call(this, pbUseDeviceTSID)
    end
    def put_UseDeviceTSID(this : IFaxConfiguration*, bUseDeviceTSID : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_UseDeviceTSID.call(this, bUseDeviceTSID)
    end
    def get_Retries(this : IFaxConfiguration*, plRetries : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Retries.call(this, plRetries)
    end
    def put_Retries(this : IFaxConfiguration*, lRetries : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Retries.call(this, lRetries)
    end
    def get_RetryDelay(this : IFaxConfiguration*, plRetryDelay : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RetryDelay.call(this, plRetryDelay)
    end
    def put_RetryDelay(this : IFaxConfiguration*, lRetryDelay : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RetryDelay.call(this, lRetryDelay)
    end
    def get_DiscountRateStart(this : IFaxConfiguration*, pdateDiscountRateStart : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DiscountRateStart.call(this, pdateDiscountRateStart)
    end
    def put_DiscountRateStart(this : IFaxConfiguration*, dateDiscountRateStart : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DiscountRateStart.call(this, dateDiscountRateStart)
    end
    def get_DiscountRateEnd(this : IFaxConfiguration*, pdateDiscountRateEnd : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DiscountRateEnd.call(this, pdateDiscountRateEnd)
    end
    def put_DiscountRateEnd(this : IFaxConfiguration*, dateDiscountRateEnd : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_DiscountRateEnd.call(this, dateDiscountRateEnd)
    end
    def get_OutgoingQueueAgeLimit(this : IFaxConfiguration*, plOutgoingQueueAgeLimit : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutgoingQueueAgeLimit.call(this, plOutgoingQueueAgeLimit)
    end
    def put_OutgoingQueueAgeLimit(this : IFaxConfiguration*, lOutgoingQueueAgeLimit : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OutgoingQueueAgeLimit.call(this, lOutgoingQueueAgeLimit)
    end
    def get_Branding(this : IFaxConfiguration*, pbBranding : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Branding.call(this, pbBranding)
    end
    def put_Branding(this : IFaxConfiguration*, bBranding : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Branding.call(this, bBranding)
    end
    def get_IncomingQueueBlocked(this : IFaxConfiguration*, pbIncomingBlocked : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IncomingQueueBlocked.call(this, pbIncomingBlocked)
    end
    def put_IncomingQueueBlocked(this : IFaxConfiguration*, bIncomingBlocked : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IncomingQueueBlocked.call(this, bIncomingBlocked)
    end
    def get_AutoCreateAccountOnConnect(this : IFaxConfiguration*, pbAutoCreateAccountOnConnect : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoCreateAccountOnConnect.call(this, pbAutoCreateAccountOnConnect)
    end
    def put_AutoCreateAccountOnConnect(this : IFaxConfiguration*, bAutoCreateAccountOnConnect : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AutoCreateAccountOnConnect.call(this, bAutoCreateAccountOnConnect)
    end
    def get_IncomingFaxesArePublic(this : IFaxConfiguration*, pbIncomingFaxesArePublic : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IncomingFaxesArePublic.call(this, pbIncomingFaxesArePublic)
    end
    def put_IncomingFaxesArePublic(this : IFaxConfiguration*, bIncomingFaxesArePublic : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IncomingFaxesArePublic.call(this, bIncomingFaxesArePublic)
    end
    def refresh(this : IFaxConfiguration*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def save(this : IFaxConfiguration*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end

  end

  @[Extern]
  record IFaxServer2Vtbl,
    query_interface : Proc(IFaxServer2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxServer2*, UInt32),
    release : Proc(IFaxServer2*, UInt32),
    get_type_info_count : Proc(IFaxServer2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxServer2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxServer2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxServer2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    connect : Proc(IFaxServer2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_ServerName : Proc(IFaxServer2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_device_providers : Proc(IFaxServer2*, Void**, Win32cr::Foundation::HRESULT),
    get_devices : Proc(IFaxServer2*, Void**, Win32cr::Foundation::HRESULT),
    get_InboundRouting : Proc(IFaxServer2*, Void**, Win32cr::Foundation::HRESULT),
    get_Folders : Proc(IFaxServer2*, Void**, Win32cr::Foundation::HRESULT),
    get_LoggingOptions : Proc(IFaxServer2*, Void**, Win32cr::Foundation::HRESULT),
    get_MajorVersion : Proc(IFaxServer2*, Int32*, Win32cr::Foundation::HRESULT),
    get_MinorVersion : Proc(IFaxServer2*, Int32*, Win32cr::Foundation::HRESULT),
    get_MajorBuild : Proc(IFaxServer2*, Int32*, Win32cr::Foundation::HRESULT),
    get_MinorBuild : Proc(IFaxServer2*, Int32*, Win32cr::Foundation::HRESULT),
    get_Debug : Proc(IFaxServer2*, Int16*, Win32cr::Foundation::HRESULT),
    get_Activity : Proc(IFaxServer2*, Void**, Win32cr::Foundation::HRESULT),
    get_OutboundRouting : Proc(IFaxServer2*, Void**, Win32cr::Foundation::HRESULT),
    get_ReceiptOptions : Proc(IFaxServer2*, Void**, Win32cr::Foundation::HRESULT),
    get_Security : Proc(IFaxServer2*, Void**, Win32cr::Foundation::HRESULT),
    disconnect : Proc(IFaxServer2*, Win32cr::Foundation::HRESULT),
    get_extension_property : Proc(IFaxServer2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    set_extension_property : Proc(IFaxServer2*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    listen_to_server_events : Proc(IFaxServer2*, Win32cr::Devices::Fax::FAX_SERVER_EVENTS_TYPE_ENUM, Win32cr::Foundation::HRESULT),
    register_device_provider : Proc(IFaxServer2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    unregister_device_provider : Proc(IFaxServer2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    register_inbound_routing_extension : Proc(IFaxServer2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    unregister_inbound_routing_extension : Proc(IFaxServer2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_RegisteredEvents : Proc(IFaxServer2*, Win32cr::Devices::Fax::FAX_SERVER_EVENTS_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    get_APIVersion : Proc(IFaxServer2*, Win32cr::Devices::Fax::FAX_SERVER_APIVERSION_ENUM*, Win32cr::Foundation::HRESULT),
    get_Configuration : Proc(IFaxServer2*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentAccount : Proc(IFaxServer2*, Void**, Win32cr::Foundation::HRESULT),
    get_FaxAccountSet : Proc(IFaxServer2*, Void**, Win32cr::Foundation::HRESULT),
    get_Security2 : Proc(IFaxServer2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("571ced0f-5609-4f40-9176-547e3a72ca7c")]
  record IFaxServer2, lpVtbl : IFaxServer2Vtbl* do
    GUID = LibC::GUID.new(0x571ced0f_u32, 0x5609_u16, 0x4f40_u16, StaticArray[0x91_u8, 0x76_u8, 0x54_u8, 0x7e_u8, 0x3a_u8, 0x72_u8, 0xca_u8, 0x7c_u8])
    def query_interface(this : IFaxServer2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxServer2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxServer2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxServer2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxServer2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxServer2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxServer2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def connect(this : IFaxServer2*, bstrServerName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this, bstrServerName)
    end
    def get_ServerName(this : IFaxServer2*, pbstrServerName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServerName.call(this, pbstrServerName)
    end
    def get_device_providers(this : IFaxServer2*, ppFaxDeviceProviders : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_providers.call(this, ppFaxDeviceProviders)
    end
    def get_devices(this : IFaxServer2*, ppFaxDevices : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_devices.call(this, ppFaxDevices)
    end
    def get_InboundRouting(this : IFaxServer2*, ppFaxInboundRouting : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InboundRouting.call(this, ppFaxInboundRouting)
    end
    def get_Folders(this : IFaxServer2*, pFaxFolders : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Folders.call(this, pFaxFolders)
    end
    def get_LoggingOptions(this : IFaxServer2*, ppFaxLoggingOptions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LoggingOptions.call(this, ppFaxLoggingOptions)
    end
    def get_MajorVersion(this : IFaxServer2*, plMajorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MajorVersion.call(this, plMajorVersion)
    end
    def get_MinorVersion(this : IFaxServer2*, plMinorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinorVersion.call(this, plMinorVersion)
    end
    def get_MajorBuild(this : IFaxServer2*, plMajorBuild : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MajorBuild.call(this, plMajorBuild)
    end
    def get_MinorBuild(this : IFaxServer2*, plMinorBuild : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinorBuild.call(this, plMinorBuild)
    end
    def get_Debug(this : IFaxServer2*, pbDebug : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Debug.call(this, pbDebug)
    end
    def get_Activity(this : IFaxServer2*, ppFaxActivity : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Activity.call(this, ppFaxActivity)
    end
    def get_OutboundRouting(this : IFaxServer2*, ppFaxOutboundRouting : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutboundRouting.call(this, ppFaxOutboundRouting)
    end
    def get_ReceiptOptions(this : IFaxServer2*, ppFaxReceiptOptions : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReceiptOptions.call(this, ppFaxReceiptOptions)
    end
    def get_Security(this : IFaxServer2*, ppFaxSecurity : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Security.call(this, ppFaxSecurity)
    end
    def disconnect(this : IFaxServer2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disconnect.call(this)
    end
    def get_extension_property(this : IFaxServer2*, bstrGUID : Win32cr::Foundation::BSTR, pvProperty : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_extension_property.call(this, bstrGUID, pvProperty)
    end
    def set_extension_property(this : IFaxServer2*, bstrGUID : Win32cr::Foundation::BSTR, vProperty : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_extension_property.call(this, bstrGUID, vProperty)
    end
    def listen_to_server_events(this : IFaxServer2*, event_types : Win32cr::Devices::Fax::FAX_SERVER_EVENTS_TYPE_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.listen_to_server_events.call(this, event_types)
    end
    def register_device_provider(this : IFaxServer2*, bstrGUID : Win32cr::Foundation::BSTR, bstrFriendlyName : Win32cr::Foundation::BSTR, bstrImageName : Win32cr::Foundation::BSTR, tsp_name : Win32cr::Foundation::BSTR, lFSPIVersion : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_device_provider.call(this, bstrGUID, bstrFriendlyName, bstrImageName, tsp_name, lFSPIVersion)
    end
    def unregister_device_provider(this : IFaxServer2*, bstrUniqueName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_device_provider.call(this, bstrUniqueName)
    end
    def register_inbound_routing_extension(this : IFaxServer2*, bstrExtensionName : Win32cr::Foundation::BSTR, bstrFriendlyName : Win32cr::Foundation::BSTR, bstrImageName : Win32cr::Foundation::BSTR, vMethods : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_inbound_routing_extension.call(this, bstrExtensionName, bstrFriendlyName, bstrImageName, vMethods)
    end
    def unregister_inbound_routing_extension(this : IFaxServer2*, bstrExtensionUniqueName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_inbound_routing_extension.call(this, bstrExtensionUniqueName)
    end
    def get_RegisteredEvents(this : IFaxServer2*, pEventTypes : Win32cr::Devices::Fax::FAX_SERVER_EVENTS_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RegisteredEvents.call(this, pEventTypes)
    end
    def get_APIVersion(this : IFaxServer2*, pAPIVersion : Win32cr::Devices::Fax::FAX_SERVER_APIVERSION_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_APIVersion.call(this, pAPIVersion)
    end
    def get_Configuration(this : IFaxServer2*, ppFaxConfiguration : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Configuration.call(this, ppFaxConfiguration)
    end
    def get_CurrentAccount(this : IFaxServer2*, ppCurrentAccount : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAccount.call(this, ppCurrentAccount)
    end
    def get_FaxAccountSet(this : IFaxServer2*, ppFaxAccountSet : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FaxAccountSet.call(this, ppFaxAccountSet)
    end
    def get_Security2(this : IFaxServer2*, ppFaxSecurity2 : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Security2.call(this, ppFaxSecurity2)
    end

  end

  @[Extern]
  record IFaxAccountSetVtbl,
    query_interface : Proc(IFaxAccountSet*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxAccountSet*, UInt32),
    release : Proc(IFaxAccountSet*, UInt32),
    get_type_info_count : Proc(IFaxAccountSet*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxAccountSet*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxAccountSet*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxAccountSet*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_accounts : Proc(IFaxAccountSet*, Void**, Win32cr::Foundation::HRESULT),
    get_account : Proc(IFaxAccountSet*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    add_account : Proc(IFaxAccountSet*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    remove_account : Proc(IFaxAccountSet*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7428fbae-841e-47b8-86f4-2288946dca1b")]
  record IFaxAccountSet, lpVtbl : IFaxAccountSetVtbl* do
    GUID = LibC::GUID.new(0x7428fbae_u32, 0x841e_u16, 0x47b8_u16, StaticArray[0x86_u8, 0xf4_u8, 0x22_u8, 0x88_u8, 0x94_u8, 0x6d_u8, 0xca_u8, 0x1b_u8])
    def query_interface(this : IFaxAccountSet*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxAccountSet*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxAccountSet*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxAccountSet*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxAccountSet*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxAccountSet*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxAccountSet*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_accounts(this : IFaxAccountSet*, ppFaxAccounts : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accounts.call(this, ppFaxAccounts)
    end
    def get_account(this : IFaxAccountSet*, bstrAccountName : Win32cr::Foundation::BSTR, pFaxAccount : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_account.call(this, bstrAccountName, pFaxAccount)
    end
    def add_account(this : IFaxAccountSet*, bstrAccountName : Win32cr::Foundation::BSTR, pFaxAccount : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_account.call(this, bstrAccountName, pFaxAccount)
    end
    def remove_account(this : IFaxAccountSet*, bstrAccountName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_account.call(this, bstrAccountName)
    end

  end

  @[Extern]
  record IFaxAccountsVtbl,
    query_interface : Proc(IFaxAccounts*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxAccounts*, UInt32),
    release : Proc(IFaxAccounts*, UInt32),
    get_type_info_count : Proc(IFaxAccounts*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxAccounts*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxAccounts*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxAccounts*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IFaxAccounts*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IFaxAccounts*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IFaxAccounts*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("93ea8162-8be7-42d1-ae7b-ec74e2d989da")]
  record IFaxAccounts, lpVtbl : IFaxAccountsVtbl* do
    GUID = LibC::GUID.new(0x93ea8162_u32, 0x8be7_u16, 0x42d1_u16, StaticArray[0xae_u8, 0x7b_u8, 0xec_u8, 0x74_u8, 0xe2_u8, 0xd9_u8, 0x89_u8, 0xda_u8])
    def query_interface(this : IFaxAccounts*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxAccounts*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxAccounts*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxAccounts*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxAccounts*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxAccounts*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxAccounts*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IFaxAccounts*, ppUnk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppUnk)
    end
    def get_Item(this : IFaxAccounts*, vIndex : Win32cr::System::Com::VARIANT, pFaxAccount : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, vIndex, pFaxAccount)
    end
    def get_Count(this : IFaxAccounts*, plCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, plCount)
    end

  end

  @[Extern]
  record IFaxAccountVtbl,
    query_interface : Proc(IFaxAccount*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxAccount*, UInt32),
    release : Proc(IFaxAccount*, UInt32),
    get_type_info_count : Proc(IFaxAccount*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxAccount*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxAccount*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxAccount*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_AccountName : Proc(IFaxAccount*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Folders : Proc(IFaxAccount*, Void**, Win32cr::Foundation::HRESULT),
    listen_to_account_events : Proc(IFaxAccount*, Win32cr::Devices::Fax::FAX_ACCOUNT_EVENTS_TYPE_ENUM, Win32cr::Foundation::HRESULT),
    get_RegisteredEvents : Proc(IFaxAccount*, Win32cr::Devices::Fax::FAX_ACCOUNT_EVENTS_TYPE_ENUM*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("68535b33-5dc4-4086-be26-b76f9b711006")]
  record IFaxAccount, lpVtbl : IFaxAccountVtbl* do
    GUID = LibC::GUID.new(0x68535b33_u32, 0x5dc4_u16, 0x4086_u16, StaticArray[0xbe_u8, 0x26_u8, 0xb7_u8, 0x6f_u8, 0x9b_u8, 0x71_u8, 0x10_u8, 0x6_u8])
    def query_interface(this : IFaxAccount*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxAccount*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxAccount*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxAccount*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxAccount*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxAccount*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxAccount*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_AccountName(this : IFaxAccount*, pbstrAccountName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AccountName.call(this, pbstrAccountName)
    end
    def get_Folders(this : IFaxAccount*, ppFolders : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Folders.call(this, ppFolders)
    end
    def listen_to_account_events(this : IFaxAccount*, event_types : Win32cr::Devices::Fax::FAX_ACCOUNT_EVENTS_TYPE_ENUM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.listen_to_account_events.call(this, event_types)
    end
    def get_RegisteredEvents(this : IFaxAccount*, pRegisteredEvents : Win32cr::Devices::Fax::FAX_ACCOUNT_EVENTS_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RegisteredEvents.call(this, pRegisteredEvents)
    end

  end

  @[Extern]
  record IFaxOutgoingJob2Vtbl,
    query_interface : Proc(IFaxOutgoingJob2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxOutgoingJob2*, UInt32),
    release : Proc(IFaxOutgoingJob2*, UInt32),
    get_type_info_count : Proc(IFaxOutgoingJob2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxOutgoingJob2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxOutgoingJob2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxOutgoingJob2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Subject : Proc(IFaxOutgoingJob2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DocumentName : Proc(IFaxOutgoingJob2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Pages : Proc(IFaxOutgoingJob2*, Int32*, Win32cr::Foundation::HRESULT),
    get_Size : Proc(IFaxOutgoingJob2*, Int32*, Win32cr::Foundation::HRESULT),
    get_SubmissionId : Proc(IFaxOutgoingJob2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFaxOutgoingJob2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_OriginalScheduledTime : Proc(IFaxOutgoingJob2*, Float64*, Win32cr::Foundation::HRESULT),
    get_SubmissionTime : Proc(IFaxOutgoingJob2*, Float64*, Win32cr::Foundation::HRESULT),
    get_ReceiptType : Proc(IFaxOutgoingJob2*, Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    get_Priority : Proc(IFaxOutgoingJob2*, Win32cr::Devices::Fax::FAX_PRIORITY_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    get_Sender : Proc(IFaxOutgoingJob2*, Void**, Win32cr::Foundation::HRESULT),
    get_Recipient : Proc(IFaxOutgoingJob2*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentPage : Proc(IFaxOutgoingJob2*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceId : Proc(IFaxOutgoingJob2*, Int32*, Win32cr::Foundation::HRESULT),
    get_Status : Proc(IFaxOutgoingJob2*, Win32cr::Devices::Fax::FAX_JOB_STATUS_ENUM*, Win32cr::Foundation::HRESULT),
    get_ExtendedStatusCode : Proc(IFaxOutgoingJob2*, Win32cr::Devices::Fax::FAX_JOB_EXTENDED_STATUS_ENUM*, Win32cr::Foundation::HRESULT),
    get_ExtendedStatus : Proc(IFaxOutgoingJob2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AvailableOperations : Proc(IFaxOutgoingJob2*, Win32cr::Devices::Fax::FAX_JOB_OPERATIONS_ENUM*, Win32cr::Foundation::HRESULT),
    get_Retries : Proc(IFaxOutgoingJob2*, Int32*, Win32cr::Foundation::HRESULT),
    get_ScheduledTime : Proc(IFaxOutgoingJob2*, Float64*, Win32cr::Foundation::HRESULT),
    get_TransmissionStart : Proc(IFaxOutgoingJob2*, Float64*, Win32cr::Foundation::HRESULT),
    get_TransmissionEnd : Proc(IFaxOutgoingJob2*, Float64*, Win32cr::Foundation::HRESULT),
    get_CSID : Proc(IFaxOutgoingJob2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TSID : Proc(IFaxOutgoingJob2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_GroupBroadcastReceipts : Proc(IFaxOutgoingJob2*, Int16*, Win32cr::Foundation::HRESULT),
    pause : Proc(IFaxOutgoingJob2*, Win32cr::Foundation::HRESULT),
    resume : Proc(IFaxOutgoingJob2*, Win32cr::Foundation::HRESULT),
    restart : Proc(IFaxOutgoingJob2*, Win32cr::Foundation::HRESULT),
    copy_tiff : Proc(IFaxOutgoingJob2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxOutgoingJob2*, Win32cr::Foundation::HRESULT),
    cancel : Proc(IFaxOutgoingJob2*, Win32cr::Foundation::HRESULT),
    get_HasCoverPage : Proc(IFaxOutgoingJob2*, Int16*, Win32cr::Foundation::HRESULT),
    get_ReceiptAddress : Proc(IFaxOutgoingJob2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ScheduleType : Proc(IFaxOutgoingJob2*, Win32cr::Devices::Fax::FAX_SCHEDULE_TYPE_ENUM*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("418a8d96-59a0-4789-b176-edf3dc8fa8f7")]
  record IFaxOutgoingJob2, lpVtbl : IFaxOutgoingJob2Vtbl* do
    GUID = LibC::GUID.new(0x418a8d96_u32, 0x59a0_u16, 0x4789_u16, StaticArray[0xb1_u8, 0x76_u8, 0xed_u8, 0xf3_u8, 0xdc_u8, 0x8f_u8, 0xa8_u8, 0xf7_u8])
    def query_interface(this : IFaxOutgoingJob2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxOutgoingJob2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxOutgoingJob2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxOutgoingJob2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxOutgoingJob2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxOutgoingJob2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxOutgoingJob2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Subject(this : IFaxOutgoingJob2*, pbstrSubject : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Subject.call(this, pbstrSubject)
    end
    def get_DocumentName(this : IFaxOutgoingJob2*, pbstrDocumentName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DocumentName.call(this, pbstrDocumentName)
    end
    def get_Pages(this : IFaxOutgoingJob2*, plPages : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Pages.call(this, plPages)
    end
    def get_Size(this : IFaxOutgoingJob2*, plSize : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Size.call(this, plSize)
    end
    def get_SubmissionId(this : IFaxOutgoingJob2*, pbstrSubmissionId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubmissionId.call(this, pbstrSubmissionId)
    end
    def get_Id(this : IFaxOutgoingJob2*, pbstrId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pbstrId)
    end
    def get_OriginalScheduledTime(this : IFaxOutgoingJob2*, pdateOriginalScheduledTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OriginalScheduledTime.call(this, pdateOriginalScheduledTime)
    end
    def get_SubmissionTime(this : IFaxOutgoingJob2*, pdateSubmissionTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubmissionTime.call(this, pdateSubmissionTime)
    end
    def get_ReceiptType(this : IFaxOutgoingJob2*, pReceiptType : Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReceiptType.call(this, pReceiptType)
    end
    def get_Priority(this : IFaxOutgoingJob2*, pPriority : Win32cr::Devices::Fax::FAX_PRIORITY_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Priority.call(this, pPriority)
    end
    def get_Sender(this : IFaxOutgoingJob2*, ppFaxSender : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Sender.call(this, ppFaxSender)
    end
    def get_Recipient(this : IFaxOutgoingJob2*, ppFaxRecipient : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Recipient.call(this, ppFaxRecipient)
    end
    def get_CurrentPage(this : IFaxOutgoingJob2*, plCurrentPage : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentPage.call(this, plCurrentPage)
    end
    def get_DeviceId(this : IFaxOutgoingJob2*, plDeviceId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceId.call(this, plDeviceId)
    end
    def get_Status(this : IFaxOutgoingJob2*, pStatus : Win32cr::Devices::Fax::FAX_JOB_STATUS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Status.call(this, pStatus)
    end
    def get_ExtendedStatusCode(this : IFaxOutgoingJob2*, pExtendedStatusCode : Win32cr::Devices::Fax::FAX_JOB_EXTENDED_STATUS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtendedStatusCode.call(this, pExtendedStatusCode)
    end
    def get_ExtendedStatus(this : IFaxOutgoingJob2*, pbstrExtendedStatus : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtendedStatus.call(this, pbstrExtendedStatus)
    end
    def get_AvailableOperations(this : IFaxOutgoingJob2*, pAvailableOperations : Win32cr::Devices::Fax::FAX_JOB_OPERATIONS_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AvailableOperations.call(this, pAvailableOperations)
    end
    def get_Retries(this : IFaxOutgoingJob2*, plRetries : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Retries.call(this, plRetries)
    end
    def get_ScheduledTime(this : IFaxOutgoingJob2*, pdateScheduledTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScheduledTime.call(this, pdateScheduledTime)
    end
    def get_TransmissionStart(this : IFaxOutgoingJob2*, pdateTransmissionStart : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionStart.call(this, pdateTransmissionStart)
    end
    def get_TransmissionEnd(this : IFaxOutgoingJob2*, pdateTransmissionEnd : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionEnd.call(this, pdateTransmissionEnd)
    end
    def get_CSID(this : IFaxOutgoingJob2*, pbstrCSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CSID.call(this, pbstrCSID)
    end
    def get_TSID(this : IFaxOutgoingJob2*, pbstrTSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TSID.call(this, pbstrTSID)
    end
    def get_GroupBroadcastReceipts(this : IFaxOutgoingJob2*, pbGroupBroadcastReceipts : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GroupBroadcastReceipts.call(this, pbGroupBroadcastReceipts)
    end
    def pause(this : IFaxOutgoingJob2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pause.call(this)
    end
    def resume(this : IFaxOutgoingJob2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume.call(this)
    end
    def restart(this : IFaxOutgoingJob2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restart.call(this)
    end
    def copy_tiff(this : IFaxOutgoingJob2*, bstrTiffPath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_tiff.call(this, bstrTiffPath)
    end
    def refresh(this : IFaxOutgoingJob2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def cancel(this : IFaxOutgoingJob2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end
    def get_HasCoverPage(this : IFaxOutgoingJob2*, pbHasCoverPage : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HasCoverPage.call(this, pbHasCoverPage)
    end
    def get_ReceiptAddress(this : IFaxOutgoingJob2*, pbstrReceiptAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReceiptAddress.call(this, pbstrReceiptAddress)
    end
    def get_ScheduleType(this : IFaxOutgoingJob2*, pScheduleType : Win32cr::Devices::Fax::FAX_SCHEDULE_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ScheduleType.call(this, pScheduleType)
    end

  end

  @[Extern]
  record IFaxAccountFoldersVtbl,
    query_interface : Proc(IFaxAccountFolders*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxAccountFolders*, UInt32),
    release : Proc(IFaxAccountFolders*, UInt32),
    get_type_info_count : Proc(IFaxAccountFolders*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxAccountFolders*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxAccountFolders*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxAccountFolders*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_OutgoingQueue : Proc(IFaxAccountFolders*, Void**, Win32cr::Foundation::HRESULT),
    get_IncomingQueue : Proc(IFaxAccountFolders*, Void**, Win32cr::Foundation::HRESULT),
    get_IncomingArchive : Proc(IFaxAccountFolders*, Void**, Win32cr::Foundation::HRESULT),
    get_OutgoingArchive : Proc(IFaxAccountFolders*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6463f89d-23d8-46a9-8f86-c47b77ca7926")]
  record IFaxAccountFolders, lpVtbl : IFaxAccountFoldersVtbl* do
    GUID = LibC::GUID.new(0x6463f89d_u32, 0x23d8_u16, 0x46a9_u16, StaticArray[0x8f_u8, 0x86_u8, 0xc4_u8, 0x7b_u8, 0x77_u8, 0xca_u8, 0x79_u8, 0x26_u8])
    def query_interface(this : IFaxAccountFolders*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxAccountFolders*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxAccountFolders*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxAccountFolders*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxAccountFolders*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxAccountFolders*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxAccountFolders*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_OutgoingQueue(this : IFaxAccountFolders*, pFaxOutgoingQueue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutgoingQueue.call(this, pFaxOutgoingQueue)
    end
    def get_IncomingQueue(this : IFaxAccountFolders*, pFaxIncomingQueue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IncomingQueue.call(this, pFaxIncomingQueue)
    end
    def get_IncomingArchive(this : IFaxAccountFolders*, pFaxIncomingArchive : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IncomingArchive.call(this, pFaxIncomingArchive)
    end
    def get_OutgoingArchive(this : IFaxAccountFolders*, pFaxOutgoingArchive : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OutgoingArchive.call(this, pFaxOutgoingArchive)
    end

  end

  @[Extern]
  record IFaxAccountIncomingQueueVtbl,
    query_interface : Proc(IFaxAccountIncomingQueue*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxAccountIncomingQueue*, UInt32),
    release : Proc(IFaxAccountIncomingQueue*, UInt32),
    get_type_info_count : Proc(IFaxAccountIncomingQueue*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxAccountIncomingQueue*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxAccountIncomingQueue*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxAccountIncomingQueue*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_jobs : Proc(IFaxAccountIncomingQueue*, Void**, Win32cr::Foundation::HRESULT),
    get_job : Proc(IFaxAccountIncomingQueue*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dd142d92-0186-4a95-a090-cbc3eadba6b4")]
  record IFaxAccountIncomingQueue, lpVtbl : IFaxAccountIncomingQueueVtbl* do
    GUID = LibC::GUID.new(0xdd142d92_u32, 0x186_u16, 0x4a95_u16, StaticArray[0xa0_u8, 0x90_u8, 0xcb_u8, 0xc3_u8, 0xea_u8, 0xdb_u8, 0xa6_u8, 0xb4_u8])
    def query_interface(this : IFaxAccountIncomingQueue*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxAccountIncomingQueue*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxAccountIncomingQueue*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxAccountIncomingQueue*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxAccountIncomingQueue*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxAccountIncomingQueue*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxAccountIncomingQueue*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_jobs(this : IFaxAccountIncomingQueue*, pFaxIncomingJobs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_jobs.call(this, pFaxIncomingJobs)
    end
    def get_job(this : IFaxAccountIncomingQueue*, bstrJobId : Win32cr::Foundation::BSTR, pFaxIncomingJob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_job.call(this, bstrJobId, pFaxIncomingJob)
    end

  end

  @[Extern]
  record IFaxAccountOutgoingQueueVtbl,
    query_interface : Proc(IFaxAccountOutgoingQueue*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxAccountOutgoingQueue*, UInt32),
    release : Proc(IFaxAccountOutgoingQueue*, UInt32),
    get_type_info_count : Proc(IFaxAccountOutgoingQueue*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxAccountOutgoingQueue*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxAccountOutgoingQueue*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxAccountOutgoingQueue*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_jobs : Proc(IFaxAccountOutgoingQueue*, Void**, Win32cr::Foundation::HRESULT),
    get_job : Proc(IFaxAccountOutgoingQueue*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0f1424e9-f22d-4553-b7a5-0d24bd0d7e46")]
  record IFaxAccountOutgoingQueue, lpVtbl : IFaxAccountOutgoingQueueVtbl* do
    GUID = LibC::GUID.new(0xf1424e9_u32, 0xf22d_u16, 0x4553_u16, StaticArray[0xb7_u8, 0xa5_u8, 0xd_u8, 0x24_u8, 0xbd_u8, 0xd_u8, 0x7e_u8, 0x46_u8])
    def query_interface(this : IFaxAccountOutgoingQueue*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxAccountOutgoingQueue*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxAccountOutgoingQueue*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxAccountOutgoingQueue*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxAccountOutgoingQueue*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxAccountOutgoingQueue*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxAccountOutgoingQueue*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_jobs(this : IFaxAccountOutgoingQueue*, pFaxOutgoingJobs : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_jobs.call(this, pFaxOutgoingJobs)
    end
    def get_job(this : IFaxAccountOutgoingQueue*, bstrJobId : Win32cr::Foundation::BSTR, pFaxOutgoingJob : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_job.call(this, bstrJobId, pFaxOutgoingJob)
    end

  end

  @[Extern]
  record IFaxOutgoingMessage2Vtbl,
    query_interface : Proc(IFaxOutgoingMessage2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxOutgoingMessage2*, UInt32),
    release : Proc(IFaxOutgoingMessage2*, UInt32),
    get_type_info_count : Proc(IFaxOutgoingMessage2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxOutgoingMessage2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxOutgoingMessage2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxOutgoingMessage2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_SubmissionId : Proc(IFaxOutgoingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFaxOutgoingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Subject : Proc(IFaxOutgoingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DocumentName : Proc(IFaxOutgoingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Retries : Proc(IFaxOutgoingMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    get_Pages : Proc(IFaxOutgoingMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    get_Size : Proc(IFaxOutgoingMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    get_OriginalScheduledTime : Proc(IFaxOutgoingMessage2*, Float64*, Win32cr::Foundation::HRESULT),
    get_SubmissionTime : Proc(IFaxOutgoingMessage2*, Float64*, Win32cr::Foundation::HRESULT),
    get_Priority : Proc(IFaxOutgoingMessage2*, Win32cr::Devices::Fax::FAX_PRIORITY_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    get_Sender : Proc(IFaxOutgoingMessage2*, Void**, Win32cr::Foundation::HRESULT),
    get_Recipient : Proc(IFaxOutgoingMessage2*, Void**, Win32cr::Foundation::HRESULT),
    get_DeviceName : Proc(IFaxOutgoingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TransmissionStart : Proc(IFaxOutgoingMessage2*, Float64*, Win32cr::Foundation::HRESULT),
    get_TransmissionEnd : Proc(IFaxOutgoingMessage2*, Float64*, Win32cr::Foundation::HRESULT),
    get_CSID : Proc(IFaxOutgoingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TSID : Proc(IFaxOutgoingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    copy_tiff : Proc(IFaxOutgoingMessage2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFaxOutgoingMessage2*, Win32cr::Foundation::HRESULT),
    get_HasCoverPage : Proc(IFaxOutgoingMessage2*, Int16*, Win32cr::Foundation::HRESULT),
    get_ReceiptType : Proc(IFaxOutgoingMessage2*, Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM*, Win32cr::Foundation::HRESULT),
    get_ReceiptAddress : Proc(IFaxOutgoingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Read : Proc(IFaxOutgoingMessage2*, Int16*, Win32cr::Foundation::HRESULT),
    put_Read : Proc(IFaxOutgoingMessage2*, Int16, Win32cr::Foundation::HRESULT),
    save : Proc(IFaxOutgoingMessage2*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxOutgoingMessage2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b37df687-bc88-4b46-b3be-b458b3ea9e7f")]
  record IFaxOutgoingMessage2, lpVtbl : IFaxOutgoingMessage2Vtbl* do
    GUID = LibC::GUID.new(0xb37df687_u32, 0xbc88_u16, 0x4b46_u16, StaticArray[0xb3_u8, 0xbe_u8, 0xb4_u8, 0x58_u8, 0xb3_u8, 0xea_u8, 0x9e_u8, 0x7f_u8])
    def query_interface(this : IFaxOutgoingMessage2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxOutgoingMessage2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxOutgoingMessage2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxOutgoingMessage2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxOutgoingMessage2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxOutgoingMessage2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxOutgoingMessage2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_SubmissionId(this : IFaxOutgoingMessage2*, pbstrSubmissionId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubmissionId.call(this, pbstrSubmissionId)
    end
    def get_Id(this : IFaxOutgoingMessage2*, pbstrId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pbstrId)
    end
    def get_Subject(this : IFaxOutgoingMessage2*, pbstrSubject : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Subject.call(this, pbstrSubject)
    end
    def get_DocumentName(this : IFaxOutgoingMessage2*, pbstrDocumentName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DocumentName.call(this, pbstrDocumentName)
    end
    def get_Retries(this : IFaxOutgoingMessage2*, plRetries : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Retries.call(this, plRetries)
    end
    def get_Pages(this : IFaxOutgoingMessage2*, plPages : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Pages.call(this, plPages)
    end
    def get_Size(this : IFaxOutgoingMessage2*, plSize : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Size.call(this, plSize)
    end
    def get_OriginalScheduledTime(this : IFaxOutgoingMessage2*, pdateOriginalScheduledTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OriginalScheduledTime.call(this, pdateOriginalScheduledTime)
    end
    def get_SubmissionTime(this : IFaxOutgoingMessage2*, pdateSubmissionTime : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubmissionTime.call(this, pdateSubmissionTime)
    end
    def get_Priority(this : IFaxOutgoingMessage2*, pPriority : Win32cr::Devices::Fax::FAX_PRIORITY_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Priority.call(this, pPriority)
    end
    def get_Sender(this : IFaxOutgoingMessage2*, ppFaxSender : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Sender.call(this, ppFaxSender)
    end
    def get_Recipient(this : IFaxOutgoingMessage2*, ppFaxRecipient : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Recipient.call(this, ppFaxRecipient)
    end
    def get_DeviceName(this : IFaxOutgoingMessage2*, pbstrDeviceName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceName.call(this, pbstrDeviceName)
    end
    def get_TransmissionStart(this : IFaxOutgoingMessage2*, pdateTransmissionStart : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionStart.call(this, pdateTransmissionStart)
    end
    def get_TransmissionEnd(this : IFaxOutgoingMessage2*, pdateTransmissionEnd : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionEnd.call(this, pdateTransmissionEnd)
    end
    def get_CSID(this : IFaxOutgoingMessage2*, pbstrCSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CSID.call(this, pbstrCSID)
    end
    def get_TSID(this : IFaxOutgoingMessage2*, pbstrTSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TSID.call(this, pbstrTSID)
    end
    def copy_tiff(this : IFaxOutgoingMessage2*, bstrTiffPath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_tiff.call(this, bstrTiffPath)
    end
    def delete(this : IFaxOutgoingMessage2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def get_HasCoverPage(this : IFaxOutgoingMessage2*, pbHasCoverPage : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HasCoverPage.call(this, pbHasCoverPage)
    end
    def get_ReceiptType(this : IFaxOutgoingMessage2*, pReceiptType : Win32cr::Devices::Fax::FAX_RECEIPT_TYPE_ENUM*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReceiptType.call(this, pReceiptType)
    end
    def get_ReceiptAddress(this : IFaxOutgoingMessage2*, pbstrReceiptAddress : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReceiptAddress.call(this, pbstrReceiptAddress)
    end
    def get_Read(this : IFaxOutgoingMessage2*, pbRead : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Read.call(this, pbRead)
    end
    def put_Read(this : IFaxOutgoingMessage2*, bRead : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Read.call(this, bRead)
    end
    def save(this : IFaxOutgoingMessage2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def refresh(this : IFaxOutgoingMessage2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end

  end

  @[Extern]
  record IFaxAccountIncomingArchiveVtbl,
    query_interface : Proc(IFaxAccountIncomingArchive*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxAccountIncomingArchive*, UInt32),
    release : Proc(IFaxAccountIncomingArchive*, UInt32),
    get_type_info_count : Proc(IFaxAccountIncomingArchive*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxAccountIncomingArchive*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxAccountIncomingArchive*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxAccountIncomingArchive*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_SizeLow : Proc(IFaxAccountIncomingArchive*, Int32*, Win32cr::Foundation::HRESULT),
    get_SizeHigh : Proc(IFaxAccountIncomingArchive*, Int32*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxAccountIncomingArchive*, Win32cr::Foundation::HRESULT),
    get_messages : Proc(IFaxAccountIncomingArchive*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_message : Proc(IFaxAccountIncomingArchive*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a8a5b6ef-e0d6-4aee-955c-91625bec9db4")]
  record IFaxAccountIncomingArchive, lpVtbl : IFaxAccountIncomingArchiveVtbl* do
    GUID = LibC::GUID.new(0xa8a5b6ef_u32, 0xe0d6_u16, 0x4aee_u16, StaticArray[0x95_u8, 0x5c_u8, 0x91_u8, 0x62_u8, 0x5b_u8, 0xec_u8, 0x9d_u8, 0xb4_u8])
    def query_interface(this : IFaxAccountIncomingArchive*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxAccountIncomingArchive*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxAccountIncomingArchive*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxAccountIncomingArchive*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxAccountIncomingArchive*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxAccountIncomingArchive*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxAccountIncomingArchive*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_SizeLow(this : IFaxAccountIncomingArchive*, plSizeLow : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SizeLow.call(this, plSizeLow)
    end
    def get_SizeHigh(this : IFaxAccountIncomingArchive*, plSizeHigh : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SizeHigh.call(this, plSizeHigh)
    end
    def refresh(this : IFaxAccountIncomingArchive*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_messages(this : IFaxAccountIncomingArchive*, lPrefetchSize : Int32, pFaxIncomingMessageIterator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_messages.call(this, lPrefetchSize, pFaxIncomingMessageIterator)
    end
    def get_message(this : IFaxAccountIncomingArchive*, bstrMessageId : Win32cr::Foundation::BSTR, pFaxIncomingMessage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_message.call(this, bstrMessageId, pFaxIncomingMessage)
    end

  end

  @[Extern]
  record IFaxAccountOutgoingArchiveVtbl,
    query_interface : Proc(IFaxAccountOutgoingArchive*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxAccountOutgoingArchive*, UInt32),
    release : Proc(IFaxAccountOutgoingArchive*, UInt32),
    get_type_info_count : Proc(IFaxAccountOutgoingArchive*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxAccountOutgoingArchive*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxAccountOutgoingArchive*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxAccountOutgoingArchive*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_SizeLow : Proc(IFaxAccountOutgoingArchive*, Int32*, Win32cr::Foundation::HRESULT),
    get_SizeHigh : Proc(IFaxAccountOutgoingArchive*, Int32*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxAccountOutgoingArchive*, Win32cr::Foundation::HRESULT),
    get_messages : Proc(IFaxAccountOutgoingArchive*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_message : Proc(IFaxAccountOutgoingArchive*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5463076d-ec14-491f-926e-b3ceda5e5662")]
  record IFaxAccountOutgoingArchive, lpVtbl : IFaxAccountOutgoingArchiveVtbl* do
    GUID = LibC::GUID.new(0x5463076d_u32, 0xec14_u16, 0x491f_u16, StaticArray[0x92_u8, 0x6e_u8, 0xb3_u8, 0xce_u8, 0xda_u8, 0x5e_u8, 0x56_u8, 0x62_u8])
    def query_interface(this : IFaxAccountOutgoingArchive*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxAccountOutgoingArchive*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxAccountOutgoingArchive*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxAccountOutgoingArchive*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxAccountOutgoingArchive*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxAccountOutgoingArchive*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxAccountOutgoingArchive*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_SizeLow(this : IFaxAccountOutgoingArchive*, plSizeLow : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SizeLow.call(this, plSizeLow)
    end
    def get_SizeHigh(this : IFaxAccountOutgoingArchive*, plSizeHigh : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SizeHigh.call(this, plSizeHigh)
    end
    def refresh(this : IFaxAccountOutgoingArchive*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def get_messages(this : IFaxAccountOutgoingArchive*, lPrefetchSize : Int32, pFaxOutgoingMessageIterator : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_messages.call(this, lPrefetchSize, pFaxOutgoingMessageIterator)
    end
    def get_message(this : IFaxAccountOutgoingArchive*, bstrMessageId : Win32cr::Foundation::BSTR, pFaxOutgoingMessage : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_message.call(this, bstrMessageId, pFaxOutgoingMessage)
    end

  end

  @[Extern]
  record IFaxSecurity2Vtbl,
    query_interface : Proc(IFaxSecurity2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxSecurity2*, UInt32),
    release : Proc(IFaxSecurity2*, UInt32),
    get_type_info_count : Proc(IFaxSecurity2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxSecurity2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxSecurity2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxSecurity2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Descriptor : Proc(IFaxSecurity2*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Descriptor : Proc(IFaxSecurity2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    get_GrantedRights : Proc(IFaxSecurity2*, Win32cr::Devices::Fax::FAX_ACCESS_RIGHTS_ENUM_2*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxSecurity2*, Win32cr::Foundation::HRESULT),
    save : Proc(IFaxSecurity2*, Win32cr::Foundation::HRESULT),
    get_InformationType : Proc(IFaxSecurity2*, Int32*, Win32cr::Foundation::HRESULT),
    put_InformationType : Proc(IFaxSecurity2*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("17d851f4-d09b-48fc-99c9-8f24c4db9ab1")]
  record IFaxSecurity2, lpVtbl : IFaxSecurity2Vtbl* do
    GUID = LibC::GUID.new(0x17d851f4_u32, 0xd09b_u16, 0x48fc_u16, StaticArray[0x99_u8, 0xc9_u8, 0x8f_u8, 0x24_u8, 0xc4_u8, 0xdb_u8, 0x9a_u8, 0xb1_u8])
    def query_interface(this : IFaxSecurity2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxSecurity2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxSecurity2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxSecurity2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxSecurity2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxSecurity2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxSecurity2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Descriptor(this : IFaxSecurity2*, pvDescriptor : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Descriptor.call(this, pvDescriptor)
    end
    def put_Descriptor(this : IFaxSecurity2*, vDescriptor : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Descriptor.call(this, vDescriptor)
    end
    def get_GrantedRights(this : IFaxSecurity2*, pGrantedRights : Win32cr::Devices::Fax::FAX_ACCESS_RIGHTS_ENUM_2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GrantedRights.call(this, pGrantedRights)
    end
    def refresh(this : IFaxSecurity2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end
    def save(this : IFaxSecurity2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def get_InformationType(this : IFaxSecurity2*, plInformationType : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InformationType.call(this, plInformationType)
    end
    def put_InformationType(this : IFaxSecurity2*, lInformationType : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InformationType.call(this, lInformationType)
    end

  end

  @[Extern]
  record IFaxIncomingMessage2Vtbl,
    query_interface : Proc(IFaxIncomingMessage2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxIncomingMessage2*, UInt32),
    release : Proc(IFaxIncomingMessage2*, UInt32),
    get_type_info_count : Proc(IFaxIncomingMessage2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxIncomingMessage2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxIncomingMessage2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxIncomingMessage2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Pages : Proc(IFaxIncomingMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    get_Size : Proc(IFaxIncomingMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    get_DeviceName : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Retries : Proc(IFaxIncomingMessage2*, Int32*, Win32cr::Foundation::HRESULT),
    get_TransmissionStart : Proc(IFaxIncomingMessage2*, Float64*, Win32cr::Foundation::HRESULT),
    get_TransmissionEnd : Proc(IFaxIncomingMessage2*, Float64*, Win32cr::Foundation::HRESULT),
    get_CSID : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_TSID : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CallerId : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_RoutingInformation : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    copy_tiff : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    delete : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::HRESULT),
    get_Subject : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Subject : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SenderName : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SenderName : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SenderFaxNumber : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SenderFaxNumber : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_HasCoverPage : Proc(IFaxIncomingMessage2*, Int16*, Win32cr::Foundation::HRESULT),
    put_HasCoverPage : Proc(IFaxIncomingMessage2*, Int16, Win32cr::Foundation::HRESULT),
    get_Recipients : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Recipients : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_WasReAssigned : Proc(IFaxIncomingMessage2*, Int16*, Win32cr::Foundation::HRESULT),
    get_Read : Proc(IFaxIncomingMessage2*, Int16*, Win32cr::Foundation::HRESULT),
    put_Read : Proc(IFaxIncomingMessage2*, Int16, Win32cr::Foundation::HRESULT),
    re_assign : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::HRESULT),
    save : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::HRESULT),
    refresh : Proc(IFaxIncomingMessage2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f9208503-e2bc-48f3-9ec0-e6236f9b509a")]
  record IFaxIncomingMessage2, lpVtbl : IFaxIncomingMessage2Vtbl* do
    GUID = LibC::GUID.new(0xf9208503_u32, 0xe2bc_u16, 0x48f3_u16, StaticArray[0x9e_u8, 0xc0_u8, 0xe6_u8, 0x23_u8, 0x6f_u8, 0x9b_u8, 0x50_u8, 0x9a_u8])
    def query_interface(this : IFaxIncomingMessage2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxIncomingMessage2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxIncomingMessage2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxIncomingMessage2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxIncomingMessage2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxIncomingMessage2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxIncomingMessage2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Id(this : IFaxIncomingMessage2*, pbstrId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, pbstrId)
    end
    def get_Pages(this : IFaxIncomingMessage2*, plPages : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Pages.call(this, plPages)
    end
    def get_Size(this : IFaxIncomingMessage2*, plSize : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Size.call(this, plSize)
    end
    def get_DeviceName(this : IFaxIncomingMessage2*, pbstrDeviceName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceName.call(this, pbstrDeviceName)
    end
    def get_Retries(this : IFaxIncomingMessage2*, plRetries : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Retries.call(this, plRetries)
    end
    def get_TransmissionStart(this : IFaxIncomingMessage2*, pdateTransmissionStart : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionStart.call(this, pdateTransmissionStart)
    end
    def get_TransmissionEnd(this : IFaxIncomingMessage2*, pdateTransmissionEnd : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransmissionEnd.call(this, pdateTransmissionEnd)
    end
    def get_CSID(this : IFaxIncomingMessage2*, pbstrCSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CSID.call(this, pbstrCSID)
    end
    def get_TSID(this : IFaxIncomingMessage2*, pbstrTSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TSID.call(this, pbstrTSID)
    end
    def get_CallerId(this : IFaxIncomingMessage2*, pbstrCallerId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CallerId.call(this, pbstrCallerId)
    end
    def get_RoutingInformation(this : IFaxIncomingMessage2*, pbstrRoutingInformation : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RoutingInformation.call(this, pbstrRoutingInformation)
    end
    def copy_tiff(this : IFaxIncomingMessage2*, bstrTiffPath : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.copy_tiff.call(this, bstrTiffPath)
    end
    def delete(this : IFaxIncomingMessage2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def get_Subject(this : IFaxIncomingMessage2*, pbstrSubject : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Subject.call(this, pbstrSubject)
    end
    def put_Subject(this : IFaxIncomingMessage2*, bstrSubject : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Subject.call(this, bstrSubject)
    end
    def get_SenderName(this : IFaxIncomingMessage2*, pbstrSenderName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderName.call(this, pbstrSenderName)
    end
    def put_SenderName(this : IFaxIncomingMessage2*, bstrSenderName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SenderName.call(this, bstrSenderName)
    end
    def get_SenderFaxNumber(this : IFaxIncomingMessage2*, pbstrSenderFaxNumber : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SenderFaxNumber.call(this, pbstrSenderFaxNumber)
    end
    def put_SenderFaxNumber(this : IFaxIncomingMessage2*, bstrSenderFaxNumber : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SenderFaxNumber.call(this, bstrSenderFaxNumber)
    end
    def get_HasCoverPage(this : IFaxIncomingMessage2*, pbHasCoverPage : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HasCoverPage.call(this, pbHasCoverPage)
    end
    def put_HasCoverPage(this : IFaxIncomingMessage2*, bHasCoverPage : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_HasCoverPage.call(this, bHasCoverPage)
    end
    def get_Recipients(this : IFaxIncomingMessage2*, pbstrRecipients : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Recipients.call(this, pbstrRecipients)
    end
    def put_Recipients(this : IFaxIncomingMessage2*, bstrRecipients : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Recipients.call(this, bstrRecipients)
    end
    def get_WasReAssigned(this : IFaxIncomingMessage2*, pbWasReAssigned : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WasReAssigned.call(this, pbWasReAssigned)
    end
    def get_Read(this : IFaxIncomingMessage2*, pbRead : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Read.call(this, pbRead)
    end
    def put_Read(this : IFaxIncomingMessage2*, bRead : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Read.call(this, bRead)
    end
    def re_assign(this : IFaxIncomingMessage2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.re_assign.call(this)
    end
    def save(this : IFaxIncomingMessage2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def refresh(this : IFaxIncomingMessage2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh.call(this)
    end

  end

  @[Extern]
  record IFaxServerNotifyVtbl,
    query_interface : Proc(IFaxServerNotify*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxServerNotify*, UInt32),
    release : Proc(IFaxServerNotify*, UInt32),
    get_type_info_count : Proc(IFaxServerNotify*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxServerNotify*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxServerNotify*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxServerNotify*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2e037b27-cf8a-4abd-b1e0-5704943bea6f")]
  record IFaxServerNotify, lpVtbl : IFaxServerNotifyVtbl* do
    GUID = LibC::GUID.new(0x2e037b27_u32, 0xcf8a_u16, 0x4abd_u16, StaticArray[0xb1_u8, 0xe0_u8, 0x57_u8, 0x4_u8, 0x94_u8, 0x3b_u8, 0xea_u8, 0x6f_u8])
    def query_interface(this : IFaxServerNotify*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxServerNotify*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxServerNotify*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxServerNotify*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxServerNotify*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxServerNotify*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxServerNotify*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IFaxServerNotify2_Vtbl,
    query_interface : Proc(IFaxServerNotify2_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxServerNotify2_*, UInt32),
    release : Proc(IFaxServerNotify2_*, UInt32),
    get_type_info_count : Proc(IFaxServerNotify2_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxServerNotify2_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxServerNotify2_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxServerNotify2_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    on_incoming_job_added : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_incoming_job_removed : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_incoming_job_changed : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT),
    on_outgoing_job_added : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_outgoing_job_removed : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_outgoing_job_changed : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT),
    on_incoming_message_added : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_incoming_message_removed : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_outgoing_message_added : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_outgoing_message_removed : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_receipt_options_change : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::HRESULT),
    on_activity_logging_config_change : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::HRESULT),
    on_security_config_change : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::HRESULT),
    on_event_logging_config_change : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::HRESULT),
    on_outgoing_queue_config_change : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::HRESULT),
    on_outgoing_archive_config_change : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::HRESULT),
    on_incoming_archive_config_change : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::HRESULT),
    on_devices_config_change : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::HRESULT),
    on_outbound_routing_groups_config_change : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::HRESULT),
    on_outbound_routing_rules_config_change : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::HRESULT),
    on_server_activity_change : Proc(IFaxServerNotify2_*, Void*, Int32, Int32, Int32, Int32, Win32cr::Foundation::HRESULT),
    on_queues_status_change : Proc(IFaxServerNotify2_*, Void*, Int16, Int16, Int16, Win32cr::Foundation::HRESULT),
    on_new_call : Proc(IFaxServerNotify2_*, Void*, Int32, Int32, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_server_shut_down : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::HRESULT),
    on_device_status_change : Proc(IFaxServerNotify2_*, Void*, Int32, Int16, Int16, Int16, Int16, Win32cr::Foundation::HRESULT),
    on_general_server_config_changed : Proc(IFaxServerNotify2_*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ec9c69b9-5fe7-4805-9467-82fcd96af903")]
  record IFaxServerNotify2_, lpVtbl : IFaxServerNotify2_Vtbl* do
    GUID = LibC::GUID.new(0xec9c69b9_u32, 0x5fe7_u16, 0x4805_u16, StaticArray[0x94_u8, 0x67_u8, 0x82_u8, 0xfc_u8, 0xd9_u8, 0x6a_u8, 0xf9_u8, 0x3_u8])
    def query_interface(this : IFaxServerNotify2_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxServerNotify2_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxServerNotify2_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxServerNotify2_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxServerNotify2_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxServerNotify2_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxServerNotify2_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def on_incoming_job_added(this : IFaxServerNotify2_*, pFaxServer : Void*, bstrJobId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_incoming_job_added.call(this, pFaxServer, bstrJobId)
    end
    def on_incoming_job_removed(this : IFaxServerNotify2_*, pFaxServer : Void*, bstrJobId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_incoming_job_removed.call(this, pFaxServer, bstrJobId)
    end
    def on_incoming_job_changed(this : IFaxServerNotify2_*, pFaxServer : Void*, bstrJobId : Win32cr::Foundation::BSTR, pJobStatus : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_incoming_job_changed.call(this, pFaxServer, bstrJobId, pJobStatus)
    end
    def on_outgoing_job_added(this : IFaxServerNotify2_*, pFaxServer : Void*, bstrJobId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_outgoing_job_added.call(this, pFaxServer, bstrJobId)
    end
    def on_outgoing_job_removed(this : IFaxServerNotify2_*, pFaxServer : Void*, bstrJobId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_outgoing_job_removed.call(this, pFaxServer, bstrJobId)
    end
    def on_outgoing_job_changed(this : IFaxServerNotify2_*, pFaxServer : Void*, bstrJobId : Win32cr::Foundation::BSTR, pJobStatus : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_outgoing_job_changed.call(this, pFaxServer, bstrJobId, pJobStatus)
    end
    def on_incoming_message_added(this : IFaxServerNotify2_*, pFaxServer : Void*, bstrMessageId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_incoming_message_added.call(this, pFaxServer, bstrMessageId)
    end
    def on_incoming_message_removed(this : IFaxServerNotify2_*, pFaxServer : Void*, bstrMessageId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_incoming_message_removed.call(this, pFaxServer, bstrMessageId)
    end
    def on_outgoing_message_added(this : IFaxServerNotify2_*, pFaxServer : Void*, bstrMessageId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_outgoing_message_added.call(this, pFaxServer, bstrMessageId)
    end
    def on_outgoing_message_removed(this : IFaxServerNotify2_*, pFaxServer : Void*, bstrMessageId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_outgoing_message_removed.call(this, pFaxServer, bstrMessageId)
    end
    def on_receipt_options_change(this : IFaxServerNotify2_*, pFaxServer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_receipt_options_change.call(this, pFaxServer)
    end
    def on_activity_logging_config_change(this : IFaxServerNotify2_*, pFaxServer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_activity_logging_config_change.call(this, pFaxServer)
    end
    def on_security_config_change(this : IFaxServerNotify2_*, pFaxServer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_security_config_change.call(this, pFaxServer)
    end
    def on_event_logging_config_change(this : IFaxServerNotify2_*, pFaxServer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_event_logging_config_change.call(this, pFaxServer)
    end
    def on_outgoing_queue_config_change(this : IFaxServerNotify2_*, pFaxServer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_outgoing_queue_config_change.call(this, pFaxServer)
    end
    def on_outgoing_archive_config_change(this : IFaxServerNotify2_*, pFaxServer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_outgoing_archive_config_change.call(this, pFaxServer)
    end
    def on_incoming_archive_config_change(this : IFaxServerNotify2_*, pFaxServer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_incoming_archive_config_change.call(this, pFaxServer)
    end
    def on_devices_config_change(this : IFaxServerNotify2_*, pFaxServer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_devices_config_change.call(this, pFaxServer)
    end
    def on_outbound_routing_groups_config_change(this : IFaxServerNotify2_*, pFaxServer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_outbound_routing_groups_config_change.call(this, pFaxServer)
    end
    def on_outbound_routing_rules_config_change(this : IFaxServerNotify2_*, pFaxServer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_outbound_routing_rules_config_change.call(this, pFaxServer)
    end
    def on_server_activity_change(this : IFaxServerNotify2_*, pFaxServer : Void*, lIncomingMessages : Int32, lRoutingMessages : Int32, lOutgoingMessages : Int32, lQueuedMessages : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_server_activity_change.call(this, pFaxServer, lIncomingMessages, lRoutingMessages, lOutgoingMessages, lQueuedMessages)
    end
    def on_queues_status_change(this : IFaxServerNotify2_*, pFaxServer : Void*, bOutgoingQueueBlocked : Int16, bOutgoingQueuePaused : Int16, bIncomingQueueBlocked : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_queues_status_change.call(this, pFaxServer, bOutgoingQueueBlocked, bOutgoingQueuePaused, bIncomingQueueBlocked)
    end
    def on_new_call(this : IFaxServerNotify2_*, pFaxServer : Void*, lCallId : Int32, lDeviceId : Int32, bstrCallerId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_new_call.call(this, pFaxServer, lCallId, lDeviceId, bstrCallerId)
    end
    def on_server_shut_down(this : IFaxServerNotify2_*, pFaxServer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_server_shut_down.call(this, pFaxServer)
    end
    def on_device_status_change(this : IFaxServerNotify2_*, pFaxServer : Void*, lDeviceId : Int32, bPoweredOff : Int16, bSending : Int16, bReceiving : Int16, bRinging : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_device_status_change.call(this, pFaxServer, lDeviceId, bPoweredOff, bSending, bReceiving, bRinging)
    end
    def on_general_server_config_changed(this : IFaxServerNotify2_*, pFaxServer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_general_server_config_changed.call(this, pFaxServer)
    end

  end

  @[Extern]
  record IFaxServerNotify2Vtbl,
    query_interface : Proc(IFaxServerNotify2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxServerNotify2*, UInt32),
    release : Proc(IFaxServerNotify2*, UInt32),
    get_type_info_count : Proc(IFaxServerNotify2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxServerNotify2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxServerNotify2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxServerNotify2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("616ca8d6-a77a-4062-abfd-0e471241c7aa")]
  record IFaxServerNotify2, lpVtbl : IFaxServerNotify2Vtbl* do
    GUID = LibC::GUID.new(0x616ca8d6_u32, 0xa77a_u16, 0x4062_u16, StaticArray[0xab_u8, 0xfd_u8, 0xe_u8, 0x47_u8, 0x12_u8, 0x41_u8, 0xc7_u8, 0xaa_u8])
    def query_interface(this : IFaxServerNotify2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxServerNotify2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxServerNotify2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxServerNotify2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxServerNotify2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxServerNotify2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxServerNotify2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IFaxAccountNotify_Vtbl,
    query_interface : Proc(IFaxAccountNotify_*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxAccountNotify_*, UInt32),
    release : Proc(IFaxAccountNotify_*, UInt32),
    get_type_info_count : Proc(IFaxAccountNotify_*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxAccountNotify_*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxAccountNotify_*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxAccountNotify_*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    on_incoming_job_added : Proc(IFaxAccountNotify_*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_incoming_job_removed : Proc(IFaxAccountNotify_*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_incoming_job_changed : Proc(IFaxAccountNotify_*, Void*, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT),
    on_outgoing_job_added : Proc(IFaxAccountNotify_*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_outgoing_job_removed : Proc(IFaxAccountNotify_*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_outgoing_job_changed : Proc(IFaxAccountNotify_*, Void*, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT),
    on_incoming_message_added : Proc(IFaxAccountNotify_*, Void*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    on_incoming_message_removed : Proc(IFaxAccountNotify_*, Void*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    on_outgoing_message_added : Proc(IFaxAccountNotify_*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_outgoing_message_removed : Proc(IFaxAccountNotify_*, Void*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    on_server_shut_down : Proc(IFaxAccountNotify_*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b9b3bc81-ac1b-46f3-b39d-0adc30e1b788")]
  record IFaxAccountNotify_, lpVtbl : IFaxAccountNotify_Vtbl* do
    GUID = LibC::GUID.new(0xb9b3bc81_u32, 0xac1b_u16, 0x46f3_u16, StaticArray[0xb3_u8, 0x9d_u8, 0xa_u8, 0xdc_u8, 0x30_u8, 0xe1_u8, 0xb7_u8, 0x88_u8])
    def query_interface(this : IFaxAccountNotify_*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxAccountNotify_*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxAccountNotify_*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxAccountNotify_*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxAccountNotify_*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxAccountNotify_*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxAccountNotify_*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def on_incoming_job_added(this : IFaxAccountNotify_*, pFaxAccount : Void*, bstrJobId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_incoming_job_added.call(this, pFaxAccount, bstrJobId)
    end
    def on_incoming_job_removed(this : IFaxAccountNotify_*, pFaxAccount : Void*, bstrJobId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_incoming_job_removed.call(this, pFaxAccount, bstrJobId)
    end
    def on_incoming_job_changed(this : IFaxAccountNotify_*, pFaxAccount : Void*, bstrJobId : Win32cr::Foundation::BSTR, pJobStatus : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_incoming_job_changed.call(this, pFaxAccount, bstrJobId, pJobStatus)
    end
    def on_outgoing_job_added(this : IFaxAccountNotify_*, pFaxAccount : Void*, bstrJobId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_outgoing_job_added.call(this, pFaxAccount, bstrJobId)
    end
    def on_outgoing_job_removed(this : IFaxAccountNotify_*, pFaxAccount : Void*, bstrJobId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_outgoing_job_removed.call(this, pFaxAccount, bstrJobId)
    end
    def on_outgoing_job_changed(this : IFaxAccountNotify_*, pFaxAccount : Void*, bstrJobId : Win32cr::Foundation::BSTR, pJobStatus : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_outgoing_job_changed.call(this, pFaxAccount, bstrJobId, pJobStatus)
    end
    def on_incoming_message_added(this : IFaxAccountNotify_*, pFaxAccount : Void*, bstrMessageId : Win32cr::Foundation::BSTR, fAddedToReceiveFolder : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_incoming_message_added.call(this, pFaxAccount, bstrMessageId, fAddedToReceiveFolder)
    end
    def on_incoming_message_removed(this : IFaxAccountNotify_*, pFaxAccount : Void*, bstrMessageId : Win32cr::Foundation::BSTR, fRemovedFromReceiveFolder : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_incoming_message_removed.call(this, pFaxAccount, bstrMessageId, fRemovedFromReceiveFolder)
    end
    def on_outgoing_message_added(this : IFaxAccountNotify_*, pFaxAccount : Void*, bstrMessageId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_outgoing_message_added.call(this, pFaxAccount, bstrMessageId)
    end
    def on_outgoing_message_removed(this : IFaxAccountNotify_*, pFaxAccount : Void*, bstrMessageId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_outgoing_message_removed.call(this, pFaxAccount, bstrMessageId)
    end
    def on_server_shut_down(this : IFaxAccountNotify_*, pFaxServer : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_server_shut_down.call(this, pFaxServer)
    end

  end

  @[Extern]
  record IFaxAccountNotifyVtbl,
    query_interface : Proc(IFaxAccountNotify*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFaxAccountNotify*, UInt32),
    release : Proc(IFaxAccountNotify*, UInt32),
    get_type_info_count : Proc(IFaxAccountNotify*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFaxAccountNotify*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFaxAccountNotify*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFaxAccountNotify*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0b5e5bd1-b8a9-47a0-a323-ef4a293ba06a")]
  record IFaxAccountNotify, lpVtbl : IFaxAccountNotifyVtbl* do
    GUID = LibC::GUID.new(0xb5e5bd1_u32, 0xb8a9_u16, 0x47a0_u16, StaticArray[0xa3_u8, 0x23_u8, 0xef_u8, 0x4a_u8, 0x29_u8, 0x3b_u8, 0xa0_u8, 0x6a_u8])
    def query_interface(this : IFaxAccountNotify*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFaxAccountNotify*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFaxAccountNotify*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFaxAccountNotify*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFaxAccountNotify*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFaxAccountNotify*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFaxAccountNotify*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IStillImageWVtbl,
    query_interface : Proc(IStillImageW*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStillImageW*, UInt32),
    release : Proc(IStillImageW*, UInt32),
    initialize__ : Proc(IStillImageW*, Win32cr::Foundation::HINSTANCE, UInt32, Win32cr::Foundation::HRESULT),
    get_device_list : Proc(IStillImageW*, UInt32, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    get_device_info : Proc(IStillImageW*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    create_device : Proc(IStillImageW*, Win32cr::Foundation::PWSTR, UInt32, Void**, Void*, Win32cr::Foundation::HRESULT),
    get_device_value : Proc(IStillImageW*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32*, UInt8*, UInt32*, Win32cr::Foundation::HRESULT),
    set_device_value : Proc(IStillImageW*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt32, UInt8*, UInt32, Win32cr::Foundation::HRESULT),
    get_sti_launch_information : Proc(IStillImageW*, UInt16*, UInt32*, UInt16*, Win32cr::Foundation::HRESULT),
    register_launch_application : Proc(IStillImageW*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    unregister_launch_application : Proc(IStillImageW*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    enable_hw_notifications : Proc(IStillImageW*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_hw_notification_state : Proc(IStillImageW*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    refresh_device_bus : Proc(IStillImageW*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    launch_application_for_device : Proc(IStillImageW*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Devices::Fax::STINOTIFY*, Win32cr::Foundation::HRESULT),
    setup_device_parameters : Proc(IStillImageW*, Win32cr::Devices::Fax::STI_DEVICE_INFORMATIONW*, Win32cr::Foundation::HRESULT),
    write_to_error_log : Proc(IStillImageW*, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("641bd880-2dc8-11d0-90ea-00aa0060f86c")]
  record IStillImageW, lpVtbl : IStillImageWVtbl* do
    GUID = LibC::GUID.new(0x641bd880_u32, 0x2dc8_u16, 0x11d0_u16, StaticArray[0x90_u8, 0xea_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x60_u8, 0xf8_u8, 0x6c_u8])
    def query_interface(this : IStillImageW*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStillImageW*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStillImageW*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IStillImageW*, hinst : Win32cr::Foundation::HINSTANCE, dwVersion : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, hinst, dwVersion)
    end
    def get_device_list(this : IStillImageW*, dwType : UInt32, dwFlags : UInt32, pdwItemsReturned : UInt32*, ppBuffer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_list.call(this, dwType, dwFlags, pdwItemsReturned, ppBuffer)
    end
    def get_device_info(this : IStillImageW*, pwszDeviceName : Win32cr::Foundation::PWSTR, ppBuffer : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_info.call(this, pwszDeviceName, ppBuffer)
    end
    def create_device(this : IStillImageW*, pwszDeviceName : Win32cr::Foundation::PWSTR, dwMode : UInt32, pDevice : Void**, punkOuter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_device.call(this, pwszDeviceName, dwMode, pDevice, punkOuter)
    end
    def get_device_value(this : IStillImageW*, pwszDeviceName : Win32cr::Foundation::PWSTR, pValueName : Win32cr::Foundation::PWSTR, pType : UInt32*, pData : UInt8*, cbData : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device_value.call(this, pwszDeviceName, pValueName, pType, pData, cbData)
    end
    def set_device_value(this : IStillImageW*, pwszDeviceName : Win32cr::Foundation::PWSTR, pValueName : Win32cr::Foundation::PWSTR, type__ : UInt32, pData : UInt8*, cbData : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_device_value.call(this, pwszDeviceName, pValueName, type__, pData, cbData)
    end
    def get_sti_launch_information(this : IStillImageW*, pwszDeviceName : UInt16*, pdwEventCode : UInt32*, pwszEventName : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sti_launch_information.call(this, pwszDeviceName, pdwEventCode, pwszEventName)
    end
    def register_launch_application(this : IStillImageW*, pwszAppName : Win32cr::Foundation::PWSTR, pwszCommandLine : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_launch_application.call(this, pwszAppName, pwszCommandLine)
    end
    def unregister_launch_application(this : IStillImageW*, pwszAppName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_launch_application.call(this, pwszAppName)
    end
    def enable_hw_notifications(this : IStillImageW*, pwszDeviceName : Win32cr::Foundation::PWSTR, bNewState : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_hw_notifications.call(this, pwszDeviceName, bNewState)
    end
    def get_hw_notification_state(this : IStillImageW*, pwszDeviceName : Win32cr::Foundation::PWSTR, pbCurrentState : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_hw_notification_state.call(this, pwszDeviceName, pbCurrentState)
    end
    def refresh_device_bus(this : IStillImageW*, pwszDeviceName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.refresh_device_bus.call(this, pwszDeviceName)
    end
    def launch_application_for_device(this : IStillImageW*, pwszDeviceName : Win32cr::Foundation::PWSTR, pwszAppName : Win32cr::Foundation::PWSTR, pStiNotify : Win32cr::Devices::Fax::STINOTIFY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.launch_application_for_device.call(this, pwszDeviceName, pwszAppName, pStiNotify)
    end
    def setup_device_parameters(this : IStillImageW*, param0 : Win32cr::Devices::Fax::STI_DEVICE_INFORMATIONW*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.setup_device_parameters.call(this, param0)
    end
    def write_to_error_log(this : IStillImageW*, dwMessageType : UInt32, pszMessage : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_to_error_log.call(this, dwMessageType, pszMessage)
    end

  end

  @[Extern]
  record IStiDeviceVtbl,
    query_interface : Proc(IStiDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStiDevice*, UInt32),
    release : Proc(IStiDevice*, UInt32),
    initialize__ : Proc(IStiDevice*, Win32cr::Foundation::HINSTANCE, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    get_capabilities : Proc(IStiDevice*, Win32cr::Devices::Fax::STI_DEV_CAPS*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IStiDevice*, Win32cr::Devices::Fax::STI_DEVICE_STATUS*, Win32cr::Foundation::HRESULT),
    device_reset : Proc(IStiDevice*, Win32cr::Foundation::HRESULT),
    diagnostic : Proc(IStiDevice*, Win32cr::Devices::Fax::STI_DIAG*, Win32cr::Foundation::HRESULT),
    escape : Proc(IStiDevice*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_last_error : Proc(IStiDevice*, UInt32*, Win32cr::Foundation::HRESULT),
    lock_device : Proc(IStiDevice*, UInt32, Win32cr::Foundation::HRESULT),
    un_lock_device : Proc(IStiDevice*, Win32cr::Foundation::HRESULT),
    raw_read_data : Proc(IStiDevice*, Void*, UInt32*, Win32cr::System::IO::OVERLAPPED*, Win32cr::Foundation::HRESULT),
    raw_write_data : Proc(IStiDevice*, Void*, UInt32, Win32cr::System::IO::OVERLAPPED*, Win32cr::Foundation::HRESULT),
    raw_read_command : Proc(IStiDevice*, Void*, UInt32*, Win32cr::System::IO::OVERLAPPED*, Win32cr::Foundation::HRESULT),
    raw_write_command : Proc(IStiDevice*, Void*, UInt32, Win32cr::System::IO::OVERLAPPED*, Win32cr::Foundation::HRESULT),
    subscribe : Proc(IStiDevice*, Win32cr::Devices::Fax::STISUBSCRIBE*, Win32cr::Foundation::HRESULT),
    get_last_notification_data : Proc(IStiDevice*, Win32cr::Devices::Fax::STINOTIFY*, Win32cr::Foundation::HRESULT),
    un_subscribe : Proc(IStiDevice*, Win32cr::Foundation::HRESULT),
    get_last_error_info : Proc(IStiDevice*, Win32cr::Devices::Fax::ERROR_INFOW_*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6cfa5a80-2dc8-11d0-90ea-00aa0060f86c")]
  record IStiDevice, lpVtbl : IStiDeviceVtbl* do
    GUID = LibC::GUID.new(0x6cfa5a80_u32, 0x2dc8_u16, 0x11d0_u16, StaticArray[0x90_u8, 0xea_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x60_u8, 0xf8_u8, 0x6c_u8])
    def query_interface(this : IStiDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStiDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStiDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IStiDevice*, hinst : Win32cr::Foundation::HINSTANCE, pwszDeviceName : Win32cr::Foundation::PWSTR, dwVersion : UInt32, dwMode : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, hinst, pwszDeviceName, dwVersion, dwMode)
    end
    def get_capabilities(this : IStiDevice*, pDevCaps : Win32cr::Devices::Fax::STI_DEV_CAPS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capabilities.call(this, pDevCaps)
    end
    def get_status(this : IStiDevice*, pDevStatus : Win32cr::Devices::Fax::STI_DEVICE_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pDevStatus)
    end
    def device_reset(this : IStiDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.device_reset.call(this)
    end
    def diagnostic(this : IStiDevice*, pBuffer : Win32cr::Devices::Fax::STI_DIAG*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.diagnostic.call(this, pBuffer)
    end
    def escape(this : IStiDevice*, escape_function : UInt32, lpInData : Void*, cbInDataSize : UInt32, pOutData : Void*, dwOutDataSize : UInt32, pdwActualData : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.escape.call(this, escape_function, lpInData, cbInDataSize, pOutData, dwOutDataSize, pdwActualData)
    end
    def get_last_error(this : IStiDevice*, pdwLastDeviceError : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, pdwLastDeviceError)
    end
    def lock_device(this : IStiDevice*, dwTimeOut : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_device.call(this, dwTimeOut)
    end
    def un_lock_device(this : IStiDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.un_lock_device.call(this)
    end
    def raw_read_data(this : IStiDevice*, lpBuffer : Void*, lpdwNumberOfBytes : UInt32*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.raw_read_data.call(this, lpBuffer, lpdwNumberOfBytes, lpOverlapped)
    end
    def raw_write_data(this : IStiDevice*, lpBuffer : Void*, nNumberOfBytes : UInt32, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.raw_write_data.call(this, lpBuffer, nNumberOfBytes, lpOverlapped)
    end
    def raw_read_command(this : IStiDevice*, lpBuffer : Void*, lpdwNumberOfBytes : UInt32*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.raw_read_command.call(this, lpBuffer, lpdwNumberOfBytes, lpOverlapped)
    end
    def raw_write_command(this : IStiDevice*, lpBuffer : Void*, nNumberOfBytes : UInt32, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.raw_write_command.call(this, lpBuffer, nNumberOfBytes, lpOverlapped)
    end
    def subscribe(this : IStiDevice*, lpSubsribe : Win32cr::Devices::Fax::STISUBSCRIBE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.subscribe.call(this, lpSubsribe)
    end
    def get_last_notification_data(this : IStiDevice*, lpNotify : Win32cr::Devices::Fax::STINOTIFY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_notification_data.call(this, lpNotify)
    end
    def un_subscribe(this : IStiDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.un_subscribe.call(this)
    end
    def get_last_error_info(this : IStiDevice*, pLastErrorInfo : Win32cr::Devices::Fax::ERROR_INFOW_*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error_info.call(this, pLastErrorInfo)
    end

  end

  @[Extern]
  record IStiDeviceControlVtbl,
    query_interface : Proc(IStiDeviceControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStiDeviceControl*, UInt32),
    release : Proc(IStiDeviceControl*, UInt32),
    initialize__ : Proc(IStiDeviceControl*, UInt32, UInt32, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    raw_read_data : Proc(IStiDeviceControl*, Void*, UInt32*, Win32cr::System::IO::OVERLAPPED*, Win32cr::Foundation::HRESULT),
    raw_write_data : Proc(IStiDeviceControl*, Void*, UInt32, Win32cr::System::IO::OVERLAPPED*, Win32cr::Foundation::HRESULT),
    raw_read_command : Proc(IStiDeviceControl*, Void*, UInt32*, Win32cr::System::IO::OVERLAPPED*, Win32cr::Foundation::HRESULT),
    raw_write_command : Proc(IStiDeviceControl*, Void*, UInt32, Win32cr::System::IO::OVERLAPPED*, Win32cr::Foundation::HRESULT),
    raw_device_control : Proc(IStiDeviceControl*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_last_error : Proc(IStiDeviceControl*, UInt32*, Win32cr::Foundation::HRESULT),
    get_my_device_port_name : Proc(IStiDeviceControl*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_my_device_handle : Proc(IStiDeviceControl*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT),
    get_my_device_open_mode : Proc(IStiDeviceControl*, UInt32*, Win32cr::Foundation::HRESULT),
    write_to_error_log : Proc(IStiDeviceControl*, UInt32, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("128a9860-52dc-11d0-9edf-444553540000")]
  record IStiDeviceControl, lpVtbl : IStiDeviceControlVtbl* do
    GUID = LibC::GUID.new(0x128a9860_u32, 0x52dc_u16, 0x11d0_u16, StaticArray[0x9e_u8, 0xdf_u8, 0x44_u8, 0x45_u8, 0x53_u8, 0x54_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IStiDeviceControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStiDeviceControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStiDeviceControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IStiDeviceControl*, dwDeviceType : UInt32, dwMode : UInt32, pwszPortName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, dwDeviceType, dwMode, pwszPortName, dwFlags)
    end
    def raw_read_data(this : IStiDeviceControl*, lpBuffer : Void*, lpdwNumberOfBytes : UInt32*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.raw_read_data.call(this, lpBuffer, lpdwNumberOfBytes, lpOverlapped)
    end
    def raw_write_data(this : IStiDeviceControl*, lpBuffer : Void*, nNumberOfBytes : UInt32, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.raw_write_data.call(this, lpBuffer, nNumberOfBytes, lpOverlapped)
    end
    def raw_read_command(this : IStiDeviceControl*, lpBuffer : Void*, lpdwNumberOfBytes : UInt32*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.raw_read_command.call(this, lpBuffer, lpdwNumberOfBytes, lpOverlapped)
    end
    def raw_write_command(this : IStiDeviceControl*, lpBuffer : Void*, nNumberOfBytes : UInt32, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.raw_write_command.call(this, lpBuffer, nNumberOfBytes, lpOverlapped)
    end
    def raw_device_control(this : IStiDeviceControl*, escape_function : UInt32, lpInData : Void*, cbInDataSize : UInt32, pOutData : Void*, dwOutDataSize : UInt32, pdwActualData : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.raw_device_control.call(this, escape_function, lpInData, cbInDataSize, pOutData, dwOutDataSize, pdwActualData)
    end
    def get_last_error(this : IStiDeviceControl*, lpdwLastError : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, lpdwLastError)
    end
    def get_my_device_port_name(this : IStiDeviceControl*, lpszDevicePath : UInt16*, cwDevicePathSize : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_my_device_port_name.call(this, lpszDevicePath, cwDevicePathSize)
    end
    def get_my_device_handle(this : IStiDeviceControl*, lph : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_my_device_handle.call(this, lph)
    end
    def get_my_device_open_mode(this : IStiDeviceControl*, pdwOpenMode : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_my_device_open_mode.call(this, pdwOpenMode)
    end
    def write_to_error_log(this : IStiDeviceControl*, dwMessageType : UInt32, pszMessage : Win32cr::Foundation::PWSTR, dwErrorCode : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.write_to_error_log.call(this, dwMessageType, pszMessage, dwErrorCode)
    end

  end

  @[Extern]
  record IStiUSDVtbl,
    query_interface : Proc(IStiUSD*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStiUSD*, UInt32),
    release : Proc(IStiUSD*, UInt32),
    initialize__ : Proc(IStiUSD*, Void*, UInt32, Win32cr::System::Registry::HKEY, Win32cr::Foundation::HRESULT),
    get_capabilities : Proc(IStiUSD*, Win32cr::Devices::Fax::STI_USD_CAPS*, Win32cr::Foundation::HRESULT),
    get_status : Proc(IStiUSD*, Win32cr::Devices::Fax::STI_DEVICE_STATUS*, Win32cr::Foundation::HRESULT),
    device_reset : Proc(IStiUSD*, Win32cr::Foundation::HRESULT),
    diagnostic : Proc(IStiUSD*, Win32cr::Devices::Fax::STI_DIAG*, Win32cr::Foundation::HRESULT),
    escape : Proc(IStiUSD*, UInt32, Void*, UInt32, Void*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_last_error : Proc(IStiUSD*, UInt32*, Win32cr::Foundation::HRESULT),
    lock_device : Proc(IStiUSD*, Win32cr::Foundation::HRESULT),
    un_lock_device : Proc(IStiUSD*, Win32cr::Foundation::HRESULT),
    raw_read_data : Proc(IStiUSD*, Void*, UInt32*, Win32cr::System::IO::OVERLAPPED*, Win32cr::Foundation::HRESULT),
    raw_write_data : Proc(IStiUSD*, Void*, UInt32, Win32cr::System::IO::OVERLAPPED*, Win32cr::Foundation::HRESULT),
    raw_read_command : Proc(IStiUSD*, Void*, UInt32*, Win32cr::System::IO::OVERLAPPED*, Win32cr::Foundation::HRESULT),
    raw_write_command : Proc(IStiUSD*, Void*, UInt32, Win32cr::System::IO::OVERLAPPED*, Win32cr::Foundation::HRESULT),
    set_notification_handle : Proc(IStiUSD*, Win32cr::Foundation::HANDLE, Win32cr::Foundation::HRESULT),
    get_notification_data : Proc(IStiUSD*, Win32cr::Devices::Fax::STINOTIFY*, Win32cr::Foundation::HRESULT),
    get_last_error_info : Proc(IStiUSD*, Win32cr::Devices::Fax::ERROR_INFOW_*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0c9bb460-51ac-11d0-90ea-00aa0060f86c")]
  record IStiUSD, lpVtbl : IStiUSDVtbl* do
    GUID = LibC::GUID.new(0xc9bb460_u32, 0x51ac_u16, 0x11d0_u16, StaticArray[0x90_u8, 0xea_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x60_u8, 0xf8_u8, 0x6c_u8])
    def query_interface(this : IStiUSD*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStiUSD*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStiUSD*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IStiUSD*, pHelDcb : Void*, dwStiVersion : UInt32, hParametersKey : Win32cr::System::Registry::HKEY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pHelDcb, dwStiVersion, hParametersKey)
    end
    def get_capabilities(this : IStiUSD*, pDevCaps : Win32cr::Devices::Fax::STI_USD_CAPS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_capabilities.call(this, pDevCaps)
    end
    def get_status(this : IStiUSD*, pDevStatus : Win32cr::Devices::Fax::STI_DEVICE_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pDevStatus)
    end
    def device_reset(this : IStiUSD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.device_reset.call(this)
    end
    def diagnostic(this : IStiUSD*, pBuffer : Win32cr::Devices::Fax::STI_DIAG*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.diagnostic.call(this, pBuffer)
    end
    def escape(this : IStiUSD*, escape_function : UInt32, lpInData : Void*, cbInDataSize : UInt32, pOutData : Void*, cbOutDataSize : UInt32, pdwActualData : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.escape.call(this, escape_function, lpInData, cbInDataSize, pOutData, cbOutDataSize, pdwActualData)
    end
    def get_last_error(this : IStiUSD*, pdwLastDeviceError : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error.call(this, pdwLastDeviceError)
    end
    def lock_device(this : IStiUSD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lock_device.call(this)
    end
    def un_lock_device(this : IStiUSD*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.un_lock_device.call(this)
    end
    def raw_read_data(this : IStiUSD*, lpBuffer : Void*, lpdwNumberOfBytes : UInt32*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.raw_read_data.call(this, lpBuffer, lpdwNumberOfBytes, lpOverlapped)
    end
    def raw_write_data(this : IStiUSD*, lpBuffer : Void*, nNumberOfBytes : UInt32, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.raw_write_data.call(this, lpBuffer, nNumberOfBytes, lpOverlapped)
    end
    def raw_read_command(this : IStiUSD*, lpBuffer : Void*, lpdwNumberOfBytes : UInt32*, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.raw_read_command.call(this, lpBuffer, lpdwNumberOfBytes, lpOverlapped)
    end
    def raw_write_command(this : IStiUSD*, lpBuffer : Void*, nNumberOfBytes : UInt32, lpOverlapped : Win32cr::System::IO::OVERLAPPED*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.raw_write_command.call(this, lpBuffer, nNumberOfBytes, lpOverlapped)
    end
    def set_notification_handle(this : IStiUSD*, hEvent : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_notification_handle.call(this, hEvent)
    end
    def get_notification_data(this : IStiUSD*, lpNotify : Win32cr::Devices::Fax::STINOTIFY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_notification_data.call(this, lpNotify)
    end
    def get_last_error_info(this : IStiUSD*, pLastErrorInfo : Win32cr::Devices::Fax::ERROR_INFOW_*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_error_info.call(this, pLastErrorInfo)
    end

  end

  @[Link("winfax")]
  @[Link("fxsutility")]
  @[Link("sti")]
  lib C
    fun FaxConnectFaxServerA(machine_name : Win32cr::Foundation::PSTR, fax_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    fun FaxConnectFaxServerW(machine_name : Win32cr::Foundation::PWSTR, fax_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    fun FaxClose(fax_handle : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun FaxOpenPort(fax_handle : Win32cr::Foundation::HANDLE, device_id : UInt32, flags : UInt32, fax_port_handle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::BOOL

    fun FaxCompleteJobParamsA(job_params : Win32cr::Devices::Fax::FAX_JOB_PARAMA**, coverpage_info : Win32cr::Devices::Fax::FAX_COVERPAGE_INFOA**) : Win32cr::Foundation::BOOL

    fun FaxCompleteJobParamsW(job_params : Win32cr::Devices::Fax::FAX_JOB_PARAMW**, coverpage_info : Win32cr::Devices::Fax::FAX_COVERPAGE_INFOW**) : Win32cr::Foundation::BOOL

    fun FaxSendDocumentA(fax_handle : Win32cr::Foundation::HANDLE, file_name : Win32cr::Foundation::PSTR, job_params : Win32cr::Devices::Fax::FAX_JOB_PARAMA*, coverpage_info : Win32cr::Devices::Fax::FAX_COVERPAGE_INFOA*, fax_job_id : UInt32*) : Win32cr::Foundation::BOOL

    fun FaxSendDocumentW(fax_handle : Win32cr::Foundation::HANDLE, file_name : Win32cr::Foundation::PWSTR, job_params : Win32cr::Devices::Fax::FAX_JOB_PARAMW*, coverpage_info : Win32cr::Devices::Fax::FAX_COVERPAGE_INFOW*, fax_job_id : UInt32*) : Win32cr::Foundation::BOOL

    fun FaxSendDocumentForBroadcastA(fax_handle : Win32cr::Foundation::HANDLE, file_name : Win32cr::Foundation::PSTR, fax_job_id : UInt32*, fax_recipient_callback : Win32cr::Devices::Fax::PFAX_RECIPIENT_CALLBACKA, context : Void*) : Win32cr::Foundation::BOOL

    fun FaxSendDocumentForBroadcastW(fax_handle : Win32cr::Foundation::HANDLE, file_name : Win32cr::Foundation::PWSTR, fax_job_id : UInt32*, fax_recipient_callback : Win32cr::Devices::Fax::PFAX_RECIPIENT_CALLBACKW, context : Void*) : Win32cr::Foundation::BOOL

    fun FaxEnumJobsA(fax_handle : Win32cr::Foundation::HANDLE, job_entry : Win32cr::Devices::Fax::FAX_JOB_ENTRYA**, jobs_returned : UInt32*) : Win32cr::Foundation::BOOL

    fun FaxEnumJobsW(fax_handle : Win32cr::Foundation::HANDLE, job_entry : Win32cr::Devices::Fax::FAX_JOB_ENTRYW**, jobs_returned : UInt32*) : Win32cr::Foundation::BOOL

    fun FaxGetJobA(fax_handle : Win32cr::Foundation::HANDLE, job_id : UInt32, job_entry : Win32cr::Devices::Fax::FAX_JOB_ENTRYA**) : Win32cr::Foundation::BOOL

    fun FaxGetJobW(fax_handle : Win32cr::Foundation::HANDLE, job_id : UInt32, job_entry : Win32cr::Devices::Fax::FAX_JOB_ENTRYW**) : Win32cr::Foundation::BOOL

    fun FaxSetJobA(fax_handle : Win32cr::Foundation::HANDLE, job_id : UInt32, command : UInt32, job_entry : Win32cr::Devices::Fax::FAX_JOB_ENTRYA*) : Win32cr::Foundation::BOOL

    fun FaxSetJobW(fax_handle : Win32cr::Foundation::HANDLE, job_id : UInt32, command : UInt32, job_entry : Win32cr::Devices::Fax::FAX_JOB_ENTRYW*) : Win32cr::Foundation::BOOL

    fun FaxGetPageData(fax_handle : Win32cr::Foundation::HANDLE, job_id : UInt32, buffer : UInt8**, buffer_size : UInt32*, image_width : UInt32*, image_height : UInt32*) : Win32cr::Foundation::BOOL

    fun FaxGetDeviceStatusA(fax_port_handle : Win32cr::Foundation::HANDLE, device_status : Win32cr::Devices::Fax::FAX_DEVICE_STATUSA**) : Win32cr::Foundation::BOOL

    fun FaxGetDeviceStatusW(fax_port_handle : Win32cr::Foundation::HANDLE, device_status : Win32cr::Devices::Fax::FAX_DEVICE_STATUSW**) : Win32cr::Foundation::BOOL

    fun FaxAbort(fax_handle : Win32cr::Foundation::HANDLE, job_id : UInt32) : Win32cr::Foundation::BOOL

    fun FaxGetConfigurationA(fax_handle : Win32cr::Foundation::HANDLE, fax_config : Win32cr::Devices::Fax::FAX_CONFIGURATIONA**) : Win32cr::Foundation::BOOL

    fun FaxGetConfigurationW(fax_handle : Win32cr::Foundation::HANDLE, fax_config : Win32cr::Devices::Fax::FAX_CONFIGURATIONW**) : Win32cr::Foundation::BOOL

    fun FaxSetConfigurationA(fax_handle : Win32cr::Foundation::HANDLE, fax_config : Win32cr::Devices::Fax::FAX_CONFIGURATIONA*) : Win32cr::Foundation::BOOL

    fun FaxSetConfigurationW(fax_handle : Win32cr::Foundation::HANDLE, fax_config : Win32cr::Devices::Fax::FAX_CONFIGURATIONW*) : Win32cr::Foundation::BOOL

    fun FaxGetLoggingCategoriesA(fax_handle : Win32cr::Foundation::HANDLE, categories : Win32cr::Devices::Fax::FAX_LOG_CATEGORYA**, number_categories : UInt32*) : Win32cr::Foundation::BOOL

    fun FaxGetLoggingCategoriesW(fax_handle : Win32cr::Foundation::HANDLE, categories : Win32cr::Devices::Fax::FAX_LOG_CATEGORYW**, number_categories : UInt32*) : Win32cr::Foundation::BOOL

    fun FaxSetLoggingCategoriesA(fax_handle : Win32cr::Foundation::HANDLE, categories : Win32cr::Devices::Fax::FAX_LOG_CATEGORYA*, number_categories : UInt32) : Win32cr::Foundation::BOOL

    fun FaxSetLoggingCategoriesW(fax_handle : Win32cr::Foundation::HANDLE, categories : Win32cr::Devices::Fax::FAX_LOG_CATEGORYW*, number_categories : UInt32) : Win32cr::Foundation::BOOL

    fun FaxEnumPortsA(fax_handle : Win32cr::Foundation::HANDLE, port_info : Win32cr::Devices::Fax::FAX_PORT_INFOA**, ports_returned : UInt32*) : Win32cr::Foundation::BOOL

    fun FaxEnumPortsW(fax_handle : Win32cr::Foundation::HANDLE, port_info : Win32cr::Devices::Fax::FAX_PORT_INFOW**, ports_returned : UInt32*) : Win32cr::Foundation::BOOL

    fun FaxGetPortA(fax_port_handle : Win32cr::Foundation::HANDLE, port_info : Win32cr::Devices::Fax::FAX_PORT_INFOA**) : Win32cr::Foundation::BOOL

    fun FaxGetPortW(fax_port_handle : Win32cr::Foundation::HANDLE, port_info : Win32cr::Devices::Fax::FAX_PORT_INFOW**) : Win32cr::Foundation::BOOL

    fun FaxSetPortA(fax_port_handle : Win32cr::Foundation::HANDLE, port_info : Win32cr::Devices::Fax::FAX_PORT_INFOA*) : Win32cr::Foundation::BOOL

    fun FaxSetPortW(fax_port_handle : Win32cr::Foundation::HANDLE, port_info : Win32cr::Devices::Fax::FAX_PORT_INFOW*) : Win32cr::Foundation::BOOL

    fun FaxEnumRoutingMethodsA(fax_port_handle : Win32cr::Foundation::HANDLE, routing_method : Win32cr::Devices::Fax::FAX_ROUTING_METHODA**, methods_returned : UInt32*) : Win32cr::Foundation::BOOL

    fun FaxEnumRoutingMethodsW(fax_port_handle : Win32cr::Foundation::HANDLE, routing_method : Win32cr::Devices::Fax::FAX_ROUTING_METHODW**, methods_returned : UInt32*) : Win32cr::Foundation::BOOL

    fun FaxEnableRoutingMethodA(fax_port_handle : Win32cr::Foundation::HANDLE, routing_guid : Win32cr::Foundation::PSTR, enabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun FaxEnableRoutingMethodW(fax_port_handle : Win32cr::Foundation::HANDLE, routing_guid : Win32cr::Foundation::PWSTR, enabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun FaxEnumGlobalRoutingInfoA(fax_handle : Win32cr::Foundation::HANDLE, routing_info : Win32cr::Devices::Fax::FAX_GLOBAL_ROUTING_INFOA**, methods_returned : UInt32*) : Win32cr::Foundation::BOOL

    fun FaxEnumGlobalRoutingInfoW(fax_handle : Win32cr::Foundation::HANDLE, routing_info : Win32cr::Devices::Fax::FAX_GLOBAL_ROUTING_INFOW**, methods_returned : UInt32*) : Win32cr::Foundation::BOOL

    fun FaxSetGlobalRoutingInfoA(fax_handle : Win32cr::Foundation::HANDLE, routing_info : Win32cr::Devices::Fax::FAX_GLOBAL_ROUTING_INFOA*) : Win32cr::Foundation::BOOL

    fun FaxSetGlobalRoutingInfoW(fax_handle : Win32cr::Foundation::HANDLE, routing_info : Win32cr::Devices::Fax::FAX_GLOBAL_ROUTING_INFOW*) : Win32cr::Foundation::BOOL

    fun FaxGetRoutingInfoA(fax_port_handle : Win32cr::Foundation::HANDLE, routing_guid : Win32cr::Foundation::PSTR, routing_info_buffer : UInt8**, routing_info_buffer_size : UInt32*) : Win32cr::Foundation::BOOL

    fun FaxGetRoutingInfoW(fax_port_handle : Win32cr::Foundation::HANDLE, routing_guid : Win32cr::Foundation::PWSTR, routing_info_buffer : UInt8**, routing_info_buffer_size : UInt32*) : Win32cr::Foundation::BOOL

    fun FaxSetRoutingInfoA(fax_port_handle : Win32cr::Foundation::HANDLE, routing_guid : Win32cr::Foundation::PSTR, routing_info_buffer : UInt8*, routing_info_buffer_size : UInt32) : Win32cr::Foundation::BOOL

    fun FaxSetRoutingInfoW(fax_port_handle : Win32cr::Foundation::HANDLE, routing_guid : Win32cr::Foundation::PWSTR, routing_info_buffer : UInt8*, routing_info_buffer_size : UInt32) : Win32cr::Foundation::BOOL

    fun FaxInitializeEventQueue(fax_handle : Win32cr::Foundation::HANDLE, completion_port : Win32cr::Foundation::HANDLE, completion_key : LibC::UIntPtrT, hWnd : Win32cr::Foundation::HWND, message_start : UInt32) : Win32cr::Foundation::BOOL

    fun FaxFreeBuffer(buffer : Void*) : Void

    fun FaxStartPrintJobA(printer_name : Win32cr::Foundation::PSTR, print_info : Win32cr::Devices::Fax::FAX_PRINT_INFOA*, fax_job_id : UInt32*, fax_context_info : Win32cr::Devices::Fax::FAX_CONTEXT_INFOA*) : Win32cr::Foundation::BOOL

    fun FaxStartPrintJobW(printer_name : Win32cr::Foundation::PWSTR, print_info : Win32cr::Devices::Fax::FAX_PRINT_INFOW*, fax_job_id : UInt32*, fax_context_info : Win32cr::Devices::Fax::FAX_CONTEXT_INFOW*) : Win32cr::Foundation::BOOL

    fun FaxPrintCoverPageA(fax_context_info : Win32cr::Devices::Fax::FAX_CONTEXT_INFOA*, cover_page_info : Win32cr::Devices::Fax::FAX_COVERPAGE_INFOA*) : Win32cr::Foundation::BOOL

    fun FaxPrintCoverPageW(fax_context_info : Win32cr::Devices::Fax::FAX_CONTEXT_INFOW*, cover_page_info : Win32cr::Devices::Fax::FAX_COVERPAGE_INFOW*) : Win32cr::Foundation::BOOL

    fun FaxRegisterServiceProviderW(device_provider : Win32cr::Foundation::PWSTR, friendly_name : Win32cr::Foundation::PWSTR, image_name : Win32cr::Foundation::PWSTR, tsp_name : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun FaxUnregisterServiceProviderW(device_provider : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun FaxRegisterRoutingExtensionW(fax_handle : Win32cr::Foundation::HANDLE, extension_name : Win32cr::Foundation::PWSTR, friendly_name : Win32cr::Foundation::PWSTR, image_name : Win32cr::Foundation::PWSTR, call_back : Win32cr::Devices::Fax::PFAX_ROUTING_INSTALLATION_CALLBACKW, context : Void*) : Win32cr::Foundation::BOOL

    fun FaxAccessCheck(fax_handle : Win32cr::Foundation::HANDLE, access_mask : UInt32) : Win32cr::Foundation::BOOL

    fun CanSendToFaxRecipient : Win32cr::Foundation::BOOL

    fun SendToFaxRecipient(sndMode : Win32cr::Devices::Fax::SendToMode, lpFileName : Win32cr::Foundation::PWSTR) : UInt32

    fun StiCreateInstanceW(hinst : Win32cr::Foundation::HINSTANCE, dwVer : UInt32, ppSti : Void**, punkOuter : Void*) : Win32cr::Foundation::HRESULT

  end
end