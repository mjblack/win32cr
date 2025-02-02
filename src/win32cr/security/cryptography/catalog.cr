require "./../../foundation.cr"
require "./sip.cr"
require "./../cryptography.cr"

module Win32cr::Security::Cryptography::Catalog
  extend self
  alias PFN_CDF_PARSE_ERROR_CALLBACK = Proc(UInt32, UInt32, Win32cr::Foundation::PWSTR, Void)

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
  struct CRYPTCATSTORE
    property cbStruct : UInt32
    property dwPublicVersion : UInt32
    property pwszP7File : Win32cr::Foundation::PWSTR
    property hProv : LibC::UIntPtrT
    property dwEncodingType : UInt32
    property fdwStoreFlags : Win32cr::Security::Cryptography::Catalog::CRYPTCAT_OPEN_FLAGS
    property hReserved : Win32cr::Foundation::HANDLE
    property hAttrs : Win32cr::Foundation::HANDLE
    property hCryptMsg : Void*
    property hSorted : Win32cr::Foundation::HANDLE
    def initialize(@cbStruct : UInt32, @dwPublicVersion : UInt32, @pwszP7File : Win32cr::Foundation::PWSTR, @hProv : LibC::UIntPtrT, @dwEncodingType : UInt32, @fdwStoreFlags : Win32cr::Security::Cryptography::Catalog::CRYPTCAT_OPEN_FLAGS, @hReserved : Win32cr::Foundation::HANDLE, @hAttrs : Win32cr::Foundation::HANDLE, @hCryptMsg : Void*, @hSorted : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct CRYPTCATMEMBER
    property cbStruct : UInt32
    property pwszReferenceTag : Win32cr::Foundation::PWSTR
    property pwszFileName : Win32cr::Foundation::PWSTR
    property gSubjectType : LibC::GUID
    property fdwMemberFlags : UInt32
    property pIndirectData : Win32cr::Security::Cryptography::Sip::SIP_INDIRECT_DATA*
    property dwCertVersion : UInt32
    property dwReserved : UInt32
    property hReserved : Win32cr::Foundation::HANDLE
    property sEncodedIndirectData : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB
    property sEncodedMemberInfo : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB
    def initialize(@cbStruct : UInt32, @pwszReferenceTag : Win32cr::Foundation::PWSTR, @pwszFileName : Win32cr::Foundation::PWSTR, @gSubjectType : LibC::GUID, @fdwMemberFlags : UInt32, @pIndirectData : Win32cr::Security::Cryptography::Sip::SIP_INDIRECT_DATA*, @dwCertVersion : UInt32, @dwReserved : UInt32, @hReserved : Win32cr::Foundation::HANDLE, @sEncodedIndirectData : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB, @sEncodedMemberInfo : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB)
    end
  end

  @[Extern]
  struct CRYPTCATATTRIBUTE
    property cbStruct : UInt32
    property pwszReferenceTag : Win32cr::Foundation::PWSTR
    property dwAttrTypeAndAction : UInt32
    property cbValue : UInt32
    property pbValue : UInt8*
    property dwReserved : UInt32
    def initialize(@cbStruct : UInt32, @pwszReferenceTag : Win32cr::Foundation::PWSTR, @dwAttrTypeAndAction : UInt32, @cbValue : UInt32, @pbValue : UInt8*, @dwReserved : UInt32)
    end
  end

  @[Extern]
  struct CRYPTCATCDF
    property cbStruct : UInt32
    property hFile : Win32cr::Foundation::HANDLE
    property dwCurFilePos : UInt32
    property dwLastMemberOffset : UInt32
    property fEOF : Win32cr::Foundation::BOOL
    property pwszResultDir : Win32cr::Foundation::PWSTR
    property hCATStore : Win32cr::Foundation::HANDLE
    def initialize(@cbStruct : UInt32, @hFile : Win32cr::Foundation::HANDLE, @dwCurFilePos : UInt32, @dwLastMemberOffset : UInt32, @fEOF : Win32cr::Foundation::BOOL, @pwszResultDir : Win32cr::Foundation::PWSTR, @hCATStore : Win32cr::Foundation::HANDLE)
    end
  end

  @[Extern]
  struct CATALOG_INFO
    property cbStruct : UInt32
    property wszCatalogFile : UInt16[260]
    def initialize(@cbStruct : UInt32, @wszCatalogFile : UInt16[260])
    end
  end

  @[Extern]
  struct MS_ADDINFO_CATALOGMEMBER
    property cbStruct : UInt32
    property pStore : Win32cr::Security::Cryptography::Catalog::CRYPTCATSTORE*
    property pMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*
    def initialize(@cbStruct : UInt32, @pStore : Win32cr::Security::Cryptography::Catalog::CRYPTCATSTORE*, @pMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*)
    end
  end

  def cryptCATOpen(pwszFileName : Win32cr::Foundation::PWSTR, fdwOpenFlags : Win32cr::Security::Cryptography::Catalog::CRYPTCAT_OPEN_FLAGS, hProv : LibC::UIntPtrT, dwPublicVersion : Win32cr::Security::Cryptography::Catalog::CRYPTCAT_VERSION, dwEncodingType : UInt32) : Win32cr::Foundation::HANDLE
    C.CryptCATOpen(pwszFileName, fdwOpenFlags, hProv, dwPublicVersion, dwEncodingType)
  end

  def cryptCATClose(hCatalog : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.CryptCATClose(hCatalog)
  end

  def cryptCATStoreFromHandle(hCatalog : Win32cr::Foundation::HANDLE) : Win32cr::Security::Cryptography::Catalog::CRYPTCATSTORE*
    C.CryptCATStoreFromHandle(hCatalog)
  end

  def cryptCATHandleFromStore(pCatStore : Win32cr::Security::Cryptography::Catalog::CRYPTCATSTORE*) : Win32cr::Foundation::HANDLE
    C.CryptCATHandleFromStore(pCatStore)
  end

  def cryptCATPersistStore(hCatalog : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL
    C.CryptCATPersistStore(hCatalog)
  end

  def cryptCATGetCatAttrInfo(hCatalog : Win32cr::Foundation::HANDLE, pwszReferenceTag : Win32cr::Foundation::PWSTR) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*
    C.CryptCATGetCatAttrInfo(hCatalog, pwszReferenceTag)
  end

  def cryptCATPutCatAttrInfo(hCatalog : Win32cr::Foundation::HANDLE, pwszReferenceTag : Win32cr::Foundation::PWSTR, dwAttrTypeAndAction : UInt32, cbData : UInt32, pbData : UInt8*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*
    C.CryptCATPutCatAttrInfo(hCatalog, pwszReferenceTag, dwAttrTypeAndAction, cbData, pbData)
  end

  def cryptCATEnumerateCatAttr(hCatalog : Win32cr::Foundation::HANDLE, pPrevAttr : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*
    C.CryptCATEnumerateCatAttr(hCatalog, pPrevAttr)
  end

  def cryptCATGetMemberInfo(hCatalog : Win32cr::Foundation::HANDLE, pwszReferenceTag : Win32cr::Foundation::PWSTR) : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*
    C.CryptCATGetMemberInfo(hCatalog, pwszReferenceTag)
  end

  def cryptCATAllocSortedMemberInfo(hCatalog : Win32cr::Foundation::HANDLE, pwszReferenceTag : Win32cr::Foundation::PWSTR) : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*
    C.CryptCATAllocSortedMemberInfo(hCatalog, pwszReferenceTag)
  end

  def cryptCATFreeSortedMemberInfo(hCatalog : Win32cr::Foundation::HANDLE, pCatMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*) : Void
    C.CryptCATFreeSortedMemberInfo(hCatalog, pCatMember)
  end

  def cryptCATGetAttrInfo(hCatalog : Win32cr::Foundation::HANDLE, pCatMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*, pwszReferenceTag : Win32cr::Foundation::PWSTR) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*
    C.CryptCATGetAttrInfo(hCatalog, pCatMember, pwszReferenceTag)
  end

  def cryptCATPutMemberInfo(hCatalog : Win32cr::Foundation::HANDLE, pwszFileName : Win32cr::Foundation::PWSTR, pwszReferenceTag : Win32cr::Foundation::PWSTR, pgSubjectType : LibC::GUID*, dwCertVersion : UInt32, cbSIPIndirectData : UInt32, pbSIPIndirectData : UInt8*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*
    C.CryptCATPutMemberInfo(hCatalog, pwszFileName, pwszReferenceTag, pgSubjectType, dwCertVersion, cbSIPIndirectData, pbSIPIndirectData)
  end

  def cryptCATPutAttrInfo(hCatalog : Win32cr::Foundation::HANDLE, pCatMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*, pwszReferenceTag : Win32cr::Foundation::PWSTR, dwAttrTypeAndAction : UInt32, cbData : UInt32, pbData : UInt8*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*
    C.CryptCATPutAttrInfo(hCatalog, pCatMember, pwszReferenceTag, dwAttrTypeAndAction, cbData, pbData)
  end

  def cryptCATEnumerateMember(hCatalog : Win32cr::Foundation::HANDLE, pPrevMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*
    C.CryptCATEnumerateMember(hCatalog, pPrevMember)
  end

  def cryptCATEnumerateAttr(hCatalog : Win32cr::Foundation::HANDLE, pCatMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*, pPrevAttr : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*
    C.CryptCATEnumerateAttr(hCatalog, pCatMember, pPrevAttr)
  end

  def cryptCATCDFOpen(pwszFilePath : Win32cr::Foundation::PWSTR, pfnParseError : Win32cr::Security::Cryptography::Catalog::PFN_CDF_PARSE_ERROR_CALLBACK) : Win32cr::Security::Cryptography::Catalog::CRYPTCATCDF*
    C.CryptCATCDFOpen(pwszFilePath, pfnParseError)
  end

  def cryptCATCDFClose(pCDF : Win32cr::Security::Cryptography::Catalog::CRYPTCATCDF*) : Win32cr::Foundation::BOOL
    C.CryptCATCDFClose(pCDF)
  end

  def cryptCATCDFEnumCatAttributes(pCDF : Win32cr::Security::Cryptography::Catalog::CRYPTCATCDF*, pPrevAttr : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*, pfnParseError : Win32cr::Security::Cryptography::Catalog::PFN_CDF_PARSE_ERROR_CALLBACK) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*
    C.CryptCATCDFEnumCatAttributes(pCDF, pPrevAttr, pfnParseError)
  end

  def cryptCATCDFEnumMembers(pCDF : Win32cr::Security::Cryptography::Catalog::CRYPTCATCDF*, pPrevMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*, pfnParseError : Win32cr::Security::Cryptography::Catalog::PFN_CDF_PARSE_ERROR_CALLBACK) : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*
    C.CryptCATCDFEnumMembers(pCDF, pPrevMember, pfnParseError)
  end

  def cryptCATCDFEnumAttributes(pCDF : Win32cr::Security::Cryptography::Catalog::CRYPTCATCDF*, pMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*, pPrevAttr : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*, pfnParseError : Win32cr::Security::Cryptography::Catalog::PFN_CDF_PARSE_ERROR_CALLBACK) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*
    C.CryptCATCDFEnumAttributes(pCDF, pMember, pPrevAttr, pfnParseError)
  end

  def isCatalogFile(hFile : Win32cr::Foundation::HANDLE, pwszFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL
    C.IsCatalogFile(hFile, pwszFileName)
  end

  def cryptCATAdminAcquireContext(phCatAdmin : LibC::IntPtrT*, pgSubsystem : LibC::GUID*, dwFlags : UInt32) : Win32cr::Foundation::BOOL
    C.CryptCATAdminAcquireContext(phCatAdmin, pgSubsystem, dwFlags)
  end

  def cryptCATAdminAcquireContext2(phCatAdmin : LibC::IntPtrT*, pgSubsystem : LibC::GUID*, pwszHashAlgorithm : Win32cr::Foundation::PWSTR, pStrongHashPolicy : Win32cr::Security::Cryptography::CERT_STRONG_SIGN_PARA*, dwFlags : UInt32) : Win32cr::Foundation::BOOL
    C.CryptCATAdminAcquireContext2(phCatAdmin, pgSubsystem, pwszHashAlgorithm, pStrongHashPolicy, dwFlags)
  end

  def cryptCATAdminReleaseContext(hCatAdmin : LibC::IntPtrT, dwFlags : UInt32) : Win32cr::Foundation::BOOL
    C.CryptCATAdminReleaseContext(hCatAdmin, dwFlags)
  end

  def cryptCATAdminReleaseCatalogContext(hCatAdmin : LibC::IntPtrT, hCatInfo : LibC::IntPtrT, dwFlags : UInt32) : Win32cr::Foundation::BOOL
    C.CryptCATAdminReleaseCatalogContext(hCatAdmin, hCatInfo, dwFlags)
  end

  def cryptCATAdminEnumCatalogFromHash(hCatAdmin : LibC::IntPtrT, pbHash : UInt8*, cbHash : UInt32, dwFlags : UInt32, phPrevCatInfo : LibC::IntPtrT*) : LibC::IntPtrT
    C.CryptCATAdminEnumCatalogFromHash(hCatAdmin, pbHash, cbHash, dwFlags, phPrevCatInfo)
  end

  def cryptCATAdminCalcHashFromFileHandle(hFile : Win32cr::Foundation::HANDLE, pcbHash : UInt32*, pbHash : UInt8*, dwFlags : UInt32) : Win32cr::Foundation::BOOL
    C.CryptCATAdminCalcHashFromFileHandle(hFile, pcbHash, pbHash, dwFlags)
  end

  def cryptCATAdminCalcHashFromFileHandle2(hCatAdmin : LibC::IntPtrT, hFile : Win32cr::Foundation::HANDLE, pcbHash : UInt32*, pbHash : UInt8*, dwFlags : UInt32) : Win32cr::Foundation::BOOL
    C.CryptCATAdminCalcHashFromFileHandle2(hCatAdmin, hFile, pcbHash, pbHash, dwFlags)
  end

  def cryptCATAdminAddCatalog(hCatAdmin : LibC::IntPtrT, pwszCatalogFile : Win32cr::Foundation::PWSTR, pwszSelectBaseName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : LibC::IntPtrT
    C.CryptCATAdminAddCatalog(hCatAdmin, pwszCatalogFile, pwszSelectBaseName, dwFlags)
  end

  def cryptCATAdminRemoveCatalog(hCatAdmin : LibC::IntPtrT, pwszCatalogFile : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::BOOL
    C.CryptCATAdminRemoveCatalog(hCatAdmin, pwszCatalogFile, dwFlags)
  end

  def cryptCATCatalogInfoFromContext(hCatInfo : LibC::IntPtrT, psCatInfo : Win32cr::Security::Cryptography::Catalog::CATALOG_INFO*, dwFlags : UInt32) : Win32cr::Foundation::BOOL
    C.CryptCATCatalogInfoFromContext(hCatInfo, psCatInfo, dwFlags)
  end

  def cryptCATAdminResolveCatalogPath(hCatAdmin : LibC::IntPtrT, pwszCatalogFile : Win32cr::Foundation::PWSTR, psCatInfo : Win32cr::Security::Cryptography::Catalog::CATALOG_INFO*, dwFlags : UInt32) : Win32cr::Foundation::BOOL
    C.CryptCATAdminResolveCatalogPath(hCatAdmin, pwszCatalogFile, psCatInfo, dwFlags)
  end

  def cryptCATAdminPauseServiceForBackup(dwFlags : UInt32, fResume : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL
    C.CryptCATAdminPauseServiceForBackup(dwFlags, fResume)
  end

  @[Link("wintrust")]
  lib C
    # :nodoc:
    fun CryptCATOpen(pwszFileName : Win32cr::Foundation::PWSTR, fdwOpenFlags : Win32cr::Security::Cryptography::Catalog::CRYPTCAT_OPEN_FLAGS, hProv : LibC::UIntPtrT, dwPublicVersion : Win32cr::Security::Cryptography::Catalog::CRYPTCAT_VERSION, dwEncodingType : UInt32) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CryptCATClose(hCatalog : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptCATStoreFromHandle(hCatalog : Win32cr::Foundation::HANDLE) : Win32cr::Security::Cryptography::Catalog::CRYPTCATSTORE*

    # :nodoc:
    fun CryptCATHandleFromStore(pCatStore : Win32cr::Security::Cryptography::Catalog::CRYPTCATSTORE*) : Win32cr::Foundation::HANDLE

    # :nodoc:
    fun CryptCATPersistStore(hCatalog : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptCATGetCatAttrInfo(hCatalog : Win32cr::Foundation::HANDLE, pwszReferenceTag : Win32cr::Foundation::PWSTR) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*

    # :nodoc:
    fun CryptCATPutCatAttrInfo(hCatalog : Win32cr::Foundation::HANDLE, pwszReferenceTag : Win32cr::Foundation::PWSTR, dwAttrTypeAndAction : UInt32, cbData : UInt32, pbData : UInt8*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*

    # :nodoc:
    fun CryptCATEnumerateCatAttr(hCatalog : Win32cr::Foundation::HANDLE, pPrevAttr : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*

    # :nodoc:
    fun CryptCATGetMemberInfo(hCatalog : Win32cr::Foundation::HANDLE, pwszReferenceTag : Win32cr::Foundation::PWSTR) : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*

    # :nodoc:
    fun CryptCATAllocSortedMemberInfo(hCatalog : Win32cr::Foundation::HANDLE, pwszReferenceTag : Win32cr::Foundation::PWSTR) : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*

    # :nodoc:
    fun CryptCATFreeSortedMemberInfo(hCatalog : Win32cr::Foundation::HANDLE, pCatMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*) : Void

    # :nodoc:
    fun CryptCATGetAttrInfo(hCatalog : Win32cr::Foundation::HANDLE, pCatMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*, pwszReferenceTag : Win32cr::Foundation::PWSTR) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*

    # :nodoc:
    fun CryptCATPutMemberInfo(hCatalog : Win32cr::Foundation::HANDLE, pwszFileName : Win32cr::Foundation::PWSTR, pwszReferenceTag : Win32cr::Foundation::PWSTR, pgSubjectType : LibC::GUID*, dwCertVersion : UInt32, cbSIPIndirectData : UInt32, pbSIPIndirectData : UInt8*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*

    # :nodoc:
    fun CryptCATPutAttrInfo(hCatalog : Win32cr::Foundation::HANDLE, pCatMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*, pwszReferenceTag : Win32cr::Foundation::PWSTR, dwAttrTypeAndAction : UInt32, cbData : UInt32, pbData : UInt8*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*

    # :nodoc:
    fun CryptCATEnumerateMember(hCatalog : Win32cr::Foundation::HANDLE, pPrevMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*

    # :nodoc:
    fun CryptCATEnumerateAttr(hCatalog : Win32cr::Foundation::HANDLE, pCatMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*, pPrevAttr : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*

    # :nodoc:
    fun CryptCATCDFOpen(pwszFilePath : Win32cr::Foundation::PWSTR, pfnParseError : Win32cr::Security::Cryptography::Catalog::PFN_CDF_PARSE_ERROR_CALLBACK) : Win32cr::Security::Cryptography::Catalog::CRYPTCATCDF*

    # :nodoc:
    fun CryptCATCDFClose(pCDF : Win32cr::Security::Cryptography::Catalog::CRYPTCATCDF*) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptCATCDFEnumCatAttributes(pCDF : Win32cr::Security::Cryptography::Catalog::CRYPTCATCDF*, pPrevAttr : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*, pfnParseError : Win32cr::Security::Cryptography::Catalog::PFN_CDF_PARSE_ERROR_CALLBACK) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*

    # :nodoc:
    fun CryptCATCDFEnumMembers(pCDF : Win32cr::Security::Cryptography::Catalog::CRYPTCATCDF*, pPrevMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*, pfnParseError : Win32cr::Security::Cryptography::Catalog::PFN_CDF_PARSE_ERROR_CALLBACK) : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*

    # :nodoc:
    fun CryptCATCDFEnumAttributes(pCDF : Win32cr::Security::Cryptography::Catalog::CRYPTCATCDF*, pMember : Win32cr::Security::Cryptography::Catalog::CRYPTCATMEMBER*, pPrevAttr : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*, pfnParseError : Win32cr::Security::Cryptography::Catalog::PFN_CDF_PARSE_ERROR_CALLBACK) : Win32cr::Security::Cryptography::Catalog::CRYPTCATATTRIBUTE*

    # :nodoc:
    fun IsCatalogFile(hFile : Win32cr::Foundation::HANDLE, pwszFileName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptCATAdminAcquireContext(phCatAdmin : LibC::IntPtrT*, pgSubsystem : LibC::GUID*, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptCATAdminAcquireContext2(phCatAdmin : LibC::IntPtrT*, pgSubsystem : LibC::GUID*, pwszHashAlgorithm : Win32cr::Foundation::PWSTR, pStrongHashPolicy : Win32cr::Security::Cryptography::CERT_STRONG_SIGN_PARA*, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptCATAdminReleaseContext(hCatAdmin : LibC::IntPtrT, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptCATAdminReleaseCatalogContext(hCatAdmin : LibC::IntPtrT, hCatInfo : LibC::IntPtrT, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptCATAdminEnumCatalogFromHash(hCatAdmin : LibC::IntPtrT, pbHash : UInt8*, cbHash : UInt32, dwFlags : UInt32, phPrevCatInfo : LibC::IntPtrT*) : LibC::IntPtrT

    # :nodoc:
    fun CryptCATAdminCalcHashFromFileHandle(hFile : Win32cr::Foundation::HANDLE, pcbHash : UInt32*, pbHash : UInt8*, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptCATAdminCalcHashFromFileHandle2(hCatAdmin : LibC::IntPtrT, hFile : Win32cr::Foundation::HANDLE, pcbHash : UInt32*, pbHash : UInt8*, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptCATAdminAddCatalog(hCatAdmin : LibC::IntPtrT, pwszCatalogFile : Win32cr::Foundation::PWSTR, pwszSelectBaseName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : LibC::IntPtrT

    # :nodoc:
    fun CryptCATAdminRemoveCatalog(hCatAdmin : LibC::IntPtrT, pwszCatalogFile : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptCATCatalogInfoFromContext(hCatInfo : LibC::IntPtrT, psCatInfo : Win32cr::Security::Cryptography::Catalog::CATALOG_INFO*, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptCATAdminResolveCatalogPath(hCatAdmin : LibC::IntPtrT, pwszCatalogFile : Win32cr::Foundation::PWSTR, psCatInfo : Win32cr::Security::Cryptography::Catalog::CATALOG_INFO*, dwFlags : UInt32) : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CryptCATAdminPauseServiceForBackup(dwFlags : UInt32, fResume : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

  end
end