require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:mdmregistration.dll")]
@[Link(ldflags: "/DELAYLOAD:mdmlocalmanagement.dll")]
lib LibWin32
  MENROLL_E_DEVICE_MESSAGE_FORMAT_ERROR = -2145910783_i32
  MENROLL_E_DEVICE_AUTHENTICATION_ERROR = -2145910782_i32
  MENROLL_E_DEVICE_AUTHORIZATION_ERROR = -2145910781_i32
  MENROLL_E_DEVICE_CERTIFICATEREQUEST_ERROR = -2145910780_i32
  MENROLL_E_DEVICE_CONFIGMGRSERVER_ERROR = -2145910779_i32
  MENROLL_E_DEVICE_INTERNALSERVICE_ERROR = -2145910778_i32
  MENROLL_E_DEVICE_INVALIDSECURITY_ERROR = -2145910777_i32
  MENROLL_E_DEVICE_UNKNOWN_ERROR = -2145910776_i32
  MENROLL_E_ENROLLMENT_IN_PROGRESS = -2145910775_i32
  MENROLL_E_DEVICE_ALREADY_ENROLLED = -2145910774_i32
  MENROLL_E_DISCOVERY_SEC_CERT_DATE_INVALID = -2145910771_i32
  MENROLL_E_PASSWORD_NEEDED = -2145910770_i32
  MENROLL_E_WAB_ERROR = -2145910769_i32
  MENROLL_E_CONNECTIVITY = -2145910768_i32
  MENROLL_E_INVALIDSSLCERT = -2145910766_i32
  MENROLL_E_DEVICEAPREACHED = -2145910765_i32
  MENROLL_E_DEVICENOTSUPPORTED = -2145910764_i32
  MENROLL_E_NOT_SUPPORTED = -2145910763_i32
  MENROLL_E_NOTELIGIBLETORENEW = -2145910762_i32
  MENROLL_E_INMAINTENANCE = -2145910761_i32
  MENROLL_E_USER_LICENSE = -2145910760_i32
  MENROLL_E_ENROLLMENTDATAINVALID = -2145910759_i32
  MENROLL_E_INSECUREREDIRECT = -2145910758_i32
  MENROLL_E_PLATFORM_WRONG_STATE = -2145910757_i32
  MENROLL_E_PLATFORM_LICENSE_ERROR = -2145910756_i32
  MENROLL_E_PLATFORM_UNKNOWN_ERROR = -2145910755_i32
  MENROLL_E_PROV_CSP_CERTSTORE = -2145910754_i32
  MENROLL_E_PROV_CSP_W7 = -2145910753_i32
  MENROLL_E_PROV_CSP_DMCLIENT = -2145910752_i32
  MENROLL_E_PROV_CSP_PFW = -2145910751_i32
  MENROLL_E_PROV_CSP_MISC = -2145910750_i32
  MENROLL_E_PROV_UNKNOWN = -2145910749_i32
  MENROLL_E_PROV_SSLCERTNOTFOUND = -2145910748_i32
  MENROLL_E_PROV_CSP_APPMGMT = -2145910747_i32
  MENROLL_E_DEVICE_MANAGEMENT_BLOCKED = -2145910746_i32
  MENROLL_E_CERTPOLICY_PRIVATEKEYCREATION_FAILED = -2145910745_i32
  MENROLL_E_CERTAUTH_FAILED_TO_FIND_CERT = -2145910744_i32
  MENROLL_E_EMPTY_MESSAGE = -2145910743_i32
  MENROLL_E_USER_CANCELLED = -2145910736_i32
  MENROLL_E_MDM_NOT_CONFIGURED = -2145910735_i32
  MDM_REGISTRATION_FACILITY_CODE = 25_u32
  DEVICE_ENROLLER_FACILITY_CODE = 24_u32
  MREGISTER_E_DEVICE_MESSAGE_FORMAT_ERROR = -2145845247_i32
  MREGISTER_E_DEVICE_AUTHENTICATION_ERROR = -2145845246_i32
  MREGISTER_E_DEVICE_AUTHORIZATION_ERROR = -2145845245_i32
  MREGISTER_E_DEVICE_CERTIFCATEREQUEST_ERROR = -2145845244_i32
  MENROLL_E_DEVICE_CERTIFCATEREQUEST_ERROR = -2145910780_i32
  MREGISTER_E_DEVICE_CONFIGMGRSERVER_ERROR = -2145845243_i32
  MREGISTER_E_DEVICE_INTERNALSERVICE_ERROR = -2145845242_i32
  MREGISTER_E_DEVICE_INVALIDSECURITY_ERROR = -2145845241_i32
  MREGISTER_E_DEVICE_UNKNOWN_ERROR = -2145845240_i32
  MREGISTER_E_REGISTRATION_IN_PROGRESS = -2145845239_i32
  MREGISTER_E_DEVICE_ALREADY_REGISTERED = -2145845238_i32
  MREGISTER_E_DEVICE_NOT_REGISTERED = -2145845237_i32
  MENROLL_E_DEVICE_NOT_ENROLLED = -2145910773_i32
  MREGISTER_E_DISCOVERY_REDIRECTED = -2145845236_i32
  MREGISTER_E_DEVICE_NOT_AD_REGISTERED_ERROR = -2145845235_i32
  MREGISTER_E_DISCOVERY_FAILED = -2145845234_i32
  MENROLL_E_DEVICECAPREACHED = -2145910765_i32
  MENROLL_E_NOTSUPPORTED = -2145910763_i32
  MENROLL_E_USERLICENSE = -2145910760_i32
  MENROLL_E_USER_CANCELED = -2145910742_i32
  DEVICEREGISTRATIONTYPE_MDM_ONLY = 0_u32
  DEVICEREGISTRATIONTYPE_MAM = 5_u32
  DEVICEREGISTRATIONTYPE_MDM_DEVICEWIDE_WITH_AAD = 6_u32
  DEVICEREGISTRATIONTYPE_MDM_USERSPECIFIC_WITH_AAD = 13_u32


  enum REGISTRATION_INFORMATION_CLASS : Int32
    DeviceRegistrationBasicInfo = 1
    MaxDeviceInfoClass = 2
  end

  struct MANAGEMENT_SERVICE_INFO
    psz_mdm_service_uri : LibC::LPWSTR
    psz_authentication_uri : LibC::LPWSTR
  end
  struct MANAGEMENT_REGISTRATION_INFO
    f_device_registered_with_management : LibC::BOOL
    dw_device_registion_kind : UInt32
    psz_upn : LibC::LPWSTR
    psz_mdm_service_uri : LibC::LPWSTR
  end


  # Params # deviceinformationclass : REGISTRATION_INFORMATION_CLASS [In],ppdeviceregistrationinfo : Void** [In]
  fun GetDeviceRegistrationInfo(deviceinformationclass : REGISTRATION_INFORMATION_CLASS, ppdeviceregistrationinfo : Void**) : HRESULT

  # Params # pfisdeviceregisteredwithmanagement : LibC::BOOL* [In],cchupn : UInt32 [In],pszupn : Char* [In]
  fun IsDeviceRegisteredWithManagement(pfisdeviceregisteredwithmanagement : LibC::BOOL*, cchupn : UInt32, pszupn : Char*) : HRESULT

  # Params # pfismanagementregistrationallowed : LibC::BOOL* [In]
  fun IsManagementRegistrationAllowed(pfismanagementregistrationallowed : LibC::BOOL*) : HRESULT

  # Params # isenrollmentallowed : LibC::BOOL* [In]
  fun IsMdmUxWithoutAadAllowed(isenrollmentallowed : LibC::BOOL*) : HRESULT

  # Params # ismanagedexternally : LibC::BOOL [In]
  fun SetManagedExternally(ismanagedexternally : LibC::BOOL) : HRESULT

  # Params # pszupn : LibC::LPWSTR [In],ppmgmtinfo : MANAGEMENT_SERVICE_INFO** [In]
  fun DiscoverManagementService(pszupn : LibC::LPWSTR, ppmgmtinfo : MANAGEMENT_SERVICE_INFO**) : HRESULT

  # Params # usertoken : LibC::HANDLE [In]
  fun RegisterDeviceWithManagementUsingAADCredentials(usertoken : LibC::HANDLE) : HRESULT

  # Params # 
  fun RegisterDeviceWithManagementUsingAADDeviceCredentials : HRESULT

  # Params # mdmapplicationid : LibC::LPWSTR [In]
  fun RegisterDeviceWithManagementUsingAADDeviceCredentials2(mdmapplicationid : LibC::LPWSTR) : HRESULT

  # Params # pszupn : LibC::LPWSTR [In],ppszmdmserviceuri : LibC::LPWSTR [In],ppzsaccesstoken : LibC::LPWSTR [In]
  fun RegisterDeviceWithManagement(pszupn : LibC::LPWSTR, ppszmdmserviceuri : LibC::LPWSTR, ppzsaccesstoken : LibC::LPWSTR) : HRESULT

  # Params # enrollmentid : LibC::LPWSTR [In]
  fun UnregisterDeviceWithManagement(enrollmentid : LibC::LPWSTR) : HRESULT

  # Params # providerid : LibC::LPWSTR [In],configstringbufferlength : UInt32* [In],configstring : Char* [In]
  fun GetDeviceManagementConfigInfo(providerid : LibC::LPWSTR, configstringbufferlength : UInt32*, configstring : Char*) : HRESULT

  # Params # providerid : LibC::LPWSTR [In],configstring : LibC::LPWSTR [In]
  fun SetDeviceManagementConfigInfo(providerid : LibC::LPWSTR, configstring : LibC::LPWSTR) : HRESULT

  # Params # cchhyperlink : UInt32 [In],pszhyperlink : Char* [In]
  fun GetManagementAppHyperlink(cchhyperlink : UInt32, pszhyperlink : Char*) : HRESULT

  # Params # pszupn : LibC::LPWSTR [In],pszdiscoveryservicecandidate : LibC::LPWSTR [In],ppmgmtinfo : MANAGEMENT_SERVICE_INFO** [In]
  fun DiscoverManagementServiceEx(pszupn : LibC::LPWSTR, pszdiscoveryservicecandidate : LibC::LPWSTR, ppmgmtinfo : MANAGEMENT_SERVICE_INFO**) : HRESULT

  # Params # alreadyregistered : LibC::BOOL* [In]
  fun RegisterDeviceWithLocalManagement(alreadyregistered : LibC::BOOL*) : HRESULT

  # Params # syncmlrequest : LibC::LPWSTR [In],syncmlresult : LibC::LPWSTR* [In]
  fun ApplyLocalManagementSyncML(syncmlrequest : LibC::LPWSTR, syncmlresult : LibC::LPWSTR*) : HRESULT

  # Params # 
  fun UnregisterDeviceWithLocalManagement : HRESULT
end
