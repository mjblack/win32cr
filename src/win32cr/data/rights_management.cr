require "./../foundation.cr"

module Win32cr::Data::RightsManagement
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

  @[Link("msdrm")]
  lib C
    fun DRMSetGlobalOptions(eGlobalOptions : Win32cr::Data::RightsManagement::DRMGLOBALOPTIONS, pvdata : Void*, dwlen : UInt32) : Win32cr::Foundation::HRESULT

    fun DRMGetClientVersion(pDRMClientVersionInfo : Win32cr::Data::RightsManagement::DRM_CLIENT_VERSION_INFO*) : Win32cr::Foundation::HRESULT

    fun DRMInitEnvironment(eSecurityProviderType : Win32cr::Data::RightsManagement::DRMSECURITYPROVIDERTYPE, eSpecification : Win32cr::Data::RightsManagement::DRMSPECTYPE, wszSecurityProvider : Win32cr::Foundation::PWSTR, wszManifestCredentials : Win32cr::Foundation::PWSTR, wszMachineCredentials : Win32cr::Foundation::PWSTR, phEnv : UInt32*, phDefaultLibrary : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMLoadLibrary(hEnv : UInt32, eSpecification : Win32cr::Data::RightsManagement::DRMSPECTYPE, wszLibraryProvider : Win32cr::Foundation::PWSTR, wszCredentials : Win32cr::Foundation::PWSTR, phLibrary : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMCreateEnablingPrincipal(hEnv : UInt32, hLibrary : UInt32, wszObject : Win32cr::Foundation::PWSTR, pidPrincipal : Win32cr::Data::RightsManagement::DRMID*, wszCredentials : Win32cr::Foundation::PWSTR, phEnablingPrincipal : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMCloseHandle(handle : UInt32) : Win32cr::Foundation::HRESULT

    fun DRMCloseEnvironmentHandle(hEnv : UInt32) : Win32cr::Foundation::HRESULT

    fun DRMDuplicateHandle(hToCopy : UInt32, phCopy : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMDuplicateEnvironmentHandle(hToCopy : UInt32, phCopy : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMRegisterRevocationList(hEnv : UInt32, wszRevocationList : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun DRMCheckSecurity(hEnv : UInt32, cLevel : UInt32) : Win32cr::Foundation::HRESULT

    fun DRMRegisterContent(fRegister : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    fun DRMEncrypt(hCryptoProvider : UInt32, iPosition : UInt32, cNumInBytes : UInt32, pbInData : UInt8*, pcNumOutBytes : UInt32*, pbOutData : UInt8*) : Win32cr::Foundation::HRESULT

    fun DRMDecrypt(hCryptoProvider : UInt32, iPosition : UInt32, cNumInBytes : UInt32, pbInData : UInt8*, pcNumOutBytes : UInt32*, pbOutData : UInt8*) : Win32cr::Foundation::HRESULT

    fun DRMCreateBoundLicense(hEnv : UInt32, pParams : Win32cr::Data::RightsManagement::DRMBOUNDLICENSEPARAMS*, wszLicenseChain : Win32cr::Foundation::PWSTR, phBoundLicense : UInt32*, phErrorLog : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMCreateEnablingBitsDecryptor(hBoundLicense : UInt32, wszRight : Win32cr::Foundation::PWSTR, hAuxLib : UInt32, wszAuxPlug : Win32cr::Foundation::PWSTR, phDecryptor : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMCreateEnablingBitsEncryptor(hBoundLicense : UInt32, wszRight : Win32cr::Foundation::PWSTR, hAuxLib : UInt32, wszAuxPlug : Win32cr::Foundation::PWSTR, phEncryptor : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMAttest(hEnablingPrincipal : UInt32, wszData : Win32cr::Foundation::PWSTR, eType : Win32cr::Data::RightsManagement::DRMATTESTTYPE, pcAttestedBlob : UInt32*, wszAttestedBlob : UInt16*) : Win32cr::Foundation::HRESULT

    fun DRMGetTime(hEnv : UInt32, eTimerIdType : Win32cr::Data::RightsManagement::DRMTIMETYPE, poTimeObject : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT

    fun DRMGetInfo(handle : UInt32, wszAttribute : Win32cr::Foundation::PWSTR, peEncoding : Win32cr::Data::RightsManagement::DRMENCODINGTYPE*, pcBuffer : UInt32*, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT

    fun DRMGetEnvironmentInfo(handle : UInt32, wszAttribute : Win32cr::Foundation::PWSTR, peEncoding : Win32cr::Data::RightsManagement::DRMENCODINGTYPE*, pcBuffer : UInt32*, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT

    fun DRMGetProcAddress(hLibrary : UInt32, wszProcName : Win32cr::Foundation::PWSTR, ppfnProcAddress : Win32cr::Foundation::FARPROC*) : Win32cr::Foundation::HRESULT

    fun DRMGetBoundLicenseObjectCount(hQueryRoot : UInt32, wszSubObjectType : Win32cr::Foundation::PWSTR, pcSubObjects : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMGetBoundLicenseObject(hQueryRoot : UInt32, wszSubObjectType : Win32cr::Foundation::PWSTR, iWhich : UInt32, phSubObject : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMGetBoundLicenseAttributeCount(hQueryRoot : UInt32, wszAttribute : Win32cr::Foundation::PWSTR, pcAttributes : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMGetBoundLicenseAttribute(hQueryRoot : UInt32, wszAttribute : Win32cr::Foundation::PWSTR, iWhich : UInt32, peEncoding : Win32cr::Data::RightsManagement::DRMENCODINGTYPE*, pcBuffer : UInt32*, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT

    fun DRMCreateClientSession(pfnCallback : Win32cr::Data::RightsManagement::DRMCALLBACK, uCallbackVersion : UInt32, wszGroupIDProviderType : Win32cr::Foundation::PWSTR, wszGroupID : Win32cr::Foundation::PWSTR, phClient : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMIsActivated(hClient : UInt32, uFlags : UInt32, pActServInfo : Win32cr::Data::RightsManagement::DRM_ACTSERV_INFO*) : Win32cr::Foundation::HRESULT

    fun DRMActivate(hClient : UInt32, uFlags : UInt32, uLangID : UInt32, pActServInfo : Win32cr::Data::RightsManagement::DRM_ACTSERV_INFO*, pvContext : Void*, hParentWnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT

    fun DRMGetServiceLocation(hClient : UInt32, uServiceType : UInt32, uServiceLocation : UInt32, wszIssuanceLicense : Win32cr::Foundation::PWSTR, puServiceURLLength : UInt32*, wszServiceURL : UInt16*) : Win32cr::Foundation::HRESULT

    fun DRMCreateLicenseStorageSession(hEnv : UInt32, hDefaultLibrary : UInt32, hClient : UInt32, uFlags : UInt32, wszIssuanceLicense : Win32cr::Foundation::PWSTR, phLicenseStorage : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMAddLicense(hLicenseStorage : UInt32, uFlags : UInt32, wszLicense : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun DRMAcquireAdvisories(hLicenseStorage : UInt32, wszLicense : Win32cr::Foundation::PWSTR, wszURL : Win32cr::Foundation::PWSTR, pvContext : Void*) : Win32cr::Foundation::HRESULT

    fun DRMEnumerateLicense(hSession : UInt32, uFlags : UInt32, uIndex : UInt32, pfSharedFlag : Win32cr::Foundation::BOOL*, puCertificateDataLen : UInt32*, wszCertificateData : UInt16*) : Win32cr::Foundation::HRESULT

    fun DRMAcquireLicense(hSession : UInt32, uFlags : UInt32, wszGroupIdentityCredential : Win32cr::Foundation::PWSTR, wszRequestedRights : Win32cr::Foundation::PWSTR, wszCustomData : Win32cr::Foundation::PWSTR, wszURL : Win32cr::Foundation::PWSTR, pvContext : Void*) : Win32cr::Foundation::HRESULT

    fun DRMDeleteLicense(hSession : UInt32, wszLicenseId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun DRMCloseSession(hSession : UInt32) : Win32cr::Foundation::HRESULT

    fun DRMDuplicateSession(hSessionIn : UInt32, phSessionOut : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMGetSecurityProvider(uFlags : UInt32, puTypeLen : UInt32*, wszType : UInt16*, puPathLen : UInt32*, wszPath : UInt16*) : Win32cr::Foundation::HRESULT

    fun DRMEncode(wszAlgID : Win32cr::Foundation::PWSTR, uDataLen : UInt32, pbDecodedData : UInt8*, puEncodedStringLen : UInt32*, wszEncodedString : UInt16*) : Win32cr::Foundation::HRESULT

    fun DRMDecode(wszAlgID : Win32cr::Foundation::PWSTR, wszEncodedString : Win32cr::Foundation::PWSTR, puDecodedDataLen : UInt32*, pbDecodedData : UInt8*) : Win32cr::Foundation::HRESULT

    fun DRMConstructCertificateChain(cCertificates : UInt32, rgwszCertificates : Win32cr::Foundation::PWSTR*, pcChain : UInt32*, wszChain : UInt16*) : Win32cr::Foundation::HRESULT

    fun DRMParseUnboundLicense(wszCertificate : Win32cr::Foundation::PWSTR, phQueryRoot : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMCloseQueryHandle(hQuery : UInt32) : Win32cr::Foundation::HRESULT

    fun DRMGetUnboundLicenseObjectCount(hQueryRoot : UInt32, wszSubObjectType : Win32cr::Foundation::PWSTR, pcSubObjects : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMGetUnboundLicenseObject(hQueryRoot : UInt32, wszSubObjectType : Win32cr::Foundation::PWSTR, iIndex : UInt32, phSubQuery : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMGetUnboundLicenseAttributeCount(hQueryRoot : UInt32, wszAttributeType : Win32cr::Foundation::PWSTR, pcAttributes : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMGetUnboundLicenseAttribute(hQueryRoot : UInt32, wszAttributeType : Win32cr::Foundation::PWSTR, iWhich : UInt32, peEncoding : Win32cr::Data::RightsManagement::DRMENCODINGTYPE*, pcBuffer : UInt32*, pbBuffer : UInt8*) : Win32cr::Foundation::HRESULT

    fun DRMGetCertificateChainCount(wszChain : Win32cr::Foundation::PWSTR, pcCertCount : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMDeconstructCertificateChain(wszChain : Win32cr::Foundation::PWSTR, iWhich : UInt32, pcCert : UInt32*, wszCert : UInt16*) : Win32cr::Foundation::HRESULT

    fun DRMVerify(wszData : Win32cr::Foundation::PWSTR, pcAttestedData : UInt32*, wszAttestedData : UInt16*, peType : Win32cr::Data::RightsManagement::DRMATTESTTYPE*, pcPrincipal : UInt32*, wszPrincipal : UInt16*, pcManifest : UInt32*, wszManifest : UInt16*) : Win32cr::Foundation::HRESULT

    fun DRMCreateUser(wszUserName : Win32cr::Foundation::PWSTR, wszUserId : Win32cr::Foundation::PWSTR, wszUserIdType : Win32cr::Foundation::PWSTR, phUser : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMCreateRight(wszRightName : Win32cr::Foundation::PWSTR, pstFrom : Win32cr::Foundation::SYSTEMTIME*, pstUntil : Win32cr::Foundation::SYSTEMTIME*, cExtendedInfo : UInt32, pwszExtendedInfoName : Win32cr::Foundation::PWSTR*, pwszExtendedInfoValue : Win32cr::Foundation::PWSTR*, phRight : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMCreateIssuanceLicense(pstTimeFrom : Win32cr::Foundation::SYSTEMTIME*, pstTimeUntil : Win32cr::Foundation::SYSTEMTIME*, wszReferralInfoName : Win32cr::Foundation::PWSTR, wszReferralInfoURL : Win32cr::Foundation::PWSTR, hOwner : UInt32, wszIssuanceLicense : Win32cr::Foundation::PWSTR, hBoundLicense : UInt32, phIssuanceLicense : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMAddRightWithUser(hIssuanceLicense : UInt32, hRight : UInt32, hUser : UInt32) : Win32cr::Foundation::HRESULT

    fun DRMClearAllRights(hIssuanceLicense : UInt32) : Win32cr::Foundation::HRESULT

    fun DRMSetMetaData(hIssuanceLicense : UInt32, wszContentId : Win32cr::Foundation::PWSTR, wszContentIdType : Win32cr::Foundation::PWSTR, wszSKUId : Win32cr::Foundation::PWSTR, wszSKUIdType : Win32cr::Foundation::PWSTR, wszContentType : Win32cr::Foundation::PWSTR, wszContentName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun DRMSetUsagePolicy(hIssuanceLicense : UInt32, eUsagePolicyType : Win32cr::Data::RightsManagement::DRM_USAGEPOLICY_TYPE, fDelete : Win32cr::Foundation::BOOL, fExclusion : Win32cr::Foundation::BOOL, wszName : Win32cr::Foundation::PWSTR, wszMinVersion : Win32cr::Foundation::PWSTR, wszMaxVersion : Win32cr::Foundation::PWSTR, wszPublicKey : Win32cr::Foundation::PWSTR, wszDigestAlgorithm : Win32cr::Foundation::PWSTR, pbDigest : UInt8*, cbDigest : UInt32) : Win32cr::Foundation::HRESULT

    fun DRMSetRevocationPoint(hIssuanceLicense : UInt32, fDelete : Win32cr::Foundation::BOOL, wszId : Win32cr::Foundation::PWSTR, wszIdType : Win32cr::Foundation::PWSTR, wszURL : Win32cr::Foundation::PWSTR, pstFrequency : Win32cr::Foundation::SYSTEMTIME*, wszName : Win32cr::Foundation::PWSTR, wszPublicKey : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun DRMSetApplicationSpecificData(hIssuanceLicense : UInt32, fDelete : Win32cr::Foundation::BOOL, wszName : Win32cr::Foundation::PWSTR, wszValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun DRMSetNameAndDescription(hIssuanceLicense : UInt32, fDelete : Win32cr::Foundation::BOOL, lcid : UInt32, wszName : Win32cr::Foundation::PWSTR, wszDescription : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun DRMSetIntervalTime(hIssuanceLicense : UInt32, cDays : UInt32) : Win32cr::Foundation::HRESULT

    fun DRMGetIssuanceLicenseTemplate(hIssuanceLicense : UInt32, puIssuanceLicenseTemplateLength : UInt32*, wszIssuanceLicenseTemplate : UInt16*) : Win32cr::Foundation::HRESULT

    fun DRMGetSignedIssuanceLicense(hEnv : UInt32, hIssuanceLicense : UInt32, uFlags : UInt32, pbSymKey : UInt8*, cbSymKey : UInt32, wszSymKeyType : Win32cr::Foundation::PWSTR, wszClientLicensorCertificate : Win32cr::Foundation::PWSTR, pfnCallback : Win32cr::Data::RightsManagement::DRMCALLBACK, wszURL : Win32cr::Foundation::PWSTR, pvContext : Void*) : Win32cr::Foundation::HRESULT

    fun DRMGetSignedIssuanceLicenseEx(hEnv : UInt32, hIssuanceLicense : UInt32, uFlags : UInt32, pbSymKey : UInt8*, cbSymKey : UInt32, wszSymKeyType : Win32cr::Foundation::PWSTR, pvReserved : Void*, hEnablingPrincipal : UInt32, hBoundLicenseCLC : UInt32, pfnCallback : Win32cr::Data::RightsManagement::DRMCALLBACK, pvContext : Void*) : Win32cr::Foundation::HRESULT

    fun DRMClosePubHandle(hPub : UInt32) : Win32cr::Foundation::HRESULT

    fun DRMDuplicatePubHandle(hPubIn : UInt32, phPubOut : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMGetUserInfo(hUser : UInt32, puUserNameLength : UInt32*, wszUserName : UInt16*, puUserIdLength : UInt32*, wszUserId : UInt16*, puUserIdTypeLength : UInt32*, wszUserIdType : UInt16*) : Win32cr::Foundation::HRESULT

    fun DRMGetRightInfo(hRight : UInt32, puRightNameLength : UInt32*, wszRightName : UInt16*, pstFrom : Win32cr::Foundation::SYSTEMTIME*, pstUntil : Win32cr::Foundation::SYSTEMTIME*) : Win32cr::Foundation::HRESULT

    fun DRMGetRightExtendedInfo(hRight : UInt32, uIndex : UInt32, puExtendedInfoNameLength : UInt32*, wszExtendedInfoName : UInt16*, puExtendedInfoValueLength : UInt32*, wszExtendedInfoValue : UInt16*) : Win32cr::Foundation::HRESULT

    fun DRMGetUsers(hIssuanceLicense : UInt32, uIndex : UInt32, phUser : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMGetUserRights(hIssuanceLicense : UInt32, hUser : UInt32, uIndex : UInt32, phRight : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMGetMetaData(hIssuanceLicense : UInt32, puContentIdLength : UInt32*, wszContentId : UInt16*, puContentIdTypeLength : UInt32*, wszContentIdType : UInt16*, puSKUIdLength : UInt32*, wszSKUId : UInt16*, puSKUIdTypeLength : UInt32*, wszSKUIdType : UInt16*, puContentTypeLength : UInt32*, wszContentType : UInt16*, puContentNameLength : UInt32*, wszContentName : UInt16*) : Win32cr::Foundation::HRESULT

    fun DRMGetApplicationSpecificData(hIssuanceLicense : UInt32, uIndex : UInt32, puNameLength : UInt32*, wszName : UInt16*, puValueLength : UInt32*, wszValue : UInt16*) : Win32cr::Foundation::HRESULT

    fun DRMGetIssuanceLicenseInfo(hIssuanceLicense : UInt32, pstTimeFrom : Win32cr::Foundation::SYSTEMTIME*, pstTimeUntil : Win32cr::Foundation::SYSTEMTIME*, uFlags : UInt32, puDistributionPointNameLength : UInt32*, wszDistributionPointName : UInt16*, puDistributionPointURLLength : UInt32*, wszDistributionPointURL : UInt16*, phOwner : UInt32*, pfOfficial : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun DRMGetRevocationPoint(hIssuanceLicense : UInt32, puIdLength : UInt32*, wszId : UInt16*, puIdTypeLength : UInt32*, wszIdType : UInt16*, puURLLength : UInt32*, wszRL : UInt16*, pstFrequency : Win32cr::Foundation::SYSTEMTIME*, puNameLength : UInt32*, wszName : UInt16*, puPublicKeyLength : UInt32*, wszPublicKey : UInt16*) : Win32cr::Foundation::HRESULT

    fun DRMGetUsagePolicy(hIssuanceLicense : UInt32, uIndex : UInt32, peUsagePolicyType : Win32cr::Data::RightsManagement::DRM_USAGEPOLICY_TYPE*, pfExclusion : Win32cr::Foundation::BOOL*, puNameLength : UInt32*, wszName : UInt16*, puMinVersionLength : UInt32*, wszMinVersion : UInt16*, puMaxVersionLength : UInt32*, wszMaxVersion : UInt16*, puPublicKeyLength : UInt32*, wszPublicKey : UInt16*, puDigestAlgorithmLength : UInt32*, wszDigestAlgorithm : UInt16*, pcbDigest : UInt32*, pbDigest : UInt8*) : Win32cr::Foundation::HRESULT

    fun DRMGetNameAndDescription(hIssuanceLicense : UInt32, uIndex : UInt32, pulcid : UInt32*, puNameLength : UInt32*, wszName : UInt16*, puDescriptionLength : UInt32*, wszDescription : UInt16*) : Win32cr::Foundation::HRESULT

    fun DRMGetOwnerLicense(hIssuanceLicense : UInt32, puOwnerLicenseLength : UInt32*, wszOwnerLicense : UInt16*) : Win32cr::Foundation::HRESULT

    fun DRMGetIntervalTime(hIssuanceLicense : UInt32, pcDays : UInt32*) : Win32cr::Foundation::HRESULT

    fun DRMRepair : Win32cr::Foundation::HRESULT

    fun DRMRegisterProtectedWindow(hEnv : UInt32, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT

    fun DRMIsWindowProtected(hwnd : Win32cr::Foundation::HWND, pfProtected : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun DRMAcquireIssuanceLicenseTemplate(hClient : UInt32, uFlags : UInt32, pvReserved : Void*, cTemplates : UInt32, pwszTemplateIds : Win32cr::Foundation::PWSTR*, wszUrl : Win32cr::Foundation::PWSTR, pvContext : Void*) : Win32cr::Foundation::HRESULT

  end
end