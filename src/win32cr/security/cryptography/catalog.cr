require "../../foundation.cr"
require "../../security/cryptography/sip.cr"
require "../../security/cryptography.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:wintrust.dll")]
{% else %}
@[Link("wintrust")]
{% end %}
lib LibWin32
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

  alias PFN_CDF_PARSE_ERROR_CALLBACK = Proc(UInt32, UInt32, LibC::LPWSTR, Void)


  enum CRYPTCAT_VERSION : UInt32
    CRYPTCAT_VERSION_1 = 256
    CRYPTCAT_VERSION_2 = 512
  end

  enum CRYPTCAT_OPEN_FLAGS : UInt32
    CRYPTCAT_OPEN_ALWAYS = 2
    CRYPTCAT_OPEN_CREATENEW = 1
    CRYPTCAT_OPEN_EXISTING = 4
    CRYPTCAT_OPEN_EXCLUDE_PAGE_HASHES = 65536
    CRYPTCAT_OPEN_INCLUDE_PAGE_HASHES = 131072
    CRYPTCAT_OPEN_VERIFYSIGHASH = 268435456
    CRYPTCAT_OPEN_NO_CONTENT_HCRYPTMSG = 536870912
    CRYPTCAT_OPEN_SORTED = 1073741824
    CRYPTCAT_OPEN_FLAGS_MASK = 4294901760
  end

  struct CRYPTCATSTORE
    cb_struct : UInt32
    dw_public_version : UInt32
    pwsz_p7_file : LibC::LPWSTR
    h_prov : LibC::UINT_PTR
    dw_encoding_type : UInt32
    fdw_store_flags : CRYPTCAT_OPEN_FLAGS
    h_reserved : LibC::HANDLE
    h_attrs : LibC::HANDLE
    h_crypt_msg : Void*
    h_sorted : LibC::HANDLE
  end
  struct CRYPTCATMEMBER
    cb_struct : UInt32
    pwsz_reference_tag : LibC::LPWSTR
    pwsz_file_name : LibC::LPWSTR
    g_subject_type : Guid
    fdw_member_flags : UInt32
    p_indirect_data : SIP_INDIRECT_DATA*
    dw_cert_version : UInt32
    dw_reserved : UInt32
    h_reserved : LibC::HANDLE
    s_encoded_indirect_data : CRYPTOAPI_BLOB
    s_encoded_member_info : CRYPTOAPI_BLOB
  end
  struct CRYPTCATATTRIBUTE
    cb_struct : UInt32
    pwsz_reference_tag : LibC::LPWSTR
    dw_attr_type_and_action : UInt32
    cb_value : UInt32
    pb_value : UInt8*
    dw_reserved : UInt32
  end
  struct CRYPTCATCDF
    cb_struct : UInt32
    h_file : LibC::HANDLE
    dw_cur_file_pos : UInt32
    dw_last_member_offset : UInt32
    f_eof : LibC::BOOL
    pwsz_result_dir : LibC::LPWSTR
    h_cat_store : LibC::HANDLE
  end
  struct CATALOG_INFO
    cb_struct : UInt32
    wsz_catalog_file : Char[260]*
  end


  # Params # pwszfilename : LibC::LPWSTR [In],fdwopenflags : CRYPTCAT_OPEN_FLAGS [In],hprov : LibC::UINT_PTR [In],dwpublicversion : CRYPTCAT_VERSION [In],dwencodingtype : UInt32 [In]
  fun CryptCATOpen(pwszfilename : LibC::LPWSTR, fdwopenflags : CRYPTCAT_OPEN_FLAGS, hprov : LibC::UINT_PTR, dwpublicversion : CRYPTCAT_VERSION, dwencodingtype : UInt32) : LibC::HANDLE

  # Params # hcatalog : LibC::HANDLE [In]
  fun CryptCATClose(hcatalog : LibC::HANDLE) : LibC::BOOL

  # Params # hcatalog : LibC::HANDLE [In]
  fun CryptCATStoreFromHandle(hcatalog : LibC::HANDLE) : CRYPTCATSTORE*

  # Params # pcatstore : CRYPTCATSTORE* [In]
  fun CryptCATHandleFromStore(pcatstore : CRYPTCATSTORE*) : LibC::HANDLE

  # Params # hcatalog : LibC::HANDLE [In]
  fun CryptCATPersistStore(hcatalog : LibC::HANDLE) : LibC::BOOL

  # Params # hcatalog : LibC::HANDLE [In],pwszreferencetag : LibC::LPWSTR [In]
  fun CryptCATGetCatAttrInfo(hcatalog : LibC::HANDLE, pwszreferencetag : LibC::LPWSTR) : CRYPTCATATTRIBUTE*

  # Params # hcatalog : LibC::HANDLE [In],pwszreferencetag : LibC::LPWSTR [In],dwattrtypeandaction : UInt32 [In],cbdata : UInt32 [In],pbdata : UInt8* [In]
  fun CryptCATPutCatAttrInfo(hcatalog : LibC::HANDLE, pwszreferencetag : LibC::LPWSTR, dwattrtypeandaction : UInt32, cbdata : UInt32, pbdata : UInt8*) : CRYPTCATATTRIBUTE*

  # Params # hcatalog : LibC::HANDLE [In],pprevattr : CRYPTCATATTRIBUTE* [In]
  fun CryptCATEnumerateCatAttr(hcatalog : LibC::HANDLE, pprevattr : CRYPTCATATTRIBUTE*) : CRYPTCATATTRIBUTE*

  # Params # hcatalog : LibC::HANDLE [In],pwszreferencetag : LibC::LPWSTR [In]
  fun CryptCATGetMemberInfo(hcatalog : LibC::HANDLE, pwszreferencetag : LibC::LPWSTR) : CRYPTCATMEMBER*

  # Params # hcatalog : LibC::HANDLE [In],pwszreferencetag : LibC::LPWSTR [In]
  fun CryptCATAllocSortedMemberInfo(hcatalog : LibC::HANDLE, pwszreferencetag : LibC::LPWSTR) : CRYPTCATMEMBER*

  # Params # hcatalog : LibC::HANDLE [In],pcatmember : CRYPTCATMEMBER* [In]
  fun CryptCATFreeSortedMemberInfo(hcatalog : LibC::HANDLE, pcatmember : CRYPTCATMEMBER*)

  # Params # hcatalog : LibC::HANDLE [In],pcatmember : CRYPTCATMEMBER* [In],pwszreferencetag : LibC::LPWSTR [In]
  fun CryptCATGetAttrInfo(hcatalog : LibC::HANDLE, pcatmember : CRYPTCATMEMBER*, pwszreferencetag : LibC::LPWSTR) : CRYPTCATATTRIBUTE*

  # Params # hcatalog : LibC::HANDLE [In],pwszfilename : LibC::LPWSTR [In],pwszreferencetag : LibC::LPWSTR [In],pgsubjecttype : Guid* [In],dwcertversion : UInt32 [In],cbsipindirectdata : UInt32 [In],pbsipindirectdata : UInt8* [In]
  fun CryptCATPutMemberInfo(hcatalog : LibC::HANDLE, pwszfilename : LibC::LPWSTR, pwszreferencetag : LibC::LPWSTR, pgsubjecttype : Guid*, dwcertversion : UInt32, cbsipindirectdata : UInt32, pbsipindirectdata : UInt8*) : CRYPTCATMEMBER*

  # Params # hcatalog : LibC::HANDLE [In],pcatmember : CRYPTCATMEMBER* [In],pwszreferencetag : LibC::LPWSTR [In],dwattrtypeandaction : UInt32 [In],cbdata : UInt32 [In],pbdata : UInt8* [In]
  fun CryptCATPutAttrInfo(hcatalog : LibC::HANDLE, pcatmember : CRYPTCATMEMBER*, pwszreferencetag : LibC::LPWSTR, dwattrtypeandaction : UInt32, cbdata : UInt32, pbdata : UInt8*) : CRYPTCATATTRIBUTE*

  # Params # hcatalog : LibC::HANDLE [In],pprevmember : CRYPTCATMEMBER* [In]
  fun CryptCATEnumerateMember(hcatalog : LibC::HANDLE, pprevmember : CRYPTCATMEMBER*) : CRYPTCATMEMBER*

  # Params # hcatalog : LibC::HANDLE [In],pcatmember : CRYPTCATMEMBER* [In],pprevattr : CRYPTCATATTRIBUTE* [In]
  fun CryptCATEnumerateAttr(hcatalog : LibC::HANDLE, pcatmember : CRYPTCATMEMBER*, pprevattr : CRYPTCATATTRIBUTE*) : CRYPTCATATTRIBUTE*

  # Params # pwszfilepath : LibC::LPWSTR [In],pfnparseerror : PFN_CDF_PARSE_ERROR_CALLBACK [In]
  fun CryptCATCDFOpen(pwszfilepath : LibC::LPWSTR, pfnparseerror : PFN_CDF_PARSE_ERROR_CALLBACK) : CRYPTCATCDF*

  # Params # pcdf : CRYPTCATCDF* [In]
  fun CryptCATCDFClose(pcdf : CRYPTCATCDF*) : LibC::BOOL

  # Params # pcdf : CRYPTCATCDF* [In],pprevattr : CRYPTCATATTRIBUTE* [In],pfnparseerror : PFN_CDF_PARSE_ERROR_CALLBACK [In]
  fun CryptCATCDFEnumCatAttributes(pcdf : CRYPTCATCDF*, pprevattr : CRYPTCATATTRIBUTE*, pfnparseerror : PFN_CDF_PARSE_ERROR_CALLBACK) : CRYPTCATATTRIBUTE*

  # Params # pcdf : CRYPTCATCDF* [In],pprevmember : CRYPTCATMEMBER* [In],pfnparseerror : PFN_CDF_PARSE_ERROR_CALLBACK [In]
  fun CryptCATCDFEnumMembers(pcdf : CRYPTCATCDF*, pprevmember : CRYPTCATMEMBER*, pfnparseerror : PFN_CDF_PARSE_ERROR_CALLBACK) : CRYPTCATMEMBER*

  # Params # pcdf : CRYPTCATCDF* [In],pmember : CRYPTCATMEMBER* [In],pprevattr : CRYPTCATATTRIBUTE* [In],pfnparseerror : PFN_CDF_PARSE_ERROR_CALLBACK [In]
  fun CryptCATCDFEnumAttributes(pcdf : CRYPTCATCDF*, pmember : CRYPTCATMEMBER*, pprevattr : CRYPTCATATTRIBUTE*, pfnparseerror : PFN_CDF_PARSE_ERROR_CALLBACK) : CRYPTCATATTRIBUTE*

  # Params # hfile : LibC::HANDLE [In],pwszfilename : LibC::LPWSTR [In]
  fun IsCatalogFile(hfile : LibC::HANDLE, pwszfilename : LibC::LPWSTR) : LibC::BOOL

  # Params # phcatadmin : LibC::IntPtrT* [In],pgsubsystem : Guid* [In],dwflags : UInt32 [In]
  fun CryptCATAdminAcquireContext(phcatadmin : LibC::IntPtrT*, pgsubsystem : Guid*, dwflags : UInt32) : LibC::BOOL

  # Params # phcatadmin : LibC::IntPtrT* [In],pgsubsystem : Guid* [In],pwszhashalgorithm : LibC::LPWSTR [In],pstronghashpolicy : CERT_STRONG_SIGN_PARA* [In],dwflags : UInt32 [In]
  fun CryptCATAdminAcquireContext2(phcatadmin : LibC::IntPtrT*, pgsubsystem : Guid*, pwszhashalgorithm : LibC::LPWSTR, pstronghashpolicy : CERT_STRONG_SIGN_PARA*, dwflags : UInt32) : LibC::BOOL

  # Params # hcatadmin : LibC::IntPtrT [In],dwflags : UInt32 [In]
  fun CryptCATAdminReleaseContext(hcatadmin : LibC::IntPtrT, dwflags : UInt32) : LibC::BOOL

  # Params # hcatadmin : LibC::IntPtrT [In],hcatinfo : LibC::IntPtrT [In],dwflags : UInt32 [In]
  fun CryptCATAdminReleaseCatalogContext(hcatadmin : LibC::IntPtrT, hcatinfo : LibC::IntPtrT, dwflags : UInt32) : LibC::BOOL

  # Params # hcatadmin : LibC::IntPtrT [In],pbhash : UInt8* [In],cbhash : UInt32 [In],dwflags : UInt32 [In],phprevcatinfo : LibC::IntPtrT* [In]
  fun CryptCATAdminEnumCatalogFromHash(hcatadmin : LibC::IntPtrT, pbhash : UInt8*, cbhash : UInt32, dwflags : UInt32, phprevcatinfo : LibC::IntPtrT*) : LibC::IntPtrT

  # Params # hfile : LibC::HANDLE [In],pcbhash : UInt32* [In],pbhash : UInt8* [In],dwflags : UInt32 [In]
  fun CryptCATAdminCalcHashFromFileHandle(hfile : LibC::HANDLE, pcbhash : UInt32*, pbhash : UInt8*, dwflags : UInt32) : LibC::BOOL

  # Params # hcatadmin : LibC::IntPtrT [In],hfile : LibC::HANDLE [In],pcbhash : UInt32* [In],pbhash : UInt8* [In],dwflags : UInt32 [In]
  fun CryptCATAdminCalcHashFromFileHandle2(hcatadmin : LibC::IntPtrT, hfile : LibC::HANDLE, pcbhash : UInt32*, pbhash : UInt8*, dwflags : UInt32) : LibC::BOOL

  # Params # hcatadmin : LibC::IntPtrT [In],pwszcatalogfile : LibC::LPWSTR [In],pwszselectbasename : LibC::LPWSTR [In],dwflags : UInt32 [In]
  fun CryptCATAdminAddCatalog(hcatadmin : LibC::IntPtrT, pwszcatalogfile : LibC::LPWSTR, pwszselectbasename : LibC::LPWSTR, dwflags : UInt32) : LibC::IntPtrT

  # Params # hcatadmin : LibC::IntPtrT [In],pwszcatalogfile : LibC::LPWSTR [In],dwflags : UInt32 [In]
  fun CryptCATAdminRemoveCatalog(hcatadmin : LibC::IntPtrT, pwszcatalogfile : LibC::LPWSTR, dwflags : UInt32) : LibC::BOOL

  # Params # hcatinfo : LibC::IntPtrT [In],pscatinfo : CATALOG_INFO* [In],dwflags : UInt32 [In]
  fun CryptCATCatalogInfoFromContext(hcatinfo : LibC::IntPtrT, pscatinfo : CATALOG_INFO*, dwflags : UInt32) : LibC::BOOL

  # Params # hcatadmin : LibC::IntPtrT [In],pwszcatalogfile : LibC::LPWSTR [In],pscatinfo : CATALOG_INFO* [In],dwflags : UInt32 [In]
  fun CryptCATAdminResolveCatalogPath(hcatadmin : LibC::IntPtrT, pwszcatalogfile : LibC::LPWSTR, pscatinfo : CATALOG_INFO*, dwflags : UInt32) : LibC::BOOL

  # Params # dwflags : UInt32 [In],fresume : LibC::BOOL [In]
  fun CryptCATAdminPauseServiceForBackup(dwflags : UInt32, fresume : LibC::BOOL) : LibC::BOOL
end
