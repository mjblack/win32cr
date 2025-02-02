require "./../foundation.cr"

module Win32cr::Data::RightsManagement
  extend self
  alias DRMCALLBACK = Proc(Win32cr::Data::RightsManagement::DRM_STATUS_MSG, Win32cr::Foundation::HRESULT, Void*, Void*, Win32cr::Foundation::HRESULT)

  DRMHANDLE_INVALID = 0_u32
  DRMENVHANDLE_INVALID = 0_u32
  DRMQUERYHANDLE_INVALID = 0_u32
  DRMHSESSION_INVALID = 0_u32
  DRMPUBHANDLE_INVALID = 0_u32
  DRM_AL_NONSILENT = 1_u32
  DRM_AL_NOPERSIST = 2_u32
  DRM_AL_CANCEL = 4_u32
  DRM_AL_FETCHNOADVISORY = 8_u32
  DRM_AL_NOUI = 16_u32
  DRM_ACTIVATE_MACHINE = 1_u32
  DRM_ACTIVATE_GROUPIDENTITY = 2_u32
  DRM_ACTIVATE_TEMPORARY = 4_u32
  DRM_ACTIVATE_CANCEL = 8_u32
  DRM_ACTIVATE_SILENT = 16_u32
  DRM_ACTIVATE_SHARED_GROUPIDENTITY = 32_u32
  DRM_ACTIVATE_DELAYED = 64_u32
  DRM_EL_MACHINE = 1_u32
  DRM_EL_GROUPIDENTITY = 2_u32
  DRM_EL_GROUPIDENTITY_NAME = 4_u32
  DRM_EL_GROUPIDENTITY_LID = 8_u32
  DRM_EL_SPECIFIED_GROUPIDENTITY = 16_u32
  DRM_EL_EUL = 32_u32
  DRM_EL_EUL_LID = 64_u32
  DRM_EL_CLIENTLICENSOR = 128_u32
  DRM_EL_CLIENTLICENSOR_LID = 256_u32
  DRM_EL_SPECIFIED_CLIENTLICENSOR = 512_u32
  DRM_EL_REVOCATIONLIST = 1024_u32
  DRM_EL_REVOCATIONLIST_LID = 2048_u32
  DRM_EL_EXPIRED = 4096_u32
  DRM_EL_ISSUERNAME = 8192_u32
  DRM_EL_ISSUANCELICENSE_TEMPLATE = 16384_u32
  DRM_EL_ISSUANCELICENSE_TEMPLATE_LID = 32768_u32
  DRM_ADD_LICENSE_NOPERSIST = 0_u32
  DRM_ADD_LICENSE_PERSIST = 1_u32
  DRM_SERVICE_TYPE_ACTIVATION = 1_u32
  DRM_SERVICE_TYPE_CERTIFICATION = 2_u32
  DRM_SERVICE_TYPE_PUBLISHING = 4_u32
  DRM_SERVICE_TYPE_CLIENTLICENSOR = 8_u32
  DRM_SERVICE_TYPE_SILENT = 16_u32
  DRM_SERVICE_LOCATION_INTERNET = 1_u32
  DRM_SERVICE_LOCATION_ENTERPRISE = 2_u32
  DRM_DEFAULTGROUPIDTYPE_WINDOWSAUTH = "WindowsAuthProvider"
  DRM_DEFAULTGROUPIDTYPE_PASSPORT = "PassportAuthProvider"
  DRM_SIGN_ONLINE = 1_u32
  DRM_SIGN_OFFLINE = 2_u32
  DRM_SIGN_CANCEL = 4_u32
  DRM_SERVER_ISSUANCELICENSE = 8_u32
  DRM_AUTO_GENERATE_KEY = 16_u32
  DRM_OWNER_LICENSE_NOPERSIST = 32_u32
  DRM_REUSE_KEY = 64_u32
  DRM_LOCKBOXTYPE_NONE = 0_u32
  DRM_LOCKBOXTYPE_WHITEBOX = 1_u32
  DRM_LOCKBOXTYPE_BLACKBOX = 2_u32
  DRM_LOCKBOXTYPE_DEFAULT = 2_u32
  DRM_AILT_NONSILENT = 1_u32
  DRM_AILT_OBTAIN_ALL = 2_u32
  DRM_AILT_CANCEL = 4_u32
  MSDRM_CLIENT_ZONE = 52992_u32
  MSDRM_POLICY_ZONE = 37632_u32
  DRMIDVERSION = 0_u32
  DRMBOUNDLICENSEPARAMSVERSION = 1_u32
  DRMBINDINGFLAGS_IGNORE_VALIDITY_INTERVALS = 1_u32
  DRMLICENSEACQDATAVERSION = 0_u32
  DRMACTSERVINFOVERSION = 0_u32
  DRMCLIENTSTRUCTVERSION = 1_u32
  DRMCALLBACKVERSION = 1_u32

  enum DRMTIMETYPE
    DRMTIMETYPE_SYSTEMUTC = 0_i32
    DRMTIMETYPE_SYSTEMLOCAL = 1_i32
  end
  enum DRMENCODINGTYPE
    DRMENCODINGTYPE_BASE64 = 0_i32
    DRMENCODINGTYPE_STRING = 1_i32
    DRMENCODINGTYPE_LONG = 2_i32
    DRMENCODINGTYPE_TIME = 3_i32
    DRMENCODINGTYPE_UINT = 4_i32
    DRMENCODINGTYPE_RAW = 5_i32
  end
  enum DRMATTESTTYPE
    DRMATTESTTYPE_FULLENVIRONMENT = 0_i32
    DRMATTESTTYPE_HASHONLY = 1_i32
  end
  enum DRMSPECTYPE
    DRMSPECTYPE_UNKNOWN = 0_i32
    DRMSPECTYPE_FILENAME = 1_i32
  end
  enum DRMSECURITYPROVIDERTYPE
    DRMSECURITYPROVIDERTYPE_SOFTWARESECREP = 0_i32
  end
  enum DRMGLOBALOPTIONS
    DRMGLOBALOPTIONS_USE_WINHTTP = 0_i32
    DRMGLOBALOPTIONS_USE_SERVERSECURITYPROCESSOR = 1_i32
  end
  enum DRM_STATUS_MSG
    DRM_MSG_ACTIVATE_MACHINE = 0_i32
    DRM_MSG_ACTIVATE_GROUPIDENTITY = 1_i32
    DRM_MSG_ACQUIRE_LICENSE = 2_i32
    DRM_MSG_ACQUIRE_ADVISORY = 3_i32
    DRM_MSG_SIGN_ISSUANCE_LICENSE = 4_i32
    DRM_MSG_ACQUIRE_CLIENTLICENSOR = 5_i32
    DRM_MSG_ACQUIRE_ISSUANCE_LICENSE_TEMPLATE = 6_i32
  end
  enum DRM_USAGEPOLICY_TYPE
    DRM_USAGEPOLICY_TYPE_BYNAME = 0_i32
    DRM_USAGEPOLICY_TYPE_BYPUBLICKEY = 1_i32
    DRM_USAGEPOLICY_TYPE_BYDIGEST = 2_i32
    DRM_USAGEPOLICY_TYPE_OSEXCLUSION = 3_i32
  end
  enum DRM_DISTRIBUTION_POINT_INFO
    DRM_DISTRIBUTION_POINT_LICENSE_ACQUISITION = 0_i32
    DRM_DISTRIBUTION_POINT_PUBLISHING = 1_i32
    DRM_DISTRIBUTION_POINT_REFERRAL_INFO = 2_i32
  end

  @[Extern]
  struct DRMID
    property uVersion : UInt32
    property wszIDType : Win32cr::Foundation::PWSTR
    property wszID : Win32cr::Foundation::PWSTR
    def initialize(@uVersion : UInt32, @wszIDType : Win32cr::Foundation::PWSTR, @wszID : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DRMBOUNDLICENSEPARAMS
    property uVersion : UInt32
    property hEnablingPrincipal : UInt32
    property hSecureStore : UInt32
    property wszRightsRequested : Win32cr::Foundation::PWSTR
    property wszRightsGroup : Win32cr::Foundation::PWSTR
    property idResource : Win32cr::Data::RightsManagement::DRMID
    property cAuthenticatorCount : UInt32
    property rghAuthenticators : UInt32*
    property wszDefaultEnablingPrincipalCredentials : Win32cr::Foundation::PWSTR
    property dwFlags : UInt32
    def initialize(@uVersion : UInt32, @hEnablingPrincipal : UInt32, @hSecureStore : UInt32, @wszRightsRequested : Win32cr::Foundation::PWSTR, @wszRightsGroup : Win32cr::Foundation::PWSTR, @idResource : Win32cr::Data::RightsManagement::DRMID, @cAuthenticatorCount : UInt32, @rghAuthenticators : UInt32*, @wszDefaultEnablingPrincipalCredentials : Win32cr::Foundation::PWSTR, @dwFlags : UInt32)
    end
  end

  @[Extern]
  struct DRM_LICENSE_ACQ_DATA
    property uVersion : UInt32
    property wszURL : Win32cr::Foundation::PWSTR
    property wszLocalFilename : Win32cr::Foundation::PWSTR
    property pbPostData : UInt8*
    property dwPostDataSize : UInt32
    property wszFriendlyName : Win32cr::Foundation::PWSTR
    def initialize(@uVersion : UInt32, @wszURL : Win32cr::Foundation::PWSTR, @wszLocalFilename : Win32cr::Foundation::PWSTR, @pbPostData : UInt8*, @dwPostDataSize : UInt32, @wszFriendlyName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DRM_ACTSERV_INFO
    property uVersion : UInt32
    property wszPubKey : Win32cr::Foundation::PWSTR
    property wszURL : Win32cr::Foundation::PWSTR
    def initialize(@uVersion : UInt32, @wszPubKey : Win32cr::Foundation::PWSTR, @wszURL : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct DRM_CLIENT_VERSION_INFO
    property uStructVersion : UInt32
    property dwVersion : UInt32[4]
    property wszHierarchy : UInt16[256]
    property wszProductId : UInt16[256]
    property wszProductDescription : UInt16[256]
    def initialize(@uStructVersion : UInt32, @dwVersion : UInt32[4], @wszHierarchy : UInt16[256], @wszProductId : UInt16[256], @wszProductDescription : UInt16[256])
    end
  end

  def dRMSetGlobalOptions(eGlobalOptions : Win32cr::Data::RightsManagement::DRMGLOBALOPTIONS, pvdata : Void*, dwlen : UInt32) : Win32cr::Foundation::HRESULT
    C.DRMSetGlobalOptions(eGlobalOptions, pvdata, dwlen)
  end

  def dRMGetClientVersion(pDRMClientVersionInfo : Win32cr::Data::RightsManagement::DRM_CLIENT_VERSION_INFO*) : Win32cr::Foundation::HRESULT
    C.DRMGetClientVersion(pDRMClientVersionInfo)
  end

  def dRMInitEnvironment(eSecurityProviderType : Win32cr::Data::RightsManagement::DRMSECURITYPROVIDERTYPE, eSpecification : Win32cr::Data::RightsManagement::DRMSPECTYPE, wszSecurityProvider : Win32cr::Foundation::PWSTR, wszManifestCredentials : Win32cr::Foundation::PWSTR, wszMachineCredentials : Win32cr::Foundation::PWSTR, phEnv : UInt32*, phDefaultLibrary : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMInitEnvironment(eSecurityProviderType, eSpecification, wszSecurityProvider, wszManifestCredentials, wszMachineCredentials, phEnv, phDefaultLibrary)
  end

  def dRMLoadLibrary(hEnv : UInt32, eSpecification : Win32cr::Data::RightsManagement::DRMSPECTYPE, wszLibraryProvider : Win32cr::Foundation::PWSTR, wszCredentials : Win32cr::Foundation::PWSTR, phLibrary : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMLoadLibrary(hEnv, eSpecification, wszLibraryProvider, wszCredentials, phLibrary)
  end

  def dRMCreateEnablingPrincipal(hEnv : UInt32, hLibrary : UInt32, wszObject : Win32cr::Foundation::PWSTR, pidPrincipal : Win32cr::Data::RightsManagement::DRMID*, wszCredentials : Win32cr::Foundation::PWSTR, phEnablingPrincipal : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMCreateEnablingPrincipal(hEnv, hLibrary, wszObject, pidPrincipal, wszCredentials, phEnablingPrincipal)
  end

  def dRMCloseHandle(handle : UInt32) : Win32cr::Foundation::HRESULT
    C.DRMCloseHandle(handle)
  end

  def dRMCloseEnvironmentHandle(hEnv : UInt32) : Win32cr::Foundation::HRESULT
    C.DRMCloseEnvironmentHandle(hEnv)
  end

  def dRMDuplicateHandle(hToCopy : UInt32, phCopy : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMDuplicateHandle(hToCopy, phCopy)
  end

  def dRMDuplicateEnvironmentHandle(hToCopy : UInt32, phCopy : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMDuplicateEnvironmentHandle(hToCopy, phCopy)
  end

  def dRMRegisterRevocationList(hEnv : UInt32, wszRevocationList : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.DRMRegisterRevocationList(hEnv, wszRevocationList)
  end

  def dRMCheckSecurity(hEnv : UInt32, cLevel : UInt32) : Win32cr::Foundation::HRESULT
    C.DRMCheckSecurity(hEnv, cLevel)
  end

  def dRMRegisterContent(fRegister : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.DRMRegisterContent(fRegister)
  end

  def dRMEncrypt(hCryptoProvider : UInt32, iPosition : UInt32, cNumInBytes : UInt32, pbInData : UInt8*, pcNumOutBytes : UInt32*, pbOutData : UInt8*) : Win32cr::Foundation::HRESULT
    C.DRMEncrypt(hCryptoProvider, iPosition, cNumInBytes, pbInData, pcNumOutBytes, pbOutData)
  end

  def dRMDecrypt(hCryptoProvider : UInt32, iPosition : UInt32, cNumInBytes : UInt32, pbInData : UInt8*, pcNumOutBytes : UInt32*, pbOutData : UInt8*) : Win32cr::Foundation::HRESULT
    C.DRMDecrypt(hCryptoProvider, iPosition, cNumInBytes, pbInData, pcNumOutBytes, pbOutData)
  end

  def dRMCreateBoundLicense(hEnv : UInt32, pParams : Win32cr::Data::RightsManagement::DRMBOUNDLICENSEPARAMS*, wszLicenseChain : Win32cr::Foundation::PWSTR, phBoundLicense : UInt32*, phErrorLog : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMCreateBoundLicense(hEnv, pParams, wszLicenseChain, phBoundLicense, phErrorLog)
  end

  def dRMCreateEnablingBitsDecryptor(hBoundLicense : UInt32, wszRight : Win32cr::Foundation::PWSTR, hAuxLib : UInt32, wszAuxPlug : Win32cr::Foundation::PWSTR, phDecryptor : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMCreateEnablingBitsDecryptor(hBoundLicense, wszRight, hAuxLib, wszAuxPlug, phDecryptor)
  end

  def dRMCreateEnablingBitsEncryptor(hBoundLicense : UInt32, wszRight : Win32cr::Foundation::PWSTR, hAuxLib : UInt32, wszAuxPlug : Win32cr::Foundation::PWSTR, phEncryptor : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMCreateEnablingBitsEncryptor(hBoundLicense, wszRight, hAuxLib, wszAuxPlug, phEncryptor)
  end

  def dRMAttest(hEnablingPrincipal : UInt32, wszData : Win32cr::Foundation::PWSTR, eType : Win32cr::Data::RightsManagement::DRMATTESTTYPE, pcAttestedBlob : UInt32*, wszAttestedBlob : UInt16*) : Win32cr::Foundation::HRESULT
    C.DRMAttest(hEnablingPrincipal, wszData, eType, pcAttestedBlob, wszAttestedBlob)
  end

  def dRMGetTime(hEnv : UInt32, eTimerIdType : Win32cr::Data::RightsManagement::DRMTIMETYPE, poTimeObject : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
    C.DRMGetTime(hEnv, eTimerIdType, poTimeObject)
  end

  def dRMGetInfo(handle : UInt32, wszAttribute : Win32cr::Foundation::PWSTR, peEncoding : Win32cr::Data::RightsManagement::DRMENCODINGTYPE*, pcBuffer : UInt32*, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
    C.DRMGetInfo(handle, wszAttribute, peEncoding, pcBuffer, pbBuffer)
  end

  def dRMGetEnvironmentInfo(handle : UInt32, wszAttribute : Win32cr::Foundation::PWSTR, peEncoding : Win32cr::Data::RightsManagement::DRMENCODINGTYPE*, pcBuffer : UInt32*, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
    C.DRMGetEnvironmentInfo(handle, wszAttribute, peEncoding, pcBuffer, pbBuffer)
  end

  def dRMGetProcAddress(hLibrary : UInt32, wszProcName : Win32cr::Foundation::PWSTR, ppfnProcAddress : Win32cr::Foundation::FARPROC*) : Win32cr::Foundation::HRESULT
    C.DRMGetProcAddress(hLibrary, wszProcName, ppfnProcAddress)
  end

  def dRMGetBoundLicenseObjectCount(hQueryRoot : UInt32, wszSubObjectType : Win32cr::Foundation::PWSTR, pcSubObjects : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMGetBoundLicenseObjectCount(hQueryRoot, wszSubObjectType, pcSubObjects)
  end

  def dRMGetBoundLicenseObject(hQueryRoot : UInt32, wszSubObjectType : Win32cr::Foundation::PWSTR, iWhich : UInt32, phSubObject : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMGetBoundLicenseObject(hQueryRoot, wszSubObjectType, iWhich, phSubObject)
  end

  def dRMGetBoundLicenseAttributeCount(hQueryRoot : UInt32, wszAttribute : Win32cr::Foundation::PWSTR, pcAttributes : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMGetBoundLicenseAttributeCount(hQueryRoot, wszAttribute, pcAttributes)
  end

  def dRMGetBoundLicenseAttribute(hQueryRoot : UInt32, wszAttribute : Win32cr::Foundation::PWSTR, iWhich : UInt32, peEncoding : Win32cr::Data::RightsManagement::DRMENCODINGTYPE*, pcBuffer : UInt32*, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
    C.DRMGetBoundLicenseAttribute(hQueryRoot, wszAttribute, iWhich, peEncoding, pcBuffer, pbBuffer)
  end

  def dRMCreateClientSession(pfnCallback : Win32cr::Data::RightsManagement::DRMCALLBACK, uCallbackVersion : UInt32, wszGroupIDProviderType : Win32cr::Foundation::PWSTR, wszGroupID : Win32cr::Foundation::PWSTR, phClient : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMCreateClientSession(pfnCallback, uCallbackVersion, wszGroupIDProviderType, wszGroupID, phClient)
  end

  def dRMIsActivated(hClient : UInt32, uFlags : UInt32, pActServInfo : Win32cr::Data::RightsManagement::DRM_ACTSERV_INFO*) : Win32cr::Foundation::HRESULT
    C.DRMIsActivated(hClient, uFlags, pActServInfo)
  end

  def dRMActivate(hClient : UInt32, uFlags : UInt32, uLangID : UInt32, pActServInfo : Win32cr::Data::RightsManagement::DRM_ACTSERV_INFO*, pvContext : Void*, hParentWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
    C.DRMActivate(hClient, uFlags, uLangID, pActServInfo, pvContext, hParentWnd)
  end

  def dRMGetServiceLocation(hClient : UInt32, uServiceType : UInt32, uServiceLocation : UInt32, wszIssuanceLicense : Win32cr::Foundation::PWSTR, puServiceURLLength : UInt32*, wszServiceURL : UInt16*) : Win32cr::Foundation::HRESULT
    C.DRMGetServiceLocation(hClient, uServiceType, uServiceLocation, wszIssuanceLicense, puServiceURLLength, wszServiceURL)
  end

  def dRMCreateLicenseStorageSession(hEnv : UInt32, hDefaultLibrary : UInt32, hClient : UInt32, uFlags : UInt32, wszIssuanceLicense : Win32cr::Foundation::PWSTR, phLicenseStorage : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMCreateLicenseStorageSession(hEnv, hDefaultLibrary, hClient, uFlags, wszIssuanceLicense, phLicenseStorage)
  end

  def dRMAddLicense(hLicenseStorage : UInt32, uFlags : UInt32, wszLicense : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.DRMAddLicense(hLicenseStorage, uFlags, wszLicense)
  end

  def dRMAcquireAdvisories(hLicenseStorage : UInt32, wszLicense : Win32cr::Foundation::PWSTR, wszURL : Win32cr::Foundation::PWSTR, pvContext : Void*) : Win32cr::Foundation::HRESULT
    C.DRMAcquireAdvisories(hLicenseStorage, wszLicense, wszURL, pvContext)
  end

  def dRMEnumerateLicense(hSession : UInt32, uFlags : UInt32, uIndex : UInt32, pfSharedFlag : Win32cr::Foundation::BOOL*, puCertificateDataLen : UInt32*, wszCertificateData : UInt16*) : Win32cr::Foundation::HRESULT
    C.DRMEnumerateLicense(hSession, uFlags, uIndex, pfSharedFlag, puCertificateDataLen, wszCertificateData)
  end

  def dRMAcquireLicense(hSession : UInt32, uFlags : UInt32, wszGroupIdentityCredential : Win32cr::Foundation::PWSTR, wszRequestedRights : Win32cr::Foundation::PWSTR, wszCustomData : Win32cr::Foundation::PWSTR, wszURL : Win32cr::Foundation::PWSTR, pvContext : Void*) : Win32cr::Foundation::HRESULT
    C.DRMAcquireLicense(hSession, uFlags, wszGroupIdentityCredential, wszRequestedRights, wszCustomData, wszURL, pvContext)
  end

  def dRMDeleteLicense(hSession : UInt32, wszLicenseId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.DRMDeleteLicense(hSession, wszLicenseId)
  end

  def dRMCloseSession(hSession : UInt32) : Win32cr::Foundation::HRESULT
    C.DRMCloseSession(hSession)
  end

  def dRMDuplicateSession(hSessionIn : UInt32, phSessionOut : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMDuplicateSession(hSessionIn, phSessionOut)
  end

  def dRMGetSecurityProvider(uFlags : UInt32, puTypeLen : UInt32*, wszType : UInt16*, puPathLen : UInt32*, wszPath : UInt16*) : Win32cr::Foundation::HRESULT
    C.DRMGetSecurityProvider(uFlags, puTypeLen, wszType, puPathLen, wszPath)
  end

  def dRMEncode(wszAlgID : Win32cr::Foundation::PWSTR, uDataLen : UInt32, pbDecodedData : UInt8*, puEncodedStringLen : UInt32*, wszEncodedString : UInt16*) : Win32cr::Foundation::HRESULT
    C.DRMEncode(wszAlgID, uDataLen, pbDecodedData, puEncodedStringLen, wszEncodedString)
  end

  def dRMDecode(wszAlgID : Win32cr::Foundation::PWSTR, wszEncodedString : Win32cr::Foundation::PWSTR, puDecodedDataLen : UInt32*, pbDecodedData : UInt8*) : Win32cr::Foundation::HRESULT
    C.DRMDecode(wszAlgID, wszEncodedString, puDecodedDataLen, pbDecodedData)
  end

  def dRMConstructCertificateChain(cCertificates : UInt32, rgwszCertificates : Win32cr::Foundation::PWSTR*, pcChain : UInt32*, wszChain : UInt16*) : Win32cr::Foundation::HRESULT
    C.DRMConstructCertificateChain(cCertificates, rgwszCertificates, pcChain, wszChain)
  end

  def dRMParseUnboundLicense(wszCertificate : Win32cr::Foundation::PWSTR, phQueryRoot : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMParseUnboundLicense(wszCertificate, phQueryRoot)
  end

  def dRMCloseQueryHandle(hQuery : UInt32) : Win32cr::Foundation::HRESULT
    C.DRMCloseQueryHandle(hQuery)
  end

  def dRMGetUnboundLicenseObjectCount(hQueryRoot : UInt32, wszSubObjectType : Win32cr::Foundation::PWSTR, pcSubObjects : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMGetUnboundLicenseObjectCount(hQueryRoot, wszSubObjectType, pcSubObjects)
  end

  def dRMGetUnboundLicenseObject(hQueryRoot : UInt32, wszSubObjectType : Win32cr::Foundation::PWSTR, iIndex : UInt32, phSubQuery : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMGetUnboundLicenseObject(hQueryRoot, wszSubObjectType, iIndex, phSubQuery)
  end

  def dRMGetUnboundLicenseAttributeCount(hQueryRoot : UInt32, wszAttributeType : Win32cr::Foundation::PWSTR, pcAttributes : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMGetUnboundLicenseAttributeCount(hQueryRoot, wszAttributeType, pcAttributes)
  end

  def dRMGetUnboundLicenseAttribute(hQueryRoot : UInt32, wszAttributeType : Win32cr::Foundation::PWSTR, iWhich : UInt32, peEncoding : Win32cr::Data::RightsManagement::DRMENCODINGTYPE*, pcBuffer : UInt32*, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT
    C.DRMGetUnboundLicenseAttribute(hQueryRoot, wszAttributeType, iWhich, peEncoding, pcBuffer, pbBuffer)
  end

  def dRMGetCertificateChainCount(wszChain : Win32cr::Foundation::PWSTR, pcCertCount : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMGetCertificateChainCount(wszChain, pcCertCount)
  end

  def dRMDeconstructCertificateChain(wszChain : Win32cr::Foundation::PWSTR, iWhich : UInt32, pcCert : UInt32*, wszCert : UInt16*) : Win32cr::Foundation::HRESULT
    C.DRMDeconstructCertificateChain(wszChain, iWhich, pcCert, wszCert)
  end

  def dRMVerify(wszData : Win32cr::Foundation::PWSTR, pcAttestedData : UInt32*, wszAttestedData : UInt16*, peType : Win32cr::Data::RightsManagement::DRMATTESTTYPE*, pcPrincipal : UInt32*, wszPrincipal : UInt16*, pcManifest : UInt32*, wszManifest : UInt16*) : Win32cr::Foundation::HRESULT
    C.DRMVerify(wszData, pcAttestedData, wszAttestedData, peType, pcPrincipal, wszPrincipal, pcManifest, wszManifest)
  end

  def dRMCreateUser(wszUserName : Win32cr::Foundation::PWSTR, wszUserId : Win32cr::Foundation::PWSTR, wszUserIdType : Win32cr::Foundation::PWSTR, phUser : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMCreateUser(wszUserName, wszUserId, wszUserIdType, phUser)
  end

  def dRMCreateRight(wszRightName : Win32cr::Foundation::PWSTR, pstFrom : Win32cr::Foundation::SYSTEMTIME*, pstUntil : Win32cr::Foundation::SYSTEMTIME*, cExtendedInfo : UInt32, pwszExtendedInfoName : Win32cr::Foundation::PWSTR*, pwszExtendedInfoValue : Win32cr::Foundation::PWSTR*, phRight : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMCreateRight(wszRightName, pstFrom, pstUntil, cExtendedInfo, pwszExtendedInfoName, pwszExtendedInfoValue, phRight)
  end

  def dRMCreateIssuanceLicense(pstTimeFrom : Win32cr::Foundation::SYSTEMTIME*, pstTimeUntil : Win32cr::Foundation::SYSTEMTIME*, wszReferralInfoName : Win32cr::Foundation::PWSTR, wszReferralInfoURL : Win32cr::Foundation::PWSTR, hOwner : UInt32, wszIssuanceLicense : Win32cr::Foundation::PWSTR, hBoundLicense : UInt32, phIssuanceLicense : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMCreateIssuanceLicense(pstTimeFrom, pstTimeUntil, wszReferralInfoName, wszReferralInfoURL, hOwner, wszIssuanceLicense, hBoundLicense, phIssuanceLicense)
  end

  def dRMAddRightWithUser(hIssuanceLicense : UInt32, hRight : UInt32, hUser : UInt32) : Win32cr::Foundation::HRESULT
    C.DRMAddRightWithUser(hIssuanceLicense, hRight, hUser)
  end

  def dRMClearAllRights(hIssuanceLicense : UInt32) : Win32cr::Foundation::HRESULT
    C.DRMClearAllRights(hIssuanceLicense)
  end

  def dRMSetMetaData(hIssuanceLicense : UInt32, wszContentId : Win32cr::Foundation::PWSTR, wszContentIdType : Win32cr::Foundation::PWSTR, wszSKUId : Win32cr::Foundation::PWSTR, wszSKUIdType : Win32cr::Foundation::PWSTR, wszContentType : Win32cr::Foundation::PWSTR, wszContentName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.DRMSetMetaData(hIssuanceLicense, wszContentId, wszContentIdType, wszSKUId, wszSKUIdType, wszContentType, wszContentName)
  end

  def dRMSetUsagePolicy(hIssuanceLicense : UInt32, eUsagePolicyType : Win32cr::Data::RightsManagement::DRM_USAGEPOLICY_TYPE, fDelete : Win32cr::Foundation::BOOL, fExclusion : Win32cr::Foundation::BOOL, wszName : Win32cr::Foundation::PWSTR, wszMinVersion : Win32cr::Foundation::PWSTR, wszMaxVersion : Win32cr::Foundation::PWSTR, wszPublicKey : Win32cr::Foundation::PWSTR, wszDigestAlgorithm : Win32cr::Foundation::PWSTR, pbDigest : UInt8*, cbDigest : UInt32) : Win32cr::Foundation::HRESULT
    C.DRMSetUsagePolicy(hIssuanceLicense, eUsagePolicyType, fDelete, fExclusion, wszName, wszMinVersion, wszMaxVersion, wszPublicKey, wszDigestAlgorithm, pbDigest, cbDigest)
  end

  def dRMSetRevocationPoint(hIssuanceLicense : UInt32, fDelete : Win32cr::Foundation::BOOL, wszId : Win32cr::Foundation::PWSTR, wszIdType : Win32cr::Foundation::PWSTR, wszURL : Win32cr::Foundation::PWSTR, pstFrequency : Win32cr::Foundation::SYSTEMTIME*, wszName : Win32cr::Foundation::PWSTR, wszPublicKey : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.DRMSetRevocationPoint(hIssuanceLicense, fDelete, wszId, wszIdType, wszURL, pstFrequency, wszName, wszPublicKey)
  end

  def dRMSetApplicationSpecificData(hIssuanceLicense : UInt32, fDelete : Win32cr::Foundation::BOOL, wszName : Win32cr::Foundation::PWSTR, wszValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.DRMSetApplicationSpecificData(hIssuanceLicense, fDelete, wszName, wszValue)
  end

  def dRMSetNameAndDescription(hIssuanceLicense : UInt32, fDelete : Win32cr::Foundation::BOOL, lcid : UInt32, wszName : Win32cr::Foundation::PWSTR, wszDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
    C.DRMSetNameAndDescription(hIssuanceLicense, fDelete, lcid, wszName, wszDescription)
  end

  def dRMSetIntervalTime(hIssuanceLicense : UInt32, cDays : UInt32) : Win32cr::Foundation::HRESULT
    C.DRMSetIntervalTime(hIssuanceLicense, cDays)
  end

  def dRMGetIssuanceLicenseTemplate(hIssuanceLicense : UInt32, puIssuanceLicenseTemplateLength : UInt32*, wszIssuanceLicenseTemplate : UInt16*) : Win32cr::Foundation::HRESULT
    C.DRMGetIssuanceLicenseTemplate(hIssuanceLicense, puIssuanceLicenseTemplateLength, wszIssuanceLicenseTemplate)
  end

  def dRMGetSignedIssuanceLicense(hEnv : UInt32, hIssuanceLicense : UInt32, uFlags : UInt32, pbSymKey : UInt8*, cbSymKey : UInt32, wszSymKeyType : Win32cr::Foundation::PWSTR, wszClientLicensorCertificate : Win32cr::Foundation::PWSTR, pfnCallback : Win32cr::Data::RightsManagement::DRMCALLBACK, wszURL : Win32cr::Foundation::PWSTR, pvContext : Void*) : Win32cr::Foundation::HRESULT
    C.DRMGetSignedIssuanceLicense(hEnv, hIssuanceLicense, uFlags, pbSymKey, cbSymKey, wszSymKeyType, wszClientLicensorCertificate, pfnCallback, wszURL, pvContext)
  end

  def dRMGetSignedIssuanceLicenseEx(hEnv : UInt32, hIssuanceLicense : UInt32, uFlags : UInt32, pbSymKey : UInt8*, cbSymKey : UInt32, wszSymKeyType : Win32cr::Foundation::PWSTR, pvReserved : Void*, hEnablingPrincipal : UInt32, hBoundLicenseCLC : UInt32, pfnCallback : Win32cr::Data::RightsManagement::DRMCALLBACK, pvContext : Void*) : Win32cr::Foundation::HRESULT
    C.DRMGetSignedIssuanceLicenseEx(hEnv, hIssuanceLicense, uFlags, pbSymKey, cbSymKey, wszSymKeyType, pvReserved, hEnablingPrincipal, hBoundLicenseCLC, pfnCallback, pvContext)
  end

  def dRMClosePubHandle(hPub : UInt32) : Win32cr::Foundation::HRESULT
    C.DRMClosePubHandle(hPub)
  end

  def dRMDuplicatePubHandle(hPubIn : UInt32, phPubOut : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMDuplicatePubHandle(hPubIn, phPubOut)
  end

  def dRMGetUserInfo(hUser : UInt32, puUserNameLength : UInt32*, wszUserName : UInt16*, puUserIdLength : UInt32*, wszUserId : UInt16*, puUserIdTypeLength : UInt32*, wszUserIdType : UInt16*) : Win32cr::Foundation::HRESULT
    C.DRMGetUserInfo(hUser, puUserNameLength, wszUserName, puUserIdLength, wszUserId, puUserIdTypeLength, wszUserIdType)
  end

  def dRMGetRightInfo(hRight : UInt32, puRightNameLength : UInt32*, wszRightName : UInt16*, pstFrom : Win32cr::Foundation::SYSTEMTIME*, pstUntil : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT
    C.DRMGetRightInfo(hRight, puRightNameLength, wszRightName, pstFrom, pstUntil)
  end

  def dRMGetRightExtendedInfo(hRight : UInt32, uIndex : UInt32, puExtendedInfoNameLength : UInt32*, wszExtendedInfoName : UInt16*, puExtendedInfoValueLength : UInt32*, wszExtendedInfoValue : UInt16*) : Win32cr::Foundation::HRESULT
    C.DRMGetRightExtendedInfo(hRight, uIndex, puExtendedInfoNameLength, wszExtendedInfoName, puExtendedInfoValueLength, wszExtendedInfoValue)
  end

  def dRMGetUsers(hIssuanceLicense : UInt32, uIndex : UInt32, phUser : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMGetUsers(hIssuanceLicense, uIndex, phUser)
  end

  def dRMGetUserRights(hIssuanceLicense : UInt32, hUser : UInt32, uIndex : UInt32, phRight : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMGetUserRights(hIssuanceLicense, hUser, uIndex, phRight)
  end

  def dRMGetMetaData(hIssuanceLicense : UInt32, puContentIdLength : UInt32*, wszContentId : UInt16*, puContentIdTypeLength : UInt32*, wszContentIdType : UInt16*, puSKUIdLength : UInt32*, wszSKUId : UInt16*, puSKUIdTypeLength : UInt32*, wszSKUIdType : UInt16*, puContentTypeLength : UInt32*, wszContentType : UInt16*, puContentNameLength : UInt32*, wszContentName : UInt16*) : Win32cr::Foundation::HRESULT
    C.DRMGetMetaData(hIssuanceLicense, puContentIdLength, wszContentId, puContentIdTypeLength, wszContentIdType, puSKUIdLength, wszSKUId, puSKUIdTypeLength, wszSKUIdType, puContentTypeLength, wszContentType, puContentNameLength, wszContentName)
  end

  def dRMGetApplicationSpecificData(hIssuanceLicense : UInt32, uIndex : UInt32, puNameLength : UInt32*, wszName : UInt16*, puValueLength : UInt32*, wszValue : UInt16*) : Win32cr::Foundation::HRESULT
    C.DRMGetApplicationSpecificData(hIssuanceLicense, uIndex, puNameLength, wszName, puValueLength, wszValue)
  end

  def dRMGetIssuanceLicenseInfo(hIssuanceLicense : UInt32, pstTimeFrom : Win32cr::Foundation::SYSTEMTIME*, pstTimeUntil : Win32cr::Foundation::SYSTEMTIME*, uFlags : UInt32, puDistributionPointNameLength : UInt32*, wszDistributionPointName : UInt16*, puDistributionPointURLLength : UInt32*, wszDistributionPointURL : UInt16*, phOwner : UInt32*, pfOfficial : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.DRMGetIssuanceLicenseInfo(hIssuanceLicense, pstTimeFrom, pstTimeUntil, uFlags, puDistributionPointNameLength, wszDistributionPointName, puDistributionPointURLLength, wszDistributionPointURL, phOwner, pfOfficial)
  end

  def dRMGetRevocationPoint(hIssuanceLicense : UInt32, puIdLength : UInt32*, wszId : UInt16*, puIdTypeLength : UInt32*, wszIdType : UInt16*, puURLLength : UInt32*, wszRL : UInt16*, pstFrequency : Win32cr::Foundation::SYSTEMTIME*, puNameLength : UInt32*, wszName : UInt16*, puPublicKeyLength : UInt32*, wszPublicKey : UInt16*) : Win32cr::Foundation::HRESULT
    C.DRMGetRevocationPoint(hIssuanceLicense, puIdLength, wszId, puIdTypeLength, wszIdType, puURLLength, wszRL, pstFrequency, puNameLength, wszName, puPublicKeyLength, wszPublicKey)
  end

  def dRMGetUsagePolicy(hIssuanceLicense : UInt32, uIndex : UInt32, peUsagePolicyType : Win32cr::Data::RightsManagement::DRM_USAGEPOLICY_TYPE*, pfExclusion : Win32cr::Foundation::BOOL*, puNameLength : UInt32*, wszName : UInt16*, puMinVersionLength : UInt32*, wszMinVersion : UInt16*, puMaxVersionLength : UInt32*, wszMaxVersion : UInt16*, puPublicKeyLength : UInt32*, wszPublicKey : UInt16*, puDigestAlgorithmLength : UInt32*, wszDigestAlgorithm : UInt16*, pcbDigest : UInt32*, pbDigest : UInt8*) : Win32cr::Foundation::HRESULT
    C.DRMGetUsagePolicy(hIssuanceLicense, uIndex, peUsagePolicyType, pfExclusion, puNameLength, wszName, puMinVersionLength, wszMinVersion, puMaxVersionLength, wszMaxVersion, puPublicKeyLength, wszPublicKey, puDigestAlgorithmLength, wszDigestAlgorithm, pcbDigest, pbDigest)
  end

  def dRMGetNameAndDescription(hIssuanceLicense : UInt32, uIndex : UInt32, pulcid : UInt32*, puNameLength : UInt32*, wszName : UInt16*, puDescriptionLength : UInt32*, wszDescription : UInt16*) : Win32cr::Foundation::HRESULT
    C.DRMGetNameAndDescription(hIssuanceLicense, uIndex, pulcid, puNameLength, wszName, puDescriptionLength, wszDescription)
  end

  def dRMGetOwnerLicense(hIssuanceLicense : UInt32, puOwnerLicenseLength : UInt32*, wszOwnerLicense : UInt16*) : Win32cr::Foundation::HRESULT
    C.DRMGetOwnerLicense(hIssuanceLicense, puOwnerLicenseLength, wszOwnerLicense)
  end

  def dRMGetIntervalTime(hIssuanceLicense : UInt32, pcDays : UInt32*) : Win32cr::Foundation::HRESULT
    C.DRMGetIntervalTime(hIssuanceLicense, pcDays)
  end

  def dRMRepair : Win32cr::Foundation::HRESULT
    C.DRMRepair
  end

  def dRMRegisterProtectedWindow(hEnv : UInt32, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
    C.DRMRegisterProtectedWindow(hEnv, hwnd)
  end

  def dRMIsWindowProtected(hwnd : Win32cr::Foundation::HWND, pfProtected : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.DRMIsWindowProtected(hwnd, pfProtected)
  end

  def dRMAcquireIssuanceLicenseTemplate(hClient : UInt32, uFlags : UInt32, pvReserved : Void*, cTemplates : UInt32, pwszTemplateIds : Win32cr::Foundation::PWSTR*, wszUrl : Win32cr::Foundation::PWSTR, pvContext : Void*) : Win32cr::Foundation::HRESULT
    C.DRMAcquireIssuanceLicenseTemplate(hClient, uFlags, pvReserved, cTemplates, pwszTemplateIds, wszUrl, pvContext)
  end

  @[Link("msdrm")]
  lib C
    # :nodoc:
    fun DRMSetGlobalOptions(eGlobalOptions : Win32cr::Data::RightsManagement::DRMGLOBALOPTIONS, pvdata : Void*, dwlen : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetClientVersion(pDRMClientVersionInfo : Win32cr::Data::RightsManagement::DRM_CLIENT_VERSION_INFO*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMInitEnvironment(eSecurityProviderType : Win32cr::Data::RightsManagement::DRMSECURITYPROVIDERTYPE, eSpecification : Win32cr::Data::RightsManagement::DRMSPECTYPE, wszSecurityProvider : Win32cr::Foundation::PWSTR, wszManifestCredentials : Win32cr::Foundation::PWSTR, wszMachineCredentials : Win32cr::Foundation::PWSTR, phEnv : UInt32*, phDefaultLibrary : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMLoadLibrary(hEnv : UInt32, eSpecification : Win32cr::Data::RightsManagement::DRMSPECTYPE, wszLibraryProvider : Win32cr::Foundation::PWSTR, wszCredentials : Win32cr::Foundation::PWSTR, phLibrary : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMCreateEnablingPrincipal(hEnv : UInt32, hLibrary : UInt32, wszObject : Win32cr::Foundation::PWSTR, pidPrincipal : Win32cr::Data::RightsManagement::DRMID*, wszCredentials : Win32cr::Foundation::PWSTR, phEnablingPrincipal : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMCloseHandle(handle : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMCloseEnvironmentHandle(hEnv : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMDuplicateHandle(hToCopy : UInt32, phCopy : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMDuplicateEnvironmentHandle(hToCopy : UInt32, phCopy : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMRegisterRevocationList(hEnv : UInt32, wszRevocationList : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMCheckSecurity(hEnv : UInt32, cLevel : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMRegisterContent(fRegister : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMEncrypt(hCryptoProvider : UInt32, iPosition : UInt32, cNumInBytes : UInt32, pbInData : UInt8*, pcNumOutBytes : UInt32*, pbOutData : UInt8*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMDecrypt(hCryptoProvider : UInt32, iPosition : UInt32, cNumInBytes : UInt32, pbInData : UInt8*, pcNumOutBytes : UInt32*, pbOutData : UInt8*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMCreateBoundLicense(hEnv : UInt32, pParams : Win32cr::Data::RightsManagement::DRMBOUNDLICENSEPARAMS*, wszLicenseChain : Win32cr::Foundation::PWSTR, phBoundLicense : UInt32*, phErrorLog : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMCreateEnablingBitsDecryptor(hBoundLicense : UInt32, wszRight : Win32cr::Foundation::PWSTR, hAuxLib : UInt32, wszAuxPlug : Win32cr::Foundation::PWSTR, phDecryptor : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMCreateEnablingBitsEncryptor(hBoundLicense : UInt32, wszRight : Win32cr::Foundation::PWSTR, hAuxLib : UInt32, wszAuxPlug : Win32cr::Foundation::PWSTR, phEncryptor : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMAttest(hEnablingPrincipal : UInt32, wszData : Win32cr::Foundation::PWSTR, eType : Win32cr::Data::RightsManagement::DRMATTESTTYPE, pcAttestedBlob : UInt32*, wszAttestedBlob : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetTime(hEnv : UInt32, eTimerIdType : Win32cr::Data::RightsManagement::DRMTIMETYPE, poTimeObject : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetInfo(handle : UInt32, wszAttribute : Win32cr::Foundation::PWSTR, peEncoding : Win32cr::Data::RightsManagement::DRMENCODINGTYPE*, pcBuffer : UInt32*, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetEnvironmentInfo(handle : UInt32, wszAttribute : Win32cr::Foundation::PWSTR, peEncoding : Win32cr::Data::RightsManagement::DRMENCODINGTYPE*, pcBuffer : UInt32*, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetProcAddress(hLibrary : UInt32, wszProcName : Win32cr::Foundation::PWSTR, ppfnProcAddress : Win32cr::Foundation::FARPROC*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetBoundLicenseObjectCount(hQueryRoot : UInt32, wszSubObjectType : Win32cr::Foundation::PWSTR, pcSubObjects : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetBoundLicenseObject(hQueryRoot : UInt32, wszSubObjectType : Win32cr::Foundation::PWSTR, iWhich : UInt32, phSubObject : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetBoundLicenseAttributeCount(hQueryRoot : UInt32, wszAttribute : Win32cr::Foundation::PWSTR, pcAttributes : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetBoundLicenseAttribute(hQueryRoot : UInt32, wszAttribute : Win32cr::Foundation::PWSTR, iWhich : UInt32, peEncoding : Win32cr::Data::RightsManagement::DRMENCODINGTYPE*, pcBuffer : UInt32*, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMCreateClientSession(pfnCallback : Win32cr::Data::RightsManagement::DRMCALLBACK, uCallbackVersion : UInt32, wszGroupIDProviderType : Win32cr::Foundation::PWSTR, wszGroupID : Win32cr::Foundation::PWSTR, phClient : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMIsActivated(hClient : UInt32, uFlags : UInt32, pActServInfo : Win32cr::Data::RightsManagement::DRM_ACTSERV_INFO*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMActivate(hClient : UInt32, uFlags : UInt32, uLangID : UInt32, pActServInfo : Win32cr::Data::RightsManagement::DRM_ACTSERV_INFO*, pvContext : Void*, hParentWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetServiceLocation(hClient : UInt32, uServiceType : UInt32, uServiceLocation : UInt32, wszIssuanceLicense : Win32cr::Foundation::PWSTR, puServiceURLLength : UInt32*, wszServiceURL : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMCreateLicenseStorageSession(hEnv : UInt32, hDefaultLibrary : UInt32, hClient : UInt32, uFlags : UInt32, wszIssuanceLicense : Win32cr::Foundation::PWSTR, phLicenseStorage : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMAddLicense(hLicenseStorage : UInt32, uFlags : UInt32, wszLicense : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMAcquireAdvisories(hLicenseStorage : UInt32, wszLicense : Win32cr::Foundation::PWSTR, wszURL : Win32cr::Foundation::PWSTR, pvContext : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMEnumerateLicense(hSession : UInt32, uFlags : UInt32, uIndex : UInt32, pfSharedFlag : Win32cr::Foundation::BOOL*, puCertificateDataLen : UInt32*, wszCertificateData : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMAcquireLicense(hSession : UInt32, uFlags : UInt32, wszGroupIdentityCredential : Win32cr::Foundation::PWSTR, wszRequestedRights : Win32cr::Foundation::PWSTR, wszCustomData : Win32cr::Foundation::PWSTR, wszURL : Win32cr::Foundation::PWSTR, pvContext : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMDeleteLicense(hSession : UInt32, wszLicenseId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMCloseSession(hSession : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMDuplicateSession(hSessionIn : UInt32, phSessionOut : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetSecurityProvider(uFlags : UInt32, puTypeLen : UInt32*, wszType : UInt16*, puPathLen : UInt32*, wszPath : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMEncode(wszAlgID : Win32cr::Foundation::PWSTR, uDataLen : UInt32, pbDecodedData : UInt8*, puEncodedStringLen : UInt32*, wszEncodedString : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMDecode(wszAlgID : Win32cr::Foundation::PWSTR, wszEncodedString : Win32cr::Foundation::PWSTR, puDecodedDataLen : UInt32*, pbDecodedData : UInt8*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMConstructCertificateChain(cCertificates : UInt32, rgwszCertificates : Win32cr::Foundation::PWSTR*, pcChain : UInt32*, wszChain : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMParseUnboundLicense(wszCertificate : Win32cr::Foundation::PWSTR, phQueryRoot : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMCloseQueryHandle(hQuery : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetUnboundLicenseObjectCount(hQueryRoot : UInt32, wszSubObjectType : Win32cr::Foundation::PWSTR, pcSubObjects : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetUnboundLicenseObject(hQueryRoot : UInt32, wszSubObjectType : Win32cr::Foundation::PWSTR, iIndex : UInt32, phSubQuery : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetUnboundLicenseAttributeCount(hQueryRoot : UInt32, wszAttributeType : Win32cr::Foundation::PWSTR, pcAttributes : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetUnboundLicenseAttribute(hQueryRoot : UInt32, wszAttributeType : Win32cr::Foundation::PWSTR, iWhich : UInt32, peEncoding : Win32cr::Data::RightsManagement::DRMENCODINGTYPE*, pcBuffer : UInt32*, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetCertificateChainCount(wszChain : Win32cr::Foundation::PWSTR, pcCertCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMDeconstructCertificateChain(wszChain : Win32cr::Foundation::PWSTR, iWhich : UInt32, pcCert : UInt32*, wszCert : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMVerify(wszData : Win32cr::Foundation::PWSTR, pcAttestedData : UInt32*, wszAttestedData : UInt16*, peType : Win32cr::Data::RightsManagement::DRMATTESTTYPE*, pcPrincipal : UInt32*, wszPrincipal : UInt16*, pcManifest : UInt32*, wszManifest : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMCreateUser(wszUserName : Win32cr::Foundation::PWSTR, wszUserId : Win32cr::Foundation::PWSTR, wszUserIdType : Win32cr::Foundation::PWSTR, phUser : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMCreateRight(wszRightName : Win32cr::Foundation::PWSTR, pstFrom : Win32cr::Foundation::SYSTEMTIME*, pstUntil : Win32cr::Foundation::SYSTEMTIME*, cExtendedInfo : UInt32, pwszExtendedInfoName : Win32cr::Foundation::PWSTR*, pwszExtendedInfoValue : Win32cr::Foundation::PWSTR*, phRight : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMCreateIssuanceLicense(pstTimeFrom : Win32cr::Foundation::SYSTEMTIME*, pstTimeUntil : Win32cr::Foundation::SYSTEMTIME*, wszReferralInfoName : Win32cr::Foundation::PWSTR, wszReferralInfoURL : Win32cr::Foundation::PWSTR, hOwner : UInt32, wszIssuanceLicense : Win32cr::Foundation::PWSTR, hBoundLicense : UInt32, phIssuanceLicense : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMAddRightWithUser(hIssuanceLicense : UInt32, hRight : UInt32, hUser : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMClearAllRights(hIssuanceLicense : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMSetMetaData(hIssuanceLicense : UInt32, wszContentId : Win32cr::Foundation::PWSTR, wszContentIdType : Win32cr::Foundation::PWSTR, wszSKUId : Win32cr::Foundation::PWSTR, wszSKUIdType : Win32cr::Foundation::PWSTR, wszContentType : Win32cr::Foundation::PWSTR, wszContentName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMSetUsagePolicy(hIssuanceLicense : UInt32, eUsagePolicyType : Win32cr::Data::RightsManagement::DRM_USAGEPOLICY_TYPE, fDelete : Win32cr::Foundation::BOOL, fExclusion : Win32cr::Foundation::BOOL, wszName : Win32cr::Foundation::PWSTR, wszMinVersion : Win32cr::Foundation::PWSTR, wszMaxVersion : Win32cr::Foundation::PWSTR, wszPublicKey : Win32cr::Foundation::PWSTR, wszDigestAlgorithm : Win32cr::Foundation::PWSTR, pbDigest : UInt8*, cbDigest : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMSetRevocationPoint(hIssuanceLicense : UInt32, fDelete : Win32cr::Foundation::BOOL, wszId : Win32cr::Foundation::PWSTR, wszIdType : Win32cr::Foundation::PWSTR, wszURL : Win32cr::Foundation::PWSTR, pstFrequency : Win32cr::Foundation::SYSTEMTIME*, wszName : Win32cr::Foundation::PWSTR, wszPublicKey : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMSetApplicationSpecificData(hIssuanceLicense : UInt32, fDelete : Win32cr::Foundation::BOOL, wszName : Win32cr::Foundation::PWSTR, wszValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMSetNameAndDescription(hIssuanceLicense : UInt32, fDelete : Win32cr::Foundation::BOOL, lcid : UInt32, wszName : Win32cr::Foundation::PWSTR, wszDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMSetIntervalTime(hIssuanceLicense : UInt32, cDays : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetIssuanceLicenseTemplate(hIssuanceLicense : UInt32, puIssuanceLicenseTemplateLength : UInt32*, wszIssuanceLicenseTemplate : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetSignedIssuanceLicense(hEnv : UInt32, hIssuanceLicense : UInt32, uFlags : UInt32, pbSymKey : UInt8*, cbSymKey : UInt32, wszSymKeyType : Win32cr::Foundation::PWSTR, wszClientLicensorCertificate : Win32cr::Foundation::PWSTR, pfnCallback : Win32cr::Data::RightsManagement::DRMCALLBACK, wszURL : Win32cr::Foundation::PWSTR, pvContext : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetSignedIssuanceLicenseEx(hEnv : UInt32, hIssuanceLicense : UInt32, uFlags : UInt32, pbSymKey : UInt8*, cbSymKey : UInt32, wszSymKeyType : Win32cr::Foundation::PWSTR, pvReserved : Void*, hEnablingPrincipal : UInt32, hBoundLicenseCLC : UInt32, pfnCallback : Win32cr::Data::RightsManagement::DRMCALLBACK, pvContext : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMClosePubHandle(hPub : UInt32) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMDuplicatePubHandle(hPubIn : UInt32, phPubOut : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetUserInfo(hUser : UInt32, puUserNameLength : UInt32*, wszUserName : UInt16*, puUserIdLength : UInt32*, wszUserId : UInt16*, puUserIdTypeLength : UInt32*, wszUserIdType : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetRightInfo(hRight : UInt32, puRightNameLength : UInt32*, wszRightName : UInt16*, pstFrom : Win32cr::Foundation::SYSTEMTIME*, pstUntil : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetRightExtendedInfo(hRight : UInt32, uIndex : UInt32, puExtendedInfoNameLength : UInt32*, wszExtendedInfoName : UInt16*, puExtendedInfoValueLength : UInt32*, wszExtendedInfoValue : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetUsers(hIssuanceLicense : UInt32, uIndex : UInt32, phUser : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetUserRights(hIssuanceLicense : UInt32, hUser : UInt32, uIndex : UInt32, phRight : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetMetaData(hIssuanceLicense : UInt32, puContentIdLength : UInt32*, wszContentId : UInt16*, puContentIdTypeLength : UInt32*, wszContentIdType : UInt16*, puSKUIdLength : UInt32*, wszSKUId : UInt16*, puSKUIdTypeLength : UInt32*, wszSKUIdType : UInt16*, puContentTypeLength : UInt32*, wszContentType : UInt16*, puContentNameLength : UInt32*, wszContentName : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetApplicationSpecificData(hIssuanceLicense : UInt32, uIndex : UInt32, puNameLength : UInt32*, wszName : UInt16*, puValueLength : UInt32*, wszValue : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetIssuanceLicenseInfo(hIssuanceLicense : UInt32, pstTimeFrom : Win32cr::Foundation::SYSTEMTIME*, pstTimeUntil : Win32cr::Foundation::SYSTEMTIME*, uFlags : UInt32, puDistributionPointNameLength : UInt32*, wszDistributionPointName : UInt16*, puDistributionPointURLLength : UInt32*, wszDistributionPointURL : UInt16*, phOwner : UInt32*, pfOfficial : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetRevocationPoint(hIssuanceLicense : UInt32, puIdLength : UInt32*, wszId : UInt16*, puIdTypeLength : UInt32*, wszIdType : UInt16*, puURLLength : UInt32*, wszRL : UInt16*, pstFrequency : Win32cr::Foundation::SYSTEMTIME*, puNameLength : UInt32*, wszName : UInt16*, puPublicKeyLength : UInt32*, wszPublicKey : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetUsagePolicy(hIssuanceLicense : UInt32, uIndex : UInt32, peUsagePolicyType : Win32cr::Data::RightsManagement::DRM_USAGEPOLICY_TYPE*, pfExclusion : Win32cr::Foundation::BOOL*, puNameLength : UInt32*, wszName : UInt16*, puMinVersionLength : UInt32*, wszMinVersion : UInt16*, puMaxVersionLength : UInt32*, wszMaxVersion : UInt16*, puPublicKeyLength : UInt32*, wszPublicKey : UInt16*, puDigestAlgorithmLength : UInt32*, wszDigestAlgorithm : UInt16*, pcbDigest : UInt32*, pbDigest : UInt8*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetNameAndDescription(hIssuanceLicense : UInt32, uIndex : UInt32, pulcid : UInt32*, puNameLength : UInt32*, wszName : UInt16*, puDescriptionLength : UInt32*, wszDescription : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetOwnerLicense(hIssuanceLicense : UInt32, puOwnerLicenseLength : UInt32*, wszOwnerLicense : UInt16*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMGetIntervalTime(hIssuanceLicense : UInt32, pcDays : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMRepair : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMRegisterProtectedWindow(hEnv : UInt32, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMIsWindowProtected(hwnd : Win32cr::Foundation::HWND, pfProtected : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun DRMAcquireIssuanceLicenseTemplate(hClient : UInt32, uFlags : UInt32, pvReserved : Void*, cTemplates : UInt32, pwszTemplateIds : Win32cr::Foundation::PWSTR*, wszUrl : Win32cr::Foundation::PWSTR, pvContext : Void*) : Win32cr::Foundation::HRESULT

  end
end