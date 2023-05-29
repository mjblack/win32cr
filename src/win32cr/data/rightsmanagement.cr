require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:msdrm.dll")]
lib LibWin32
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

  alias DRMCALLBACK = Proc(DRM_STATUS_MSG, HRESULT, Void*, Void*, HRESULT)


  enum DRMTIMETYPE : Int32
    DRMTIMETYPE_SYSTEMUTC = 0
    DRMTIMETYPE_SYSTEMLOCAL = 1
  end

  enum DRMENCODINGTYPE : Int32
    DRMENCODINGTYPE_BASE64 = 0
    DRMENCODINGTYPE_STRING = 1
    DRMENCODINGTYPE_LONG = 2
    DRMENCODINGTYPE_TIME = 3
    DRMENCODINGTYPE_UINT = 4
    DRMENCODINGTYPE_RAW = 5
  end

  enum DRMATTESTTYPE : Int32
    DRMATTESTTYPE_FULLENVIRONMENT = 0
    DRMATTESTTYPE_HASHONLY = 1
  end

  enum DRMSPECTYPE : Int32
    DRMSPECTYPE_UNKNOWN = 0
    DRMSPECTYPE_FILENAME = 1
  end

  enum DRMSECURITYPROVIDERTYPE : Int32
    DRMSECURITYPROVIDERTYPE_SOFTWARESECREP = 0
  end

  enum DRMGLOBALOPTIONS : Int32
    DRMGLOBALOPTIONS_USE_WINHTTP = 0
    DRMGLOBALOPTIONS_USE_SERVERSECURITYPROCESSOR = 1
  end

  enum DRM_STATUS_MSG : Int32
    DRM_MSG_ACTIVATE_MACHINE = 0
    DRM_MSG_ACTIVATE_GROUPIDENTITY = 1
    DRM_MSG_ACQUIRE_LICENSE = 2
    DRM_MSG_ACQUIRE_ADVISORY = 3
    DRM_MSG_SIGN_ISSUANCE_LICENSE = 4
    DRM_MSG_ACQUIRE_CLIENTLICENSOR = 5
    DRM_MSG_ACQUIRE_ISSUANCE_LICENSE_TEMPLATE = 6
  end

  enum DRM_USAGEPOLICY_TYPE : Int32
    DRM_USAGEPOLICY_TYPE_BYNAME = 0
    DRM_USAGEPOLICY_TYPE_BYPUBLICKEY = 1
    DRM_USAGEPOLICY_TYPE_BYDIGEST = 2
    DRM_USAGEPOLICY_TYPE_OSEXCLUSION = 3
  end

  enum DRM_DISTRIBUTION_POINT_INFO : Int32
    DRM_DISTRIBUTION_POINT_LICENSE_ACQUISITION = 0
    DRM_DISTRIBUTION_POINT_PUBLISHING = 1
    DRM_DISTRIBUTION_POINT_REFERRAL_INFO = 2
  end

  struct DRMID
    u_version : UInt32
    wsz_id_type : LibC::LPWSTR
    wsz_id : LibC::LPWSTR
  end
  struct DRMBOUNDLICENSEPARAMS
    u_version : UInt32
    h_enabling_principal : UInt32
    h_secure_store : UInt32
    wsz_rights_requested : LibC::LPWSTR
    wsz_rights_group : LibC::LPWSTR
    id_resource : DRMID
    c_authenticator_count : UInt32
    rgh_authenticators : UInt32*
    wsz_default_enabling_principal_credentials : LibC::LPWSTR
    dw_flags : UInt32
  end
  struct DRM_LICENSE_ACQ_DATA
    u_version : UInt32
    wsz_url : LibC::LPWSTR
    wsz_local_filename : LibC::LPWSTR
    pb_post_data : UInt8*
    dw_post_data_size : UInt32
    wsz_friendly_name : LibC::LPWSTR
  end
  struct DRM_ACTSERV_INFO
    u_version : UInt32
    wsz_pub_key : LibC::LPWSTR
    wsz_url : LibC::LPWSTR
  end
  struct DRM_CLIENT_VERSION_INFO
    u_struct_version : UInt32
    dw_version : UInt32[4]*
    wsz_hierarchy : Char[256]*
    wsz_product_id : Char[256]*
    wsz_product_description : Char[256]*
  end


  # Params # eglobaloptions : DRMGLOBALOPTIONS [In],pvdata : Void* [In],dwlen : UInt32 [In]
  fun DRMSetGlobalOptions(eglobaloptions : DRMGLOBALOPTIONS, pvdata : Void*, dwlen : UInt32) : HRESULT

  # Params # pdrmclientversioninfo : DRM_CLIENT_VERSION_INFO* [In]
  fun DRMGetClientVersion(pdrmclientversioninfo : DRM_CLIENT_VERSION_INFO*) : HRESULT

  # Params # esecurityprovidertype : DRMSECURITYPROVIDERTYPE [In],especification : DRMSPECTYPE [In],wszsecurityprovider : LibC::LPWSTR [In],wszmanifestcredentials : LibC::LPWSTR [In],wszmachinecredentials : LibC::LPWSTR [In],phenv : UInt32* [In],phdefaultlibrary : UInt32* [In]
  fun DRMInitEnvironment(esecurityprovidertype : DRMSECURITYPROVIDERTYPE, especification : DRMSPECTYPE, wszsecurityprovider : LibC::LPWSTR, wszmanifestcredentials : LibC::LPWSTR, wszmachinecredentials : LibC::LPWSTR, phenv : UInt32*, phdefaultlibrary : UInt32*) : HRESULT

  # Params # henv : UInt32 [In],especification : DRMSPECTYPE [In],wszlibraryprovider : LibC::LPWSTR [In],wszcredentials : LibC::LPWSTR [In],phlibrary : UInt32* [In]
  fun DRMLoadLibrary(henv : UInt32, especification : DRMSPECTYPE, wszlibraryprovider : LibC::LPWSTR, wszcredentials : LibC::LPWSTR, phlibrary : UInt32*) : HRESULT

  # Params # henv : UInt32 [In],hlibrary : UInt32 [In],wszobject : LibC::LPWSTR [In],pidprincipal : DRMID* [In],wszcredentials : LibC::LPWSTR [In],phenablingprincipal : UInt32* [In]
  fun DRMCreateEnablingPrincipal(henv : UInt32, hlibrary : UInt32, wszobject : LibC::LPWSTR, pidprincipal : DRMID*, wszcredentials : LibC::LPWSTR, phenablingprincipal : UInt32*) : HRESULT

  # Params # handle : UInt32 [In]
  fun DRMCloseHandle(handle : UInt32) : HRESULT

  # Params # henv : UInt32 [In]
  fun DRMCloseEnvironmentHandle(henv : UInt32) : HRESULT

  # Params # htocopy : UInt32 [In],phcopy : UInt32* [In]
  fun DRMDuplicateHandle(htocopy : UInt32, phcopy : UInt32*) : HRESULT

  # Params # htocopy : UInt32 [In],phcopy : UInt32* [In]
  fun DRMDuplicateEnvironmentHandle(htocopy : UInt32, phcopy : UInt32*) : HRESULT

  # Params # henv : UInt32 [In],wszrevocationlist : LibC::LPWSTR [In]
  fun DRMRegisterRevocationList(henv : UInt32, wszrevocationlist : LibC::LPWSTR) : HRESULT

  # Params # henv : UInt32 [In],clevel : UInt32 [In]
  fun DRMCheckSecurity(henv : UInt32, clevel : UInt32) : HRESULT

  # Params # fregister : LibC::BOOL [In]
  fun DRMRegisterContent(fregister : LibC::BOOL) : HRESULT

  # Params # hcryptoprovider : UInt32 [In],iposition : UInt32 [In],cnuminbytes : UInt32 [In],pbindata : UInt8* [In],pcnumoutbytes : UInt32* [In],pboutdata : UInt8* [In]
  fun DRMEncrypt(hcryptoprovider : UInt32, iposition : UInt32, cnuminbytes : UInt32, pbindata : UInt8*, pcnumoutbytes : UInt32*, pboutdata : UInt8*) : HRESULT

  # Params # hcryptoprovider : UInt32 [In],iposition : UInt32 [In],cnuminbytes : UInt32 [In],pbindata : UInt8* [In],pcnumoutbytes : UInt32* [In],pboutdata : UInt8* [In]
  fun DRMDecrypt(hcryptoprovider : UInt32, iposition : UInt32, cnuminbytes : UInt32, pbindata : UInt8*, pcnumoutbytes : UInt32*, pboutdata : UInt8*) : HRESULT

  # Params # henv : UInt32 [In],pparams : DRMBOUNDLICENSEPARAMS* [In],wszlicensechain : LibC::LPWSTR [In],phboundlicense : UInt32* [In],pherrorlog : UInt32* [In]
  fun DRMCreateBoundLicense(henv : UInt32, pparams : DRMBOUNDLICENSEPARAMS*, wszlicensechain : LibC::LPWSTR, phboundlicense : UInt32*, pherrorlog : UInt32*) : HRESULT

  # Params # hboundlicense : UInt32 [In],wszright : LibC::LPWSTR [In],hauxlib : UInt32 [In],wszauxplug : LibC::LPWSTR [In],phdecryptor : UInt32* [In]
  fun DRMCreateEnablingBitsDecryptor(hboundlicense : UInt32, wszright : LibC::LPWSTR, hauxlib : UInt32, wszauxplug : LibC::LPWSTR, phdecryptor : UInt32*) : HRESULT

  # Params # hboundlicense : UInt32 [In],wszright : LibC::LPWSTR [In],hauxlib : UInt32 [In],wszauxplug : LibC::LPWSTR [In],phencryptor : UInt32* [In]
  fun DRMCreateEnablingBitsEncryptor(hboundlicense : UInt32, wszright : LibC::LPWSTR, hauxlib : UInt32, wszauxplug : LibC::LPWSTR, phencryptor : UInt32*) : HRESULT

  # Params # henablingprincipal : UInt32 [In],wszdata : LibC::LPWSTR [In],etype : DRMATTESTTYPE [In],pcattestedblob : UInt32* [In],wszattestedblob : Char* [In]
  fun DRMAttest(henablingprincipal : UInt32, wszdata : LibC::LPWSTR, etype : DRMATTESTTYPE, pcattestedblob : UInt32*, wszattestedblob : Char*) : HRESULT

  # Params # henv : UInt32 [In],etimeridtype : DRMTIMETYPE [In],potimeobject : SYSTEMTIME* [In]
  fun DRMGetTime(henv : UInt32, etimeridtype : DRMTIMETYPE, potimeobject : SYSTEMTIME*) : HRESULT

  # Params # handle : UInt32 [In],wszattribute : LibC::LPWSTR [In],peencoding : DRMENCODINGTYPE* [In],pcbuffer : UInt32* [In],pbbuffer : UInt8* [In]
  fun DRMGetInfo(handle : UInt32, wszattribute : LibC::LPWSTR, peencoding : DRMENCODINGTYPE*, pcbuffer : UInt32*, pbbuffer : UInt8*) : HRESULT

  # Params # handle : UInt32 [In],wszattribute : LibC::LPWSTR [In],peencoding : DRMENCODINGTYPE* [In],pcbuffer : UInt32* [In],pbbuffer : UInt8* [In]
  fun DRMGetEnvironmentInfo(handle : UInt32, wszattribute : LibC::LPWSTR, peencoding : DRMENCODINGTYPE*, pcbuffer : UInt32*, pbbuffer : UInt8*) : HRESULT

  # Params # hlibrary : UInt32 [In],wszprocname : LibC::LPWSTR [In],ppfnprocaddress : FARPROC* [In]
  fun DRMGetProcAddress(hlibrary : UInt32, wszprocname : LibC::LPWSTR, ppfnprocaddress : FARPROC*) : HRESULT

  # Params # hqueryroot : UInt32 [In],wszsubobjecttype : LibC::LPWSTR [In],pcsubobjects : UInt32* [In]
  fun DRMGetBoundLicenseObjectCount(hqueryroot : UInt32, wszsubobjecttype : LibC::LPWSTR, pcsubobjects : UInt32*) : HRESULT

  # Params # hqueryroot : UInt32 [In],wszsubobjecttype : LibC::LPWSTR [In],iwhich : UInt32 [In],phsubobject : UInt32* [In]
  fun DRMGetBoundLicenseObject(hqueryroot : UInt32, wszsubobjecttype : LibC::LPWSTR, iwhich : UInt32, phsubobject : UInt32*) : HRESULT

  # Params # hqueryroot : UInt32 [In],wszattribute : LibC::LPWSTR [In],pcattributes : UInt32* [In]
  fun DRMGetBoundLicenseAttributeCount(hqueryroot : UInt32, wszattribute : LibC::LPWSTR, pcattributes : UInt32*) : HRESULT

  # Params # hqueryroot : UInt32 [In],wszattribute : LibC::LPWSTR [In],iwhich : UInt32 [In],peencoding : DRMENCODINGTYPE* [In],pcbuffer : UInt32* [In],pbbuffer : UInt8* [In]
  fun DRMGetBoundLicenseAttribute(hqueryroot : UInt32, wszattribute : LibC::LPWSTR, iwhich : UInt32, peencoding : DRMENCODINGTYPE*, pcbuffer : UInt32*, pbbuffer : UInt8*) : HRESULT

  # Params # pfncallback : DRMCALLBACK [In],ucallbackversion : UInt32 [In],wszgroupidprovidertype : LibC::LPWSTR [In],wszgroupid : LibC::LPWSTR [In],phclient : UInt32* [In]
  fun DRMCreateClientSession(pfncallback : DRMCALLBACK, ucallbackversion : UInt32, wszgroupidprovidertype : LibC::LPWSTR, wszgroupid : LibC::LPWSTR, phclient : UInt32*) : HRESULT

  # Params # hclient : UInt32 [In],uflags : UInt32 [In],pactservinfo : DRM_ACTSERV_INFO* [In]
  fun DRMIsActivated(hclient : UInt32, uflags : UInt32, pactservinfo : DRM_ACTSERV_INFO*) : HRESULT

  # Params # hclient : UInt32 [In],uflags : UInt32 [In],ulangid : UInt32 [In],pactservinfo : DRM_ACTSERV_INFO* [In],pvcontext : Void* [In],hparentwnd : LibC::HANDLE [In]
  fun DRMActivate(hclient : UInt32, uflags : UInt32, ulangid : UInt32, pactservinfo : DRM_ACTSERV_INFO*, pvcontext : Void*, hparentwnd : LibC::HANDLE) : HRESULT

  # Params # hclient : UInt32 [In],uservicetype : UInt32 [In],uservicelocation : UInt32 [In],wszissuancelicense : LibC::LPWSTR [In],puserviceurllength : UInt32* [In],wszserviceurl : Char* [In]
  fun DRMGetServiceLocation(hclient : UInt32, uservicetype : UInt32, uservicelocation : UInt32, wszissuancelicense : LibC::LPWSTR, puserviceurllength : UInt32*, wszserviceurl : Char*) : HRESULT

  # Params # henv : UInt32 [In],hdefaultlibrary : UInt32 [In],hclient : UInt32 [In],uflags : UInt32 [In],wszissuancelicense : LibC::LPWSTR [In],phlicensestorage : UInt32* [In]
  fun DRMCreateLicenseStorageSession(henv : UInt32, hdefaultlibrary : UInt32, hclient : UInt32, uflags : UInt32, wszissuancelicense : LibC::LPWSTR, phlicensestorage : UInt32*) : HRESULT

  # Params # hlicensestorage : UInt32 [In],uflags : UInt32 [In],wszlicense : LibC::LPWSTR [In]
  fun DRMAddLicense(hlicensestorage : UInt32, uflags : UInt32, wszlicense : LibC::LPWSTR) : HRESULT

  # Params # hlicensestorage : UInt32 [In],wszlicense : LibC::LPWSTR [In],wszurl : LibC::LPWSTR [In],pvcontext : Void* [In]
  fun DRMAcquireAdvisories(hlicensestorage : UInt32, wszlicense : LibC::LPWSTR, wszurl : LibC::LPWSTR, pvcontext : Void*) : HRESULT

  # Params # hsession : UInt32 [In],uflags : UInt32 [In],uindex : UInt32 [In],pfsharedflag : LibC::BOOL* [In],pucertificatedatalen : UInt32* [In],wszcertificatedata : Char* [In]
  fun DRMEnumerateLicense(hsession : UInt32, uflags : UInt32, uindex : UInt32, pfsharedflag : LibC::BOOL*, pucertificatedatalen : UInt32*, wszcertificatedata : Char*) : HRESULT

  # Params # hsession : UInt32 [In],uflags : UInt32 [In],wszgroupidentitycredential : LibC::LPWSTR [In],wszrequestedrights : LibC::LPWSTR [In],wszcustomdata : LibC::LPWSTR [In],wszurl : LibC::LPWSTR [In],pvcontext : Void* [In]
  fun DRMAcquireLicense(hsession : UInt32, uflags : UInt32, wszgroupidentitycredential : LibC::LPWSTR, wszrequestedrights : LibC::LPWSTR, wszcustomdata : LibC::LPWSTR, wszurl : LibC::LPWSTR, pvcontext : Void*) : HRESULT

  # Params # hsession : UInt32 [In],wszlicenseid : LibC::LPWSTR [In]
  fun DRMDeleteLicense(hsession : UInt32, wszlicenseid : LibC::LPWSTR) : HRESULT

  # Params # hsession : UInt32 [In]
  fun DRMCloseSession(hsession : UInt32) : HRESULT

  # Params # hsessionin : UInt32 [In],phsessionout : UInt32* [In]
  fun DRMDuplicateSession(hsessionin : UInt32, phsessionout : UInt32*) : HRESULT

  # Params # uflags : UInt32 [In],putypelen : UInt32* [In],wsztype : Char* [In],pupathlen : UInt32* [In],wszpath : Char* [In]
  fun DRMGetSecurityProvider(uflags : UInt32, putypelen : UInt32*, wsztype : Char*, pupathlen : UInt32*, wszpath : Char*) : HRESULT

  # Params # wszalgid : LibC::LPWSTR [In],udatalen : UInt32 [In],pbdecodeddata : UInt8* [In],puencodedstringlen : UInt32* [In],wszencodedstring : Char* [In]
  fun DRMEncode(wszalgid : LibC::LPWSTR, udatalen : UInt32, pbdecodeddata : UInt8*, puencodedstringlen : UInt32*, wszencodedstring : Char*) : HRESULT

  # Params # wszalgid : LibC::LPWSTR [In],wszencodedstring : LibC::LPWSTR [In],pudecodeddatalen : UInt32* [In],pbdecodeddata : UInt8* [In]
  fun DRMDecode(wszalgid : LibC::LPWSTR, wszencodedstring : LibC::LPWSTR, pudecodeddatalen : UInt32*, pbdecodeddata : UInt8*) : HRESULT

  # Params # ccertificates : UInt32 [In],rgwszcertificates : LibC::LPWSTR* [In],pcchain : UInt32* [In],wszchain : Char* [In]
  fun DRMConstructCertificateChain(ccertificates : UInt32, rgwszcertificates : LibC::LPWSTR*, pcchain : UInt32*, wszchain : Char*) : HRESULT

  # Params # wszcertificate : LibC::LPWSTR [In],phqueryroot : UInt32* [In]
  fun DRMParseUnboundLicense(wszcertificate : LibC::LPWSTR, phqueryroot : UInt32*) : HRESULT

  # Params # hquery : UInt32 [In]
  fun DRMCloseQueryHandle(hquery : UInt32) : HRESULT

  # Params # hqueryroot : UInt32 [In],wszsubobjecttype : LibC::LPWSTR [In],pcsubobjects : UInt32* [In]
  fun DRMGetUnboundLicenseObjectCount(hqueryroot : UInt32, wszsubobjecttype : LibC::LPWSTR, pcsubobjects : UInt32*) : HRESULT

  # Params # hqueryroot : UInt32 [In],wszsubobjecttype : LibC::LPWSTR [In],iindex : UInt32 [In],phsubquery : UInt32* [In]
  fun DRMGetUnboundLicenseObject(hqueryroot : UInt32, wszsubobjecttype : LibC::LPWSTR, iindex : UInt32, phsubquery : UInt32*) : HRESULT

  # Params # hqueryroot : UInt32 [In],wszattributetype : LibC::LPWSTR [In],pcattributes : UInt32* [In]
  fun DRMGetUnboundLicenseAttributeCount(hqueryroot : UInt32, wszattributetype : LibC::LPWSTR, pcattributes : UInt32*) : HRESULT

  # Params # hqueryroot : UInt32 [In],wszattributetype : LibC::LPWSTR [In],iwhich : UInt32 [In],peencoding : DRMENCODINGTYPE* [In],pcbuffer : UInt32* [In],pbbuffer : UInt8* [In]
  fun DRMGetUnboundLicenseAttribute(hqueryroot : UInt32, wszattributetype : LibC::LPWSTR, iwhich : UInt32, peencoding : DRMENCODINGTYPE*, pcbuffer : UInt32*, pbbuffer : UInt8*) : HRESULT

  # Params # wszchain : LibC::LPWSTR [In],pccertcount : UInt32* [In]
  fun DRMGetCertificateChainCount(wszchain : LibC::LPWSTR, pccertcount : UInt32*) : HRESULT

  # Params # wszchain : LibC::LPWSTR [In],iwhich : UInt32 [In],pccert : UInt32* [In],wszcert : Char* [In]
  fun DRMDeconstructCertificateChain(wszchain : LibC::LPWSTR, iwhich : UInt32, pccert : UInt32*, wszcert : Char*) : HRESULT

  # Params # wszdata : LibC::LPWSTR [In],pcattesteddata : UInt32* [In],wszattesteddata : Char* [In],petype : DRMATTESTTYPE* [In],pcprincipal : UInt32* [In],wszprincipal : Char* [In],pcmanifest : UInt32* [In],wszmanifest : Char* [In]
  fun DRMVerify(wszdata : LibC::LPWSTR, pcattesteddata : UInt32*, wszattesteddata : Char*, petype : DRMATTESTTYPE*, pcprincipal : UInt32*, wszprincipal : Char*, pcmanifest : UInt32*, wszmanifest : Char*) : HRESULT

  # Params # wszusername : LibC::LPWSTR [In],wszuserid : LibC::LPWSTR [In],wszuseridtype : LibC::LPWSTR [In],phuser : UInt32* [In]
  fun DRMCreateUser(wszusername : LibC::LPWSTR, wszuserid : LibC::LPWSTR, wszuseridtype : LibC::LPWSTR, phuser : UInt32*) : HRESULT

  # Params # wszrightname : LibC::LPWSTR [In],pstfrom : SYSTEMTIME* [In],pstuntil : SYSTEMTIME* [In],cextendedinfo : UInt32 [In],pwszextendedinfoname : LibC::LPWSTR* [In],pwszextendedinfovalue : LibC::LPWSTR* [In],phright : UInt32* [In]
  fun DRMCreateRight(wszrightname : LibC::LPWSTR, pstfrom : SYSTEMTIME*, pstuntil : SYSTEMTIME*, cextendedinfo : UInt32, pwszextendedinfoname : LibC::LPWSTR*, pwszextendedinfovalue : LibC::LPWSTR*, phright : UInt32*) : HRESULT

  # Params # psttimefrom : SYSTEMTIME* [In],psttimeuntil : SYSTEMTIME* [In],wszreferralinfoname : LibC::LPWSTR [In],wszreferralinfourl : LibC::LPWSTR [In],howner : UInt32 [In],wszissuancelicense : LibC::LPWSTR [In],hboundlicense : UInt32 [In],phissuancelicense : UInt32* [In]
  fun DRMCreateIssuanceLicense(psttimefrom : SYSTEMTIME*, psttimeuntil : SYSTEMTIME*, wszreferralinfoname : LibC::LPWSTR, wszreferralinfourl : LibC::LPWSTR, howner : UInt32, wszissuancelicense : LibC::LPWSTR, hboundlicense : UInt32, phissuancelicense : UInt32*) : HRESULT

  # Params # hissuancelicense : UInt32 [In],hright : UInt32 [In],huser : UInt32 [In]
  fun DRMAddRightWithUser(hissuancelicense : UInt32, hright : UInt32, huser : UInt32) : HRESULT

  # Params # hissuancelicense : UInt32 [In]
  fun DRMClearAllRights(hissuancelicense : UInt32) : HRESULT

  # Params # hissuancelicense : UInt32 [In],wszcontentid : LibC::LPWSTR [In],wszcontentidtype : LibC::LPWSTR [In],wszskuid : LibC::LPWSTR [In],wszskuidtype : LibC::LPWSTR [In],wszcontenttype : LibC::LPWSTR [In],wszcontentname : LibC::LPWSTR [In]
  fun DRMSetMetaData(hissuancelicense : UInt32, wszcontentid : LibC::LPWSTR, wszcontentidtype : LibC::LPWSTR, wszskuid : LibC::LPWSTR, wszskuidtype : LibC::LPWSTR, wszcontenttype : LibC::LPWSTR, wszcontentname : LibC::LPWSTR) : HRESULT

  # Params # hissuancelicense : UInt32 [In],eusagepolicytype : DRM_USAGEPOLICY_TYPE [In],fdelete : LibC::BOOL [In],fexclusion : LibC::BOOL [In],wszname : LibC::LPWSTR [In],wszminversion : LibC::LPWSTR [In],wszmaxversion : LibC::LPWSTR [In],wszpublickey : LibC::LPWSTR [In],wszdigestalgorithm : LibC::LPWSTR [In],pbdigest : UInt8* [In],cbdigest : UInt32 [In]
  fun DRMSetUsagePolicy(hissuancelicense : UInt32, eusagepolicytype : DRM_USAGEPOLICY_TYPE, fdelete : LibC::BOOL, fexclusion : LibC::BOOL, wszname : LibC::LPWSTR, wszminversion : LibC::LPWSTR, wszmaxversion : LibC::LPWSTR, wszpublickey : LibC::LPWSTR, wszdigestalgorithm : LibC::LPWSTR, pbdigest : UInt8*, cbdigest : UInt32) : HRESULT

  # Params # hissuancelicense : UInt32 [In],fdelete : LibC::BOOL [In],wszid : LibC::LPWSTR [In],wszidtype : LibC::LPWSTR [In],wszurl : LibC::LPWSTR [In],pstfrequency : SYSTEMTIME* [In],wszname : LibC::LPWSTR [In],wszpublickey : LibC::LPWSTR [In]
  fun DRMSetRevocationPoint(hissuancelicense : UInt32, fdelete : LibC::BOOL, wszid : LibC::LPWSTR, wszidtype : LibC::LPWSTR, wszurl : LibC::LPWSTR, pstfrequency : SYSTEMTIME*, wszname : LibC::LPWSTR, wszpublickey : LibC::LPWSTR) : HRESULT

  # Params # hissuancelicense : UInt32 [In],fdelete : LibC::BOOL [In],wszname : LibC::LPWSTR [In],wszvalue : LibC::LPWSTR [In]
  fun DRMSetApplicationSpecificData(hissuancelicense : UInt32, fdelete : LibC::BOOL, wszname : LibC::LPWSTR, wszvalue : LibC::LPWSTR) : HRESULT

  # Params # hissuancelicense : UInt32 [In],fdelete : LibC::BOOL [In],lcid : UInt32 [In],wszname : LibC::LPWSTR [In],wszdescription : LibC::LPWSTR [In]
  fun DRMSetNameAndDescription(hissuancelicense : UInt32, fdelete : LibC::BOOL, lcid : UInt32, wszname : LibC::LPWSTR, wszdescription : LibC::LPWSTR) : HRESULT

  # Params # hissuancelicense : UInt32 [In],cdays : UInt32 [In]
  fun DRMSetIntervalTime(hissuancelicense : UInt32, cdays : UInt32) : HRESULT

  # Params # hissuancelicense : UInt32 [In],puissuancelicensetemplatelength : UInt32* [In],wszissuancelicensetemplate : Char* [In]
  fun DRMGetIssuanceLicenseTemplate(hissuancelicense : UInt32, puissuancelicensetemplatelength : UInt32*, wszissuancelicensetemplate : Char*) : HRESULT

  # Params # henv : UInt32 [In],hissuancelicense : UInt32 [In],uflags : UInt32 [In],pbsymkey : UInt8* [In],cbsymkey : UInt32 [In],wszsymkeytype : LibC::LPWSTR [In],wszclientlicensorcertificate : LibC::LPWSTR [In],pfncallback : DRMCALLBACK [In],wszurl : LibC::LPWSTR [In],pvcontext : Void* [In]
  fun DRMGetSignedIssuanceLicense(henv : UInt32, hissuancelicense : UInt32, uflags : UInt32, pbsymkey : UInt8*, cbsymkey : UInt32, wszsymkeytype : LibC::LPWSTR, wszclientlicensorcertificate : LibC::LPWSTR, pfncallback : DRMCALLBACK, wszurl : LibC::LPWSTR, pvcontext : Void*) : HRESULT

  # Params # henv : UInt32 [In],hissuancelicense : UInt32 [In],uflags : UInt32 [In],pbsymkey : UInt8* [In],cbsymkey : UInt32 [In],wszsymkeytype : LibC::LPWSTR [In],pvreserved : Void* [In],henablingprincipal : UInt32 [In],hboundlicenseclc : UInt32 [In],pfncallback : DRMCALLBACK [In],pvcontext : Void* [In]
  fun DRMGetSignedIssuanceLicenseEx(henv : UInt32, hissuancelicense : UInt32, uflags : UInt32, pbsymkey : UInt8*, cbsymkey : UInt32, wszsymkeytype : LibC::LPWSTR, pvreserved : Void*, henablingprincipal : UInt32, hboundlicenseclc : UInt32, pfncallback : DRMCALLBACK, pvcontext : Void*) : HRESULT

  # Params # hpub : UInt32 [In]
  fun DRMClosePubHandle(hpub : UInt32) : HRESULT

  # Params # hpubin : UInt32 [In],phpubout : UInt32* [In]
  fun DRMDuplicatePubHandle(hpubin : UInt32, phpubout : UInt32*) : HRESULT

  # Params # huser : UInt32 [In],puusernamelength : UInt32* [In],wszusername : Char* [In],puuseridlength : UInt32* [In],wszuserid : Char* [In],puuseridtypelength : UInt32* [In],wszuseridtype : Char* [In]
  fun DRMGetUserInfo(huser : UInt32, puusernamelength : UInt32*, wszusername : Char*, puuseridlength : UInt32*, wszuserid : Char*, puuseridtypelength : UInt32*, wszuseridtype : Char*) : HRESULT

  # Params # hright : UInt32 [In],purightnamelength : UInt32* [In],wszrightname : Char* [In],pstfrom : SYSTEMTIME* [In],pstuntil : SYSTEMTIME* [In]
  fun DRMGetRightInfo(hright : UInt32, purightnamelength : UInt32*, wszrightname : Char*, pstfrom : SYSTEMTIME*, pstuntil : SYSTEMTIME*) : HRESULT

  # Params # hright : UInt32 [In],uindex : UInt32 [In],puextendedinfonamelength : UInt32* [In],wszextendedinfoname : Char* [In],puextendedinfovaluelength : UInt32* [In],wszextendedinfovalue : Char* [In]
  fun DRMGetRightExtendedInfo(hright : UInt32, uindex : UInt32, puextendedinfonamelength : UInt32*, wszextendedinfoname : Char*, puextendedinfovaluelength : UInt32*, wszextendedinfovalue : Char*) : HRESULT

  # Params # hissuancelicense : UInt32 [In],uindex : UInt32 [In],phuser : UInt32* [In]
  fun DRMGetUsers(hissuancelicense : UInt32, uindex : UInt32, phuser : UInt32*) : HRESULT

  # Params # hissuancelicense : UInt32 [In],huser : UInt32 [In],uindex : UInt32 [In],phright : UInt32* [In]
  fun DRMGetUserRights(hissuancelicense : UInt32, huser : UInt32, uindex : UInt32, phright : UInt32*) : HRESULT

  # Params # hissuancelicense : UInt32 [In],pucontentidlength : UInt32* [In],wszcontentid : Char* [In],pucontentidtypelength : UInt32* [In],wszcontentidtype : Char* [In],puskuidlength : UInt32* [In],wszskuid : Char* [In],puskuidtypelength : UInt32* [In],wszskuidtype : Char* [In],pucontenttypelength : UInt32* [In],wszcontenttype : Char* [In],pucontentnamelength : UInt32* [In],wszcontentname : Char* [In]
  fun DRMGetMetaData(hissuancelicense : UInt32, pucontentidlength : UInt32*, wszcontentid : Char*, pucontentidtypelength : UInt32*, wszcontentidtype : Char*, puskuidlength : UInt32*, wszskuid : Char*, puskuidtypelength : UInt32*, wszskuidtype : Char*, pucontenttypelength : UInt32*, wszcontenttype : Char*, pucontentnamelength : UInt32*, wszcontentname : Char*) : HRESULT

  # Params # hissuancelicense : UInt32 [In],uindex : UInt32 [In],punamelength : UInt32* [In],wszname : Char* [In],puvaluelength : UInt32* [In],wszvalue : Char* [In]
  fun DRMGetApplicationSpecificData(hissuancelicense : UInt32, uindex : UInt32, punamelength : UInt32*, wszname : Char*, puvaluelength : UInt32*, wszvalue : Char*) : HRESULT

  # Params # hissuancelicense : UInt32 [In],psttimefrom : SYSTEMTIME* [In],psttimeuntil : SYSTEMTIME* [In],uflags : UInt32 [In],pudistributionpointnamelength : UInt32* [In],wszdistributionpointname : Char* [In],pudistributionpointurllength : UInt32* [In],wszdistributionpointurl : Char* [In],phowner : UInt32* [In],pfofficial : LibC::BOOL* [In]
  fun DRMGetIssuanceLicenseInfo(hissuancelicense : UInt32, psttimefrom : SYSTEMTIME*, psttimeuntil : SYSTEMTIME*, uflags : UInt32, pudistributionpointnamelength : UInt32*, wszdistributionpointname : Char*, pudistributionpointurllength : UInt32*, wszdistributionpointurl : Char*, phowner : UInt32*, pfofficial : LibC::BOOL*) : HRESULT

  # Params # hissuancelicense : UInt32 [In],puidlength : UInt32* [In],wszid : Char* [In],puidtypelength : UInt32* [In],wszidtype : Char* [In],puurllength : UInt32* [In],wszrl : Char* [In],pstfrequency : SYSTEMTIME* [In],punamelength : UInt32* [In],wszname : Char* [In],pupublickeylength : UInt32* [In],wszpublickey : Char* [In]
  fun DRMGetRevocationPoint(hissuancelicense : UInt32, puidlength : UInt32*, wszid : Char*, puidtypelength : UInt32*, wszidtype : Char*, puurllength : UInt32*, wszrl : Char*, pstfrequency : SYSTEMTIME*, punamelength : UInt32*, wszname : Char*, pupublickeylength : UInt32*, wszpublickey : Char*) : HRESULT

  # Params # hissuancelicense : UInt32 [In],uindex : UInt32 [In],peusagepolicytype : DRM_USAGEPOLICY_TYPE* [In],pfexclusion : LibC::BOOL* [In],punamelength : UInt32* [In],wszname : Char* [In],puminversionlength : UInt32* [In],wszminversion : Char* [In],pumaxversionlength : UInt32* [In],wszmaxversion : Char* [In],pupublickeylength : UInt32* [In],wszpublickey : Char* [In],pudigestalgorithmlength : UInt32* [In],wszdigestalgorithm : Char* [In],pcbdigest : UInt32* [In],pbdigest : UInt8* [In]
  fun DRMGetUsagePolicy(hissuancelicense : UInt32, uindex : UInt32, peusagepolicytype : DRM_USAGEPOLICY_TYPE*, pfexclusion : LibC::BOOL*, punamelength : UInt32*, wszname : Char*, puminversionlength : UInt32*, wszminversion : Char*, pumaxversionlength : UInt32*, wszmaxversion : Char*, pupublickeylength : UInt32*, wszpublickey : Char*, pudigestalgorithmlength : UInt32*, wszdigestalgorithm : Char*, pcbdigest : UInt32*, pbdigest : UInt8*) : HRESULT

  # Params # hissuancelicense : UInt32 [In],uindex : UInt32 [In],pulcid : UInt32* [In],punamelength : UInt32* [In],wszname : Char* [In],pudescriptionlength : UInt32* [In],wszdescription : Char* [In]
  fun DRMGetNameAndDescription(hissuancelicense : UInt32, uindex : UInt32, pulcid : UInt32*, punamelength : UInt32*, wszname : Char*, pudescriptionlength : UInt32*, wszdescription : Char*) : HRESULT

  # Params # hissuancelicense : UInt32 [In],puownerlicenselength : UInt32* [In],wszownerlicense : Char* [In]
  fun DRMGetOwnerLicense(hissuancelicense : UInt32, puownerlicenselength : UInt32*, wszownerlicense : Char*) : HRESULT

  # Params # hissuancelicense : UInt32 [In],pcdays : UInt32* [In]
  fun DRMGetIntervalTime(hissuancelicense : UInt32, pcdays : UInt32*) : HRESULT

  # Params # 
  fun DRMRepair : HRESULT

  # Params # henv : UInt32 [In],hwnd : LibC::HANDLE [In]
  fun DRMRegisterProtectedWindow(henv : UInt32, hwnd : LibC::HANDLE) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],pfprotected : LibC::BOOL* [In]
  fun DRMIsWindowProtected(hwnd : LibC::HANDLE, pfprotected : LibC::BOOL*) : HRESULT

  # Params # hclient : UInt32 [In],uflags : UInt32 [In],pvreserved : Void* [In],ctemplates : UInt32 [In],pwsztemplateids : LibC::LPWSTR* [In],wszurl : LibC::LPWSTR [In],pvcontext : Void* [In]
  fun DRMAcquireIssuanceLicenseTemplate(hclient : UInt32, uflags : UInt32, pvreserved : Void*, ctemplates : UInt32, pwsztemplateids : LibC::LPWSTR*, wszurl : LibC::LPWSTR, pvcontext : Void*) : HRESULT
end
