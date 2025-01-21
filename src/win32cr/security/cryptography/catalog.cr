require "./../../foundation.cr"
require "./sip.cr"
require "./../cryptography.cr"

module Win32cr::Security::Cryptography::Catalog
  alias PFN_CDF_PARSE_ERROR_CALLBACK = Proc(UInt32, UInt32, Win32cr::Foundation::PWSTR, Void)*

  Szoid_catalog_list = "1.3.6.1.4.1.311.12.1.1"
  Szoid_catalog_list_member = "1.3.6.1.4.1.311.12.1.2"
  Szoid_catalog_list_member2 = "1.3.6.1.4.1.311.12.1.3"
  CRYPTCAT_FILEEXT = "CAT"
  CRYPTCAT_MAX_MEMBERTAG = 64_u32
  CRYPTCAT_MEMBER_SORTED = 1073741824_u32
  CRYPTCAT_ATTR_AUTHENTICATED = 268435456_u32
  CRYPTCAT_ATTR_UNAUTHENTICATED = 536870912_u32
  CRYPTCAT_ATTR_NAMEASCII = 1_u32
  CRYPTCAT_ATTR_NAMEOBJID = 2_u32
  CRYPTCAT_ATTR_DATAASCII = 65536_u32
  CRYPTCAT_ATTR_DATABASE64 = 131072_u32
  CRYPTCAT_ATTR_DATAREPLACE = 262144_u32
  CRYPTCAT_ATTR_NO_AUTO_COMPAT_ENTRY = 16777216_u32
  CRYPTCAT_E_AREA_HEADER = 0_u32
  CRYPTCAT_E_AREA_MEMBER = 65536_u32
  CRYPTCAT_E_AREA_ATTRIBUTE = 131072_u32
  CRYPTCAT_E_CDF_UNSUPPORTED = 1_u32
  CRYPTCAT_E_CDF_DUPLICATE = 2_u32
  CRYPTCAT_E_CDF_TAGNOTFOUND = 4_u32
  CRYPTCAT_E_CDF_MEMBER_FILE_PATH = 65537_u32
  CRYPTCAT_E_CDF_MEMBER_INDIRECTDATA = 65538_u32
  CRYPTCAT_E_CDF_MEMBER_FILENOTFOUND = 65540_u32
  CRYPTCAT_E_CDF_BAD_GUID_CONV = 131073_u32
  CRYPTCAT_E_CDF_ATTR_TOOFEWVALUES = 131074_u32
  CRYPTCAT_E_CDF_ATTR_TYPECOMBO = 131076_u32
  CRYPTCAT_ADDCATALOG_NONE = 0_u32
  CRYPTCAT_ADDCATALOG_HARDLINK = 1_u32

  enum CRYPTCAT_VERSION : UInt32
    CRYPTCAT_VERSION_1 = 256_u32
    CRYPTCAT_VERSION_2 = 512_u32
  end
  @[Flags]
  enum CRYPTCAT_OPEN_FLAGS : UInt32
    CRYPTCAT_OPEN_ALWAYS = 2_u32
    CRYPTCAT_OPEN_CREATENEW = 1_u32
    CRYPTCAT_OPEN_EXISTING = 4_u32
    CRYPTCAT_OPEN_EXCLUDE_PAGE_HASHES = 65536_u32
    CRYPTCAT_OPEN_INCLUDE_PAGE_HASHES = 131072_u32
    CRYPTCAT_OPEN_VERIFYSIGHASH = 268435456_u32
    CRYPTCAT_OPEN_NO_CONTENT_HCRYPTMSG = 536870912_u32
    CRYPTCAT_OPEN_SORTED = 1073741824_u32
    CRYPTCAT_OPEN_FLAGS_MASK = 4294901760_u32
  end

  @[Extern]
  record CRYPTCATSTORE,
    cbStruct : UInt32,
    dwPublicVersion : UInt32,
    pwszP7File : Win32cr::Foundation::PWSTR,
    hProv : LibC::UIntPtrT,
    dwEncodingType : UInt32,
    fdwStoreFlags : Win32cr::Security::Cryptography::Catalog::CRYPTCAT_OPEN_FLAGS,
    hReserved : Win32cr::Foundation::HANDLE,
    hAttrs : Win32cr::Foundation::HANDLE,
    hCryptMsg : Void*,
    hSorted : Win32cr::Foundation::HANDLE

  @[Extern]
  record CRYPTCATMEMBER,
    cbStruct : UInt32,
    pwszReferenceTag : Win32cr::Foundation::PWSTR,
    pwszFileName : Win32cr::Foundation::PWSTR,
    gSubjectType : LibC::GUID,
    fdwMemberFlags : UInt32,
    pIndirectData : Win32cr::Security::Cryptography::Sip::SIP_INDIRECT_DATA*,
    dwCertVersion : UInt32,
    dwReserved : UInt32,
    hReserved : Win32cr::Foundation::HANDLE,
    sEncodedIndirectData : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB,
    sEncodedMemberInfo : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB

  @[Extern]
  record CRYPTCATATTRIBUTE,
    cbStruct : UInt32,
    pwszReferenceTag : Win32cr::Foundation::PWSTR,
    dwAttrTypeAndAction : UInt32,
    cbValue : UInt32,
    pbValue : UInt8*,
    dwReserved : UInt32

  @[Extern]
  record CRYPTCATCDF,
    cbStruct : UInt32,
    hFile : Win32cr::Foundation::HANDLE,
    dwCurFilePos : UInt32,
    dwLastMemberOffset : UInt32,
    fEOF : Win32cr::Foundation::BOOL,
    pwszResultDir : Win32cr::Foundation::PWSTR,
    hCATStore : Win32cr::Foundation::HANDLE

  @[Extern]
  record CATALOG_INFO,
    cbStruct : UInt32,
    wszCatalogFile : UInt16[260]

  @[Extern]
  record MS_ADDINFO_CATALOGMEMBER,
    cbStruct : UInt32,
    pStore : Win32cr::Security::Cryptography::Catalog::CRYPTCATSTORE*,
    pMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*

  @[Link("wintrust")]
  lib C
    fun CryptCATOpen(pwszFileName : Win32cr::Foundation::PWSTR, fdwOpenFlags : Win32cr::Security::Cryptography::Catalog::CRYPTCAT_OPEN_FLAGS, hProv : LibC::UIntPtrT, dwPublicVersion : Win32cr::Security::Cryptography::Catalog::CRYPTCAT_VERSION, dwEncodingType : UInt32) : Win32cr::Foundation::HANDLE

    fun CryptCATClose(hCatalog : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun CryptCATStoreFromHandle(hCatalog : Win32cr::Foundation::HANDLE) : Win32cr::Security::Cryptography::Catalog::CRYPTCATSTORE*

    fun CryptCATHandleFromStore(pCatStore : Win32cr::Security::Cryptography::Catalog::CRYPTCATSTORE*) : Win32cr::Foundation::HANDLE

    fun CryptCATPersistStore(hCatalog : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun CryptCATGetCatAttrInfo(hCatalog : Win32cr::Foundation::HANDLE, pwszReferenceTag : Win32cr::Foundation::PWSTR) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*

    fun CryptCATPutCatAttrInfo(hCatalog : Win32cr::Foundation::HANDLE, pwszReferenceTag : Win32cr::Foundation::PWSTR, dwAttrTypeAndAction : UInt32, cbData : UInt32, pbData : UInt8*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*

    fun CryptCATEnumerateCatAttr(hCatalog : Win32cr::Foundation::HANDLE, pPrevAttr : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*

    fun CryptCATGetMemberInfo(hCatalog : Win32cr::Foundation::HANDLE, pwszReferenceTag : Win32cr::Foundation::PWSTR) : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*

    fun CryptCATAllocSortedMemberInfo(hCatalog : Win32cr::Foundation::HANDLE, pwszReferenceTag : Win32cr::Foundation::PWSTR) : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*

    fun CryptCATFreeSortedMemberInfo(hCatalog : Win32cr::Foundation::HANDLE, pCatMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*) : Void

    fun CryptCATGetAttrInfo(hCatalog : Win32cr::Foundation::HANDLE, pCatMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*, pwszReferenceTag : Win32cr::Foundation::PWSTR) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*

    fun CryptCATPutMemberInfo(hCatalog : Win32cr::Foundation::HANDLE, pwszFileName : Win32cr::Foundation::PWSTR, pwszReferenceTag : Win32cr::Foundation::PWSTR, pgSubjectType : LibC::GUID*, dwCertVersion : UInt32, cbSIPIndirectData : UInt32, pbSIPIndirectData : UInt8*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*

    fun CryptCATPutAttrInfo(hCatalog : Win32cr::Foundation::HANDLE, pCatMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*, pwszReferenceTag : Win32cr::Foundation::PWSTR, dwAttrTypeAndAction : UInt32, cbData : UInt32, pbData : UInt8*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*

    fun CryptCATEnumerateMember(hCatalog : Win32cr::Foundation::HANDLE, pPrevMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*

    fun CryptCATEnumerateAttr(hCatalog : Win32cr::Foundation::HANDLE, pCatMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*, pPrevAttr : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*

    fun CryptCATCDFOpen(pwszFilePath : Win32cr::Foundation::PWSTR, pfnParseError : Win32cr::Security::Cryptography::Catalog::PFN_CDF_PARSE_ERROR_CALLBACK) : Win32cr::Security::Cryptography::Catalog::CRYPTCATCDF*

    fun CryptCATCDFClose(pCDF : Win32cr::Security::Cryptography::Catalog::CRYPTCATCDF*) : Win32cr::Foundation::BOOL

    fun CryptCATCDFEnumCatAttributes(pCDF : Win32cr::Security::Cryptography::Catalog::CRYPTCATCDF*, pPrevAttr : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*, pfnParseError : Win32cr::Security::Cryptography::Catalog::PFN_CDF_PARSE_ERROR_CALLBACK) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*

    fun CryptCATCDFEnumMembers(pCDF : Win32cr::Security::Cryptography::Catalog::CRYPTCATCDF*, pPrevMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*, pfnParseError : Win32cr::Security::Cryptography::Catalog::PFN_CDF_PARSE_ERROR_CALLBACK) : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*

    fun CryptCATCDFEnumAttributes(pCDF : Win32cr::Security::Cryptography::Catalog::CRYPTCATCDF*, pMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*, pPrevAttr : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*, pfnParseError : Win32cr::Security::Cryptography::Catalog::PFN_CDF_PARSE_ERROR_CALLBACK) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*

    fun IsCatalogFile(hFile : Win32cr::Foundation::HANDLE, pwszFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    fun CryptCATAdminAcquireContext(phCatAdmin : LibC::IntPtrT*, pgSubsystem : LibC::GUID*, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    fun CryptCATAdminAcquireContext2(phCatAdmin : LibC::IntPtrT*, pgSubsystem : LibC::GUID*, pwszHashAlgorithm : Win32cr::Foundation::PWSTR, pStrongHashPolicy : Win32cr::Security::Cryptography::CERT_STRONG_SIGN_PARA*, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    fun CryptCATAdminReleaseContext(hCatAdmin : LibC::IntPtrT, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    fun CryptCATAdminReleaseCatalogContext(hCatAdmin : LibC::IntPtrT, hCatInfo : LibC::IntPtrT, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    fun CryptCATAdminEnumCatalogFromHash(hCatAdmin : LibC::IntPtrT, pbHash : UInt8*, cbHash : UInt32, dwFlags : UInt32, phPrevCatInfo : LibC::IntPtrT*) : LibC::IntPtrT

    fun CryptCATAdminCalcHashFromFileHandle(hFile : Win32cr::Foundation::HANDLE, pcbHash : UInt32*, pbHash : UInt8*, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    fun CryptCATAdminCalcHashFromFileHandle2(hCatAdmin : LibC::IntPtrT, hFile : Win32cr::Foundation::HANDLE, pcbHash : UInt32*, pbHash : UInt8*, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    fun CryptCATAdminAddCatalog(hCatAdmin : LibC::IntPtrT, pwszCatalogFile : Win32cr::Foundation::PWSTR, pwszSelectBaseName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : LibC::IntPtrT

    fun CryptCATAdminRemoveCatalog(hCatAdmin : LibC::IntPtrT, pwszCatalogFile : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    fun CryptCATCatalogInfoFromContext(hCatInfo : LibC::IntPtrT, psCatInfo : Win32cr::Security::Cryptography::Catalog::CATALOG_INFO*, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    fun CryptCATAdminResolveCatalogPath(hCatAdmin : LibC::IntPtrT, pwszCatalogFile : Win32cr::Foundation::PWSTR, psCatInfo : Win32cr::Security::Cryptography::Catalog::CATALOG_INFO*, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    fun CryptCATAdminPauseServiceForBackup(dwFlags : UInt32, fResume : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

  end
end