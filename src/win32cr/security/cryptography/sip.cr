require "./../../foundation.cr"
require "./../cryptography.cr"
require "./catalog.cr"

module Win32cr::Security::Cryptography::Sip
  alias Pcryptsipgetsigneddatamsg = Proc(Win32cr::Security::Cryptography::Sip::SIP_SUBJECTINFO*, UInt32*, UInt32, UInt32*, UInt8*, Win32cr::Foundation::BOOL)*

  alias Pcryptsipputsigneddatamsg = Proc(Win32cr::Security::Cryptography::Sip::SIP_SUBJECTINFO*, UInt32, UInt32*, UInt32, UInt8*, Win32cr::Foundation::BOOL)*

  alias Pcryptsipcreateindirectdata = Proc(Win32cr::Security::Cryptography::Sip::SIP_SUBJECTINFO*, UInt32*, Win32cr::Security::Cryptography::Sip::SIP_INDIRECT_DATA*, Win32cr::Foundation::BOOL)*

  alias Pcryptsipverifyindirectdata = Proc(Win32cr::Security::Cryptography::Sip::SIP_SUBJECTINFO*, Win32cr::Security::Cryptography::Sip::SIP_INDIRECT_DATA*, Win32cr::Foundation::BOOL)*

  alias Pcryptsipremovesigneddatamsg = Proc(Win32cr::Security::Cryptography::Sip::SIP_SUBJECTINFO*, UInt32, Win32cr::Foundation::BOOL)*

  alias Pfnisfilesupported = Proc(Win32cr::Foundation::HANDLE, LibC::GUID*, Win32cr::Foundation::BOOL)*

  alias Pfnisfilesupportedname = Proc(Win32cr::Foundation::PWSTR, LibC::GUID*, Win32cr::Foundation::BOOL)*

  alias Pcryptsipgetcaps = Proc(Win32cr::Security::Cryptography::Sip::SIP_SUBJECTINFO*, Win32cr::Security::Cryptography::Sip::SIP_CAP_SET_V3*, Win32cr::Foundation::BOOL)*

  alias Pcryptsipgetsealeddigest = Proc(Win32cr::Security::Cryptography::Sip::SIP_SUBJECTINFO*, UInt8*, UInt32, UInt8*, UInt32*, Win32cr::Foundation::BOOL)*

  MSSIP_FLAGS_PROHIBIT_RESIZE_ON_CREATE = 65536_u32
  MSSIP_FLAGS_USE_CATALOG = 131072_u32
  MSSIP_FLAGS_MULTI_HASH = 262144_u32
  SPC_INC_PE_RESOURCES_FLAG = 128_u32
  SPC_INC_PE_DEBUG_INFO_FLAG = 64_u32
  SPC_INC_PE_IMPORT_ADDR_TABLE_FLAG = 32_u32
  SPC_EXC_PE_PAGE_HASHES_FLAG = 16_u32
  SPC_INC_PE_PAGE_HASHES_FLAG = 256_u32
  SPC_DIGEST_GENERATE_FLAG = 512_u32
  SPC_DIGEST_SIGN_FLAG = 1024_u32
  SPC_DIGEST_SIGN_EX_FLAG = 16384_u32
  SPC_RELAXED_PE_MARKER_CHECK = 2048_u32
  SPC_MARKER_CHECK_SKIP_SIP_INDIRECT_DATA_FLAG = 1_u32
  SPC_MARKER_CHECK_CURRENTLY_SUPPORTED_FLAGS = 1_u32
  MSSIP_ADDINFO_NONE = 0_u32
  MSSIP_ADDINFO_FLAT = 1_u32
  MSSIP_ADDINFO_CATMEMBER = 2_u32
  MSSIP_ADDINFO_BLOB = 3_u32
  MSSIP_ADDINFO_NONMSSIP = 500_u32
  SIP_CAP_SET_VERSION_2 = 2_u32
  SIP_CAP_SET_VERSION_3 = 3_u32
  SIP_CAP_SET_CUR_VER = 3_u32
  SIP_CAP_FLAG_SEALING = 1_u32
  SIP_MAX_MAGIC_NUMBER = 4_u32


  @[Extern]
  record SIP_SUBJECTINFO,
    cbSize : UInt32,
    pgSubjectType : LibC::GUID*,
    hFile : Win32cr::Foundation::HANDLE,
    pwsFileName : Win32cr::Foundation::PWSTR,
    pwsDisplayName : Win32cr::Foundation::PWSTR,
    dwReserved1 : UInt32,
    dwIntVersion : UInt32,
    hProv : LibC::UIntPtrT,
    digest_algorithm : Win32cr::Security::Cryptography::CRYPT_ALGORITHM_IDENTIFIER,
    dwFlags : UInt32,
    dwEncodingType : UInt32,
    dwReserved2 : UInt32,
    fdwCAPISettings : UInt32,
    fdwSecuritySettings : UInt32,
    dwIndex : UInt32,
    dwUnionChoice : UInt32,
    anonymous : Anonymous_e__Union,
    pClientData : Void* do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      psFlat : Win32cr::Security::Cryptography::Sip::MS_ADDINFO_FLAT*,
      psCatMember : Win32cr::Security::Cryptography::Catalog::MS_ADDINFO_CATALOGMEMBER*,
      psBlob : Win32cr::Security::Cryptography::Sip::MS_ADDINFO_BLOB*

  end

  @[Extern]
  record MS_ADDINFO_FLAT,
    cbStruct : UInt32,
    pIndirectData : Win32cr::Security::Cryptography::Sip::SIP_INDIRECT_DATA*

  @[Extern]
  record MS_ADDINFO_BLOB,
    cbStruct : UInt32,
    cbMemObject : UInt32,
    pbMemObject : UInt8*,
    cbMemSignedMsg : UInt32,
    pbMemSignedMsg : UInt8*

  @[Extern]
  record SIP_CAP_SET_V2,
    cbSize : UInt32,
    dwVersion : UInt32,
    isMultiSign : Win32cr::Foundation::BOOL,
    dwReserved : UInt32

  @[Extern]
  record SIP_CAP_SET_V3,
    cbSize : UInt32,
    dwVersion : UInt32,
    isMultiSign : Win32cr::Foundation::BOOL,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      dwFlags : UInt32,
      dwReserved : UInt32

  end

  @[Extern]
  record SIP_INDIRECT_DATA,
    data : Win32cr::Security::Cryptography::CRYPT_ATTRIBUTE_TYPE_VALUE,
    digest_algorithm : Win32cr::Security::Cryptography::CRYPT_ALGORITHM_IDENTIFIER,
    digest : Win32cr::Security::Cryptography::CRYPTOAPI_BLOB

  @[Extern]
  record SIP_DISPATCH_INFO,
    cbSize : UInt32,
    hSIP : Win32cr::Foundation::HANDLE,
    pfGet : Win32cr::Security::Cryptography::Sip::Pcryptsipgetsigneddatamsg,
    pfPut : Win32cr::Security::Cryptography::Sip::Pcryptsipputsigneddatamsg,
    pfCreate : Win32cr::Security::Cryptography::Sip::Pcryptsipcreateindirectdata,
    pfVerify : Win32cr::Security::Cryptography::Sip::Pcryptsipverifyindirectdata,
    pfRemove : Win32cr::Security::Cryptography::Sip::Pcryptsipremovesigneddatamsg

  @[Extern]
  record SIP_ADD_NEWPROVIDER,
    cbStruct : UInt32,
    pgSubject : LibC::GUID*,
    pwszDLLFileName : Win32cr::Foundation::PWSTR,
    pwszMagicNumber : Win32cr::Foundation::PWSTR,
    pwszIsFunctionName : Win32cr::Foundation::PWSTR,
    pwszGetFuncName : Win32cr::Foundation::PWSTR,
    pwszPutFuncName : Win32cr::Foundation::PWSTR,
    pwszCreateFuncName : Win32cr::Foundation::PWSTR,
    pwszVerifyFuncName : Win32cr::Foundation::PWSTR,
    pwszRemoveFuncName : Win32cr::Foundation::PWSTR,
    pwszIsFunctionNameFmt2 : Win32cr::Foundation::PWSTR,
    pwszGetCapFuncName : Win32cr::Foundation::PWSTR

  @[Link("wintrust")]
  @[Link("crypt32")]
  lib C
    fun CryptSIPGetSignedDataMsg(pSubjectInfo : Win32cr::Security::Cryptography::Sip::SIP_SUBJECTINFO*, pdwEncodingType : Win32cr::Security::Cryptography::CERT_QUERY_ENCODING_TYPE*, dwIndex : UInt32, pcbSignedDataMsg : UInt32*, pbSignedDataMsg : UInt8*) : Win32cr::Foundation::BOOL

    fun CryptSIPPutSignedDataMsg(pSubjectInfo : Win32cr::Security::Cryptography::Sip::SIP_SUBJECTINFO*, dwEncodingType : Win32cr::Security::Cryptography::CERT_QUERY_ENCODING_TYPE, pdwIndex : UInt32*, cbSignedDataMsg : UInt32, pbSignedDataMsg : UInt8*) : Win32cr::Foundation::BOOL

    fun CryptSIPCreateIndirectData(pSubjectInfo : Win32cr::Security::Cryptography::Sip::SIP_SUBJECTINFO*, pcbIndirectData : UInt32*, pIndirectData : Win32cr::Security::Cryptography::Sip::SIP_INDIRECT_DATA*) : Win32cr::Foundation::BOOL

    fun CryptSIPVerifyIndirectData(pSubjectInfo : Win32cr::Security::Cryptography::Sip::SIP_SUBJECTINFO*, pIndirectData : Win32cr::Security::Cryptography::Sip::SIP_INDIRECT_DATA*) : Win32cr::Foundation::BOOL

    fun CryptSIPRemoveSignedDataMsg(pSubjectInfo : Win32cr::Security::Cryptography::Sip::SIP_SUBJECTINFO*, dwIndex : UInt32) : Win32cr::Foundation::BOOL

    fun CryptSIPLoad(pgSubject : LibC::GUID*, dwFlags : UInt32, pSipDispatch : Win32cr::Security::Cryptography::Sip::SIP_DISPATCH_INFO*) : Win32cr::Foundation::BOOL

    fun CryptSIPRetrieveSubjectGuid(file_name : Win32cr::Foundation::PWSTR, hFileIn : Win32cr::Foundation::HANDLE, pgSubject : LibC::GUID*) : Win32cr::Foundation::BOOL

    fun CryptSIPRetrieveSubjectGuidForCatalogFile(file_name : Win32cr::Foundation::PWSTR, hFileIn : Win32cr::Foundation::HANDLE, pgSubject : LibC::GUID*) : Win32cr::Foundation::BOOL

    fun CryptSIPAddProvider(psNewProv : Win32cr::Security::Cryptography::Sip::SIP_ADD_NEWPROVIDER*) : Win32cr::Foundation::BOOL

    fun CryptSIPRemoveProvider(pgProv : LibC::GUID*) : Win32cr::Foundation::BOOL

    fun CryptSIPGetCaps(pSubjInfo : Win32cr::Security::Cryptography::Sip::SIP_SUBJECTINFO*, pCaps : Win32cr::Security::Cryptography::Sip::SIP_CAP_SET_V3*) : Win32cr::Foundation::BOOL

    fun CryptSIPGetSealedDigest(pSubjectInfo : Win32cr::Security::Cryptography::Sip::SIP_SUBJECTINFO*, pSig : UInt8*, dwSig : UInt32, pbDigest : UInt8*, pcbDigest : UInt32*) : Win32cr::Foundation::BOOL

  end
end