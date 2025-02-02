require "./../foundation.cr"

module Win32cr::Management::MobileDeviceManagementRegistration
  extend self
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

  enum REGISTRATION_INFORMATION_CLASS
    DeviceRegistrationBasicInfo = 1_i32
    MaxDeviceInfoClass = 2_i32
  end

  @[Extern]
  struct MANAGEMENT_SERVICE_INFO
    property pszMDMServiceUri : Win32cr::Foundation::PWSTR
    property pszAuthenticationUri : Win32cr::Foundation::PWSTR
    def initialize(@pszMDMServiceUri : Win32cr::Foundation::PWSTR, @pszAuthenticationUri : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct MANAGEMENT_REGISTRATION_INFO
    property fDeviceRegisteredWithManagement : Win32cr::Foundation::BOOL
    property dwDeviceRegistionKind : UInt32
    property pszUPN : Win32cr::Foundation::PWSTR
    property pszMDMServiceUri : Win32cr::Foundation::PWSTR
    def initialize(@fDeviceRegisteredWithManagement : Win32cr::Foundation::BOOL, @dwDeviceRegistionKind : UInt32, @pszUPN : Win32cr::Foundation::PWSTR, @pszMDMServiceUri : Win32cr::Foundation::PWSTR)
    end
  end

  def getDeviceRegistrationInfo(device_information_class : Win32cr::Management::MobileDeviceManagementRegistration::REGISTRATION_INFORMATION_CLASS, ppDeviceRegistrationInfo : Void**) : Win32cr::Foundation::HRESULT
    C.GetDeviceRegistrationInfo(device_information_class, ppDeviceRegistrationInfo)
  end

  def isDeviceRegisteredWithManagement(pfIsDeviceRegisteredWithManagement : Win32cr::Foundation::BOOL*, cchUPN : UInt32, pszUPN : UInt16*) : Win32cr::Foundation::HRESULT
    C.IsDeviceRegisteredWithManagement(pfIsDeviceRegisteredWithManagement, cchUPN, pszUPN)
  end

  def isManagementRegistrationAllowed(pfIsManagementRegistrationAllowed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.IsManagementRegistrationAllowed(pfIsManagementRegistrationAllowed)
  end

  def isMdmUxWithoutAadAllowed(isEnrollmentAllowed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.IsMdmUxWithoutAadAllowed(isEnrollmentAllowed)
  end

  def setManagedExternally(is_managed_externally : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.SetManagedExternally(is_managed_externally)
  end

  def discoverManagementService(pszUPN : Win32cr::Foundation::PWSTR, ppMgmtInfo : Win32cr::Management::MobileDeviceManagementRegistration::MANAGEMENT_SERVICE_INFO**) : Win32cr::Foundation::HRESULT
    C.DiscoverManagementService(pszUPN, ppMgmtInfo)
  end

  def registerDeviceWithManagementUsingAADCredentials(user_token : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT
    C.RegisterDeviceWithManagementUsingAADCredentials(user_token)
  end

  def registerDeviceWithManagementUsingAADDeviceCredentials : Win32cr::Foundation::HRESULT
    C.RegisterDeviceWithManagementUsingAADDeviceCredentials
  end

  def registerDeviceWithManagementUsingAADDeviceCredentials2(mdm_application_id : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.RegisterDeviceWithManagementUsingAADDeviceCredentials2(mdm_application_id)
  end

  def registerDeviceWithManagement(pszUPN : Win32cr::Foundation::PWSTR, ppszMDMServiceUri : Win32cr::Foundation::PWSTR, ppzsAccessToken : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.RegisterDeviceWithManagement(pszUPN, ppszMDMServiceUri, ppzsAccessToken)
  end

  def unregisterDeviceWithManagement(enrollmentID : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.UnregisterDeviceWithManagement(enrollmentID)
  end

  def getDeviceManagementConfigInfo(providerID : Win32cr::Foundation::PWSTR, configStringBufferLength : UInt32*, configString : UInt16*) : Win32cr::Foundation::HRESULT
    C.GetDeviceManagementConfigInfo(providerID, configStringBufferLength, configString)
  end

  def setDeviceManagementConfigInfo(providerID : Win32cr::Foundation::PWSTR, configString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.SetDeviceManagementConfigInfo(providerID, configString)
  end

  def getManagementAppHyperlink(cchHyperlink : UInt32, pszHyperlink : UInt16*) : Win32cr::Foundation::HRESULT
    C.GetManagementAppHyperlink(cchHyperlink, pszHyperlink)
  end

  def discoverManagementServiceEx(pszUPN : Win32cr::Foundation::PWSTR, pszDiscoveryServiceCandidate : Win32cr::Foundation::PWSTR, ppMgmtInfo : Win32cr::Management::MobileDeviceManagementRegistration::MANAGEMENT_SERVICE_INFO**) : Win32cr::Foundation::HRESULT
    C.DiscoverManagementServiceEx(pszUPN, pszDiscoveryServiceCandidate, ppMgmtInfo)
  end

  def registerDeviceWithLocalManagement(alreadyRegistered : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.RegisterDeviceWithLocalManagement(alreadyRegistered)
  end

  def applyLocalManagementSyncML(syncMLRequest : Win32cr::Foundation::PWSTR, syncMLResult : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
    C.ApplyLocalManagementSyncML(syncMLRequest, syncMLResult)
  end

  def unregisterDeviceWithLocalManagement : Win32cr::Foundation::HRESULT
    C.UnregisterDeviceWithLocalManagement
  end

  @[Link("mdmregistration")]
  @[Link("mdmlocalmanagement")]
  lib C
    # :nodoc:
    fun GetDeviceRegistrationInfo(device_information_class : Win32cr::Management::MobileDeviceManagementRegistration::REGISTRATION_INFORMATION_CLASS, ppDeviceRegistrationInfo : Void**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IsDeviceRegisteredWithManagement(pfIsDeviceRegisteredWithManagement : Win32cr::Foundation::BOOL*, cchUPN : UInt32, pszUPN : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IsManagementRegistrationAllowed(pfIsManagementRegistrationAllowed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun IsMdmUxWithoutAadAllowed(isEnrollmentAllowed : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun SetManagedExternally(is_managed_externally : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DiscoverManagementService(pszUPN : Win32cr::Foundation::PWSTR, ppMgmtInfo : Win32cr::Management::MobileDeviceManagementRegistration::MANAGEMENT_SERVICE_INFO**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RegisterDeviceWithManagementUsingAADCredentials(user_token : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RegisterDeviceWithManagementUsingAADDeviceCredentials : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RegisterDeviceWithManagementUsingAADDeviceCredentials2(mdm_application_id : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RegisterDeviceWithManagement(pszUPN : Win32cr::Foundation::PWSTR, ppszMDMServiceUri : Win32cr::Foundation::PWSTR, ppzsAccessToken : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun UnregisterDeviceWithManagement(enrollmentID : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetDeviceManagementConfigInfo(providerID : Win32cr::Foundation::PWSTR, configStringBufferLength : UInt32*, configString : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun SetDeviceManagementConfigInfo(providerID : Win32cr::Foundation::PWSTR, configString : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetManagementAppHyperlink(cchHyperlink : UInt32, pszHyperlink : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DiscoverManagementServiceEx(pszUPN : Win32cr::Foundation::PWSTR, pszDiscoveryServiceCandidate : Win32cr::Foundation::PWSTR, ppMgmtInfo : Win32cr::Management::MobileDeviceManagementRegistration::MANAGEMENT_SERVICE_INFO**) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun RegisterDeviceWithLocalManagement(alreadyRegistered : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ApplyLocalManagementSyncML(syncMLRequest : Win32cr::Foundation::PWSTR, syncMLResult : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun UnregisterDeviceWithLocalManagement : Win32cr::Foundation::HRESULT

  end
end