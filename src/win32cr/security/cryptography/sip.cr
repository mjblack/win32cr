require "../../foundation.cr"
require "../../security/cryptography.cr"
require "../../security/cryptography/catalog.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:wintrust.dll")]
@[Link(ldflags: "/DELAYLOAD:crypt32.dll")]
{% else %}
@[Link("wintrust")]
@[Link("crypt32")]
{% end %}
lib LibWin32
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
  SIP_CAP_SET_VERSION_2 = 2_u32
  SIP_CAP_SET_VERSION_3 = 3_u32
  SIP_CAP_SET_CUR_VER = 3_u32
  SIP_CAP_FLAG_SEALING = 1_u32
  SIP_MAX_MAGIC_NUMBER = 4_u32

  alias Pcryptsipgetsigneddatamsg = Proc(SIP_SUBJECTINFO*, UInt32*, UInt32, UInt32*, UInt8*, LibC::BOOL)
  alias Pcryptsipputsigneddatamsg = Proc(SIP_SUBJECTINFO*, UInt32, UInt32*, UInt32, UInt8*, LibC::BOOL)
  alias Pcryptsipcreateindirectdata = Proc(SIP_SUBJECTINFO*, UInt32*, SIP_INDIRECT_DATA*, LibC::BOOL)
  alias Pcryptsipverifyindirectdata = Proc(SIP_SUBJECTINFO*, SIP_INDIRECT_DATA*, LibC::BOOL)
  alias Pcryptsipremovesigneddatamsg = Proc(SIP_SUBJECTINFO*, UInt32, LibC::BOOL)
  alias Pfnisfilesupported = Proc(LibC::HANDLE, Guid*, LibC::BOOL)
  alias Pfnisfilesupportedname = Proc(LibC::LPWSTR, Guid*, LibC::BOOL)
  alias Pcryptsipgetcaps = Proc(SIP_SUBJECTINFO*, SIP_CAP_SET_V3*, LibC::BOOL)
  alias Pcryptsipgetsealeddigest = Proc(SIP_SUBJECTINFO*, UInt8*, UInt32, UInt8*, UInt32*, LibC::BOOL)

  union SIP_SUBJECTINFO_Anonymous_e__Union
    ps_flat : MS_ADDINFO_FLAT*
    ps_cat_member : MS_ADDINFO_CATALOGMEMBER*
    ps_blob : MS_ADDINFO_BLOB*
  end
  union SIP_CAP_SET_V3_Anonymous_e__Union
    dw_flags : UInt32
    dw_reserved : UInt32
  end

  struct SIP_SUBJECTINFO
    cb_size : UInt32
    pg_subject_type : Guid*
    h_file : LibC::HANDLE
    pws_file_name : LibC::LPWSTR
    pws_display_name : LibC::LPWSTR
    dw_reserved1 : UInt32
    dw_int_version : UInt32
    h_prov : LibC::UINT_PTR
    digest_algorithm : CRYPT_ALGORITHM_IDENTIFIER
    dw_flags : UInt32
    dw_encoding_type : UInt32
    dw_reserved2 : UInt32
    fdw_capi_settings : UInt32
    fdw_security_settings : UInt32
    dw_index : UInt32
    dw_union_choice : UInt32
    anonymous : SIP_SUBJECTINFO_Anonymous_e__Union
    p_client_data : Void*
  end
  struct MS_ADDINFO_FLAT
    cb_struct : UInt32
    p_indirect_data : SIP_INDIRECT_DATA*
  end
  struct MS_ADDINFO_CATALOGMEMBER
    cb_struct : UInt32
    p_store : CRYPTCATSTORE*
    p_member : CRYPTCATMEMBER*
  end
  struct MS_ADDINFO_BLOB
    cb_struct : UInt32
    cb_mem_object : UInt32
    pb_mem_object : UInt8*
    cb_mem_signed_msg : UInt32
    pb_mem_signed_msg : UInt8*
  end
  struct SIP_CAP_SET_V2
    cb_size : UInt32
    dw_version : UInt32
    is_multi_sign : LibC::BOOL
    dw_reserved : UInt32
  end
  struct SIP_CAP_SET_V3
    cb_size : UInt32
    dw_version : UInt32
    is_multi_sign : LibC::BOOL
    anonymous : SIP_CAP_SET_V3_Anonymous_e__Union
  end
  struct SIP_INDIRECT_DATA
    data : CRYPT_ATTRIBUTE_TYPE_VALUE
    digest_algorithm : CRYPT_ALGORITHM_IDENTIFIER
    digest : CRYPTOAPI_BLOB
  end
  struct SIP_DISPATCH_INFO
    cb_size : UInt32
    h_sip : LibC::HANDLE
    pf_get : Pcryptsipgetsigneddatamsg
    pf_put : Pcryptsipputsigneddatamsg
    pf_create : Pcryptsipcreateindirectdata
    pf_verify : Pcryptsipverifyindirectdata
    pf_remove : Pcryptsipremovesigneddatamsg
  end
  struct SIP_ADD_NEWPROVIDER
    cb_struct : UInt32
    pg_subject : Guid*
    pwsz_dll_file_name : LibC::LPWSTR
    pwsz_magic_number : LibC::LPWSTR
    pwsz_is_function_name : LibC::LPWSTR
    pwsz_get_func_name : LibC::LPWSTR
    pwsz_put_func_name : LibC::LPWSTR
    pwsz_create_func_name : LibC::LPWSTR
    pwsz_verify_func_name : LibC::LPWSTR
    pwsz_remove_func_name : LibC::LPWSTR
    pwsz_is_function_name_fmt2 : LibC::LPWSTR
    pwsz_get_cap_func_name : LibC::LPWSTR
  end


  # Params # psubjectinfo : SIP_SUBJECTINFO* [In],pdwencodingtype : CERT_QUERY_ENCODING_TYPE* [In],dwindex : UInt32 [In],pcbsigneddatamsg : UInt32* [In],pbsigneddatamsg : UInt8* [In]
  fun CryptSIPGetSignedDataMsg(psubjectinfo : SIP_SUBJECTINFO*, pdwencodingtype : CERT_QUERY_ENCODING_TYPE*, dwindex : UInt32, pcbsigneddatamsg : UInt32*, pbsigneddatamsg : UInt8*) : LibC::BOOL

  # Params # psubjectinfo : SIP_SUBJECTINFO* [In],dwencodingtype : CERT_QUERY_ENCODING_TYPE [In],pdwindex : UInt32* [In],cbsigneddatamsg : UInt32 [In],pbsigneddatamsg : UInt8* [In]
  fun CryptSIPPutSignedDataMsg(psubjectinfo : SIP_SUBJECTINFO*, dwencodingtype : CERT_QUERY_ENCODING_TYPE, pdwindex : UInt32*, cbsigneddatamsg : UInt32, pbsigneddatamsg : UInt8*) : LibC::BOOL

  # Params # psubjectinfo : SIP_SUBJECTINFO* [In],pcbindirectdata : UInt32* [In],pindirectdata : SIP_INDIRECT_DATA* [In]
  fun CryptSIPCreateIndirectData(psubjectinfo : SIP_SUBJECTINFO*, pcbindirectdata : UInt32*, pindirectdata : SIP_INDIRECT_DATA*) : LibC::BOOL

  # Params # psubjectinfo : SIP_SUBJECTINFO* [In],pindirectdata : SIP_INDIRECT_DATA* [In]
  fun CryptSIPVerifyIndirectData(psubjectinfo : SIP_SUBJECTINFO*, pindirectdata : SIP_INDIRECT_DATA*) : LibC::BOOL

  # Params # psubjectinfo : SIP_SUBJECTINFO* [In],dwindex : UInt32 [In]
  fun CryptSIPRemoveSignedDataMsg(psubjectinfo : SIP_SUBJECTINFO*, dwindex : UInt32) : LibC::BOOL

  # Params # pgsubject : Guid* [In],dwflags : UInt32 [In],psipdispatch : SIP_DISPATCH_INFO* [In]
  fun CryptSIPLoad(pgsubject : Guid*, dwflags : UInt32, psipdispatch : SIP_DISPATCH_INFO*) : LibC::BOOL

  # Params # filename : LibC::LPWSTR [In],hfilein : LibC::HANDLE [In],pgsubject : Guid* [In]
  fun CryptSIPRetrieveSubjectGuid(filename : LibC::LPWSTR, hfilein : LibC::HANDLE, pgsubject : Guid*) : LibC::BOOL

  # Params # filename : LibC::LPWSTR [In],hfilein : LibC::HANDLE [In],pgsubject : Guid* [In]
  fun CryptSIPRetrieveSubjectGuidForCatalogFile(filename : LibC::LPWSTR, hfilein : LibC::HANDLE, pgsubject : Guid*) : LibC::BOOL

  # Params # psnewprov : SIP_ADD_NEWPROVIDER* [In]
  fun CryptSIPAddProvider(psnewprov : SIP_ADD_NEWPROVIDER*) : LibC::BOOL

  # Params # pgprov : Guid* [In]
  fun CryptSIPRemoveProvider(pgprov : Guid*) : LibC::BOOL

  # Params # psubjinfo : SIP_SUBJECTINFO* [In],pcaps : SIP_CAP_SET_V3* [In]
  fun CryptSIPGetCaps(psubjinfo : SIP_SUBJECTINFO*, pcaps : SIP_CAP_SET_V3*) : LibC::BOOL

  # Params # psubjectinfo : SIP_SUBJECTINFO* [In],psig : UInt8* [In],dwsig : UInt32 [In],pbdigest : UInt8* [In],pcbdigest : UInt32* [In]
  fun CryptSIPGetSealedDigest(psubjectinfo : SIP_SUBJECTINFO*, psig : UInt8*, dwsig : UInt32, pbdigest : UInt8*, pcbdigest : UInt32*) : LibC::BOOL
end
