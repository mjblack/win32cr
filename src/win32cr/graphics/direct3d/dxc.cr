require "../../foundation.cr"
require "../../system/com.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:dxcompiler.dll")]
{% else %}
@[Link("dxcompiler")]
{% end %}
lib LibWin32
  DXC_HASHFLAG_INCLUDES_SOURCE = 1_u32
  DxcValidatorFlags_Default = 0_u32
  DxcValidatorFlags_InPlaceEdit = 1_u32
  DxcValidatorFlags_RootSignatureOnly = 2_u32
  DxcValidatorFlags_ModuleOnly = 4_u32
  DxcValidatorFlags_ValidMask = 7_u32
  DxcVersionInfoFlags_None = 0_u32
  DxcVersionInfoFlags_Debug = 1_u32
  DxcVersionInfoFlags_Internal = 2_u32
  CLSID_DxcCompiler = "73e22d93-e6ce-47f3-b5bf-f0664f39c1b0"
  CLSID_DxcLinker = "ef6a8087-b0ea-4d56-9e45-d07e1a8b7806"
  CLSID_DxcDiaDataSource = "cd1f6b73-2ab0-484d-8edc-ebe7a43ca09f"
  CLSID_DxcCompilerArgs = "3e56ae82-224d-470f-a1a1-fe3016ee9f9d"
  CLSID_DxcLibrary = "6245d6af-66e0-48fd-80b4-4d271796748c"
  CLSID_DxcValidator = "8ca3e215-f728-4cf3-8cdd-88af917587a1"
  CLSID_DxcAssembler = "d728db68-f903-4f80-94cd-dccf76ec7151"
  CLSID_DxcContainerReflection = "b9f54489-55b8-400c-ba3a-1675e4728b91"
  CLSID_DxcOptimizer = "ae2cd79f-cc22-453f-9b6b-b124e7a5204c"
  CLSID_DxcContainerBuilder = "94134294-411f-4574-b4d0-8741e25240d2"
  CLSID_DxcPdbUtils = "54621dfb-f2ce-457e-ae8c-ec355faeec7c"

  alias DxcCreateInstanceProc = Proc(Guid*, Guid*, Void**, HRESULT)
  alias DxcCreateInstance2Proc = Proc(IMalloc, Guid*, Guid*, Void**, HRESULT)


  enum DXC_CP : UInt32
    DXC_CP_ACP = 0
    DXC_CP_UTF16 = 1200
    DXC_CP_UTF8 = 65001
  end

  enum DXC_OUT_KIND : Int32
    DXC_OUT_NONE = 0
    DXC_OUT_OBJECT = 1
    DXC_OUT_ERRORS = 2
    DXC_OUT_PDB = 3
    DXC_OUT_SHADER_HASH = 4
    DXC_OUT_DISASSEMBLY = 5
    DXC_OUT_HLSL = 6
    DXC_OUT_TEXT = 7
    DXC_OUT_REFLECTION = 8
    DXC_OUT_ROOT_SIGNATURE = 9
    DXC_OUT_EXTRA_OUTPUTS = 10
    DXC_OUT_FORCE_DWORD = -1
  end

  struct DxcShaderHash
    flags : UInt32
    hash_digest : UInt8[16]*
  end
  struct DxcBuffer
    ptr : Void*
    size : LibC::UINT_PTR
    encoding : UInt32
  end
  struct DxcDefine
    name : LibC::LPWSTR
    value : LibC::LPWSTR
  end
  struct DxcArgPair
    p_name : LibC::LPWSTR
    p_value : LibC::LPWSTR
  end


  struct IDxcBlobVTbl
    query_interface : Proc(IDxcBlob*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcBlob*, UInt32)
    release : Proc(IDxcBlob*, UInt32)
    get_buffer_pointer : Proc(IDxcBlob*, Void**)
    get_buffer_size : Proc(IDxcBlob*, LibC::UINT_PTR)
  end

  IDxcBlob_GUID = "8ba5fb08-5195-40e2-ac58-0d989c3a0102"
  IID_IDxcBlob = LibC::GUID.new(0x8ba5fb08_u32, 0x5195_u16, 0x40e2_u16, StaticArray[0xac_u8, 0x58_u8, 0xd_u8, 0x98_u8, 0x9c_u8, 0x3a_u8, 0x1_u8, 0x2_u8])
  struct IDxcBlob
    lpVtbl : IDxcBlobVTbl*
  end

  struct IDxcBlobEncodingVTbl
    query_interface : Proc(IDxcBlobEncoding*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcBlobEncoding*, UInt32)
    release : Proc(IDxcBlobEncoding*, UInt32)
    get_buffer_pointer : Proc(IDxcBlobEncoding*, Void**)
    get_buffer_size : Proc(IDxcBlobEncoding*, LibC::UINT_PTR)
    get_encoding : Proc(IDxcBlobEncoding*, LibC::BOOL*, DXC_CP*, HRESULT)
  end

  IDxcBlobEncoding_GUID = "7241d424-2646-4191-97c0-98e96e42fc68"
  IID_IDxcBlobEncoding = LibC::GUID.new(0x7241d424_u32, 0x2646_u16, 0x4191_u16, StaticArray[0x97_u8, 0xc0_u8, 0x98_u8, 0xe9_u8, 0x6e_u8, 0x42_u8, 0xfc_u8, 0x68_u8])
  struct IDxcBlobEncoding
    lpVtbl : IDxcBlobEncodingVTbl*
  end

  struct IDxcBlobUtf16VTbl
    query_interface : Proc(IDxcBlobUtf16*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcBlobUtf16*, UInt32)
    release : Proc(IDxcBlobUtf16*, UInt32)
    get_buffer_pointer : Proc(IDxcBlobUtf16*, Void**)
    get_buffer_size : Proc(IDxcBlobUtf16*, LibC::UINT_PTR)
    get_encoding : Proc(IDxcBlobUtf16*, LibC::BOOL*, DXC_CP*, HRESULT)
    get_string_pointer : Proc(IDxcBlobUtf16*, LibC::LPWSTR)
    get_string_length : Proc(IDxcBlobUtf16*, LibC::UINT_PTR)
  end

  IDxcBlobUtf16_GUID = "a3f84eab-0faa-497e-a39c-ee6ed60b2d84"
  IID_IDxcBlobUtf16 = LibC::GUID.new(0xa3f84eab_u32, 0xfaa_u16, 0x497e_u16, StaticArray[0xa3_u8, 0x9c_u8, 0xee_u8, 0x6e_u8, 0xd6_u8, 0xb_u8, 0x2d_u8, 0x84_u8])
  struct IDxcBlobUtf16
    lpVtbl : IDxcBlobUtf16VTbl*
  end

  struct IDxcBlobUtf8VTbl
    query_interface : Proc(IDxcBlobUtf8*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcBlobUtf8*, UInt32)
    release : Proc(IDxcBlobUtf8*, UInt32)
    get_buffer_pointer : Proc(IDxcBlobUtf8*, Void**)
    get_buffer_size : Proc(IDxcBlobUtf8*, LibC::UINT_PTR)
    get_encoding : Proc(IDxcBlobUtf8*, LibC::BOOL*, DXC_CP*, HRESULT)
    get_string_pointer : Proc(IDxcBlobUtf8*, PSTR)
    get_string_length : Proc(IDxcBlobUtf8*, LibC::UINT_PTR)
  end

  IDxcBlobUtf8_GUID = "3da636c9-ba71-4024-a301-30cbf125305b"
  IID_IDxcBlobUtf8 = LibC::GUID.new(0x3da636c9_u32, 0xba71_u16, 0x4024_u16, StaticArray[0xa3_u8, 0x1_u8, 0x30_u8, 0xcb_u8, 0xf1_u8, 0x25_u8, 0x30_u8, 0x5b_u8])
  struct IDxcBlobUtf8
    lpVtbl : IDxcBlobUtf8VTbl*
  end

  struct IDxcIncludeHandlerVTbl
    query_interface : Proc(IDxcIncludeHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcIncludeHandler*, UInt32)
    release : Proc(IDxcIncludeHandler*, UInt32)
    load_source : Proc(IDxcIncludeHandler*, LibC::LPWSTR, IDxcBlob*, HRESULT)
  end

  IDxcIncludeHandler_GUID = "7f61fc7d-950d-467f-b3e3-3c02fb49187c"
  IID_IDxcIncludeHandler = LibC::GUID.new(0x7f61fc7d_u32, 0x950d_u16, 0x467f_u16, StaticArray[0xb3_u8, 0xe3_u8, 0x3c_u8, 0x2_u8, 0xfb_u8, 0x49_u8, 0x18_u8, 0x7c_u8])
  struct IDxcIncludeHandler
    lpVtbl : IDxcIncludeHandlerVTbl*
  end

  struct IDxcCompilerArgsVTbl
    query_interface : Proc(IDxcCompilerArgs*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcCompilerArgs*, UInt32)
    release : Proc(IDxcCompilerArgs*, UInt32)
    get_arguments : Proc(IDxcCompilerArgs*, LibC::LPWSTR**)
    get_count : Proc(IDxcCompilerArgs*, UInt32)
    add_arguments : Proc(IDxcCompilerArgs*, LibC::LPWSTR*, UInt32, HRESULT)
    add_arguments_utf8 : Proc(IDxcCompilerArgs*, PSTR*, UInt32, HRESULT)
    add_defines : Proc(IDxcCompilerArgs*, DxcDefine*, UInt32, HRESULT)
  end

  IDxcCompilerArgs_GUID = "73effe2a-70dc-45f8-9690-eff64c02429d"
  IID_IDxcCompilerArgs = LibC::GUID.new(0x73effe2a_u32, 0x70dc_u16, 0x45f8_u16, StaticArray[0x96_u8, 0x90_u8, 0xef_u8, 0xf6_u8, 0x4c_u8, 0x2_u8, 0x42_u8, 0x9d_u8])
  struct IDxcCompilerArgs
    lpVtbl : IDxcCompilerArgsVTbl*
  end

  struct IDxcLibraryVTbl
    query_interface : Proc(IDxcLibrary*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcLibrary*, UInt32)
    release : Proc(IDxcLibrary*, UInt32)
    set_malloc : Proc(IDxcLibrary*, IMalloc, HRESULT)
    create_blob_from_blob : Proc(IDxcLibrary*, IDxcBlob, UInt32, UInt32, IDxcBlob*, HRESULT)
    create_blob_from_file : Proc(IDxcLibrary*, LibC::LPWSTR, DXC_CP*, IDxcBlobEncoding*, HRESULT)
    create_blob_with_encoding_from_pinned : Proc(IDxcLibrary*, Void*, UInt32, DXC_CP, IDxcBlobEncoding*, HRESULT)
    create_blob_with_encoding_on_heap_copy : Proc(IDxcLibrary*, Void*, UInt32, DXC_CP, IDxcBlobEncoding*, HRESULT)
    create_blob_with_encoding_on_malloc : Proc(IDxcLibrary*, Void*, IMalloc, UInt32, DXC_CP, IDxcBlobEncoding*, HRESULT)
    create_include_handler : Proc(IDxcLibrary*, IDxcIncludeHandler*, HRESULT)
    create_stream_from_blob_read_only : Proc(IDxcLibrary*, IDxcBlob, IStream*, HRESULT)
    get_blob_as_utf8 : Proc(IDxcLibrary*, IDxcBlob, IDxcBlobEncoding*, HRESULT)
    get_blob_as_utf16 : Proc(IDxcLibrary*, IDxcBlob, IDxcBlobEncoding*, HRESULT)
  end

  IDxcLibrary_GUID = "e5204dc7-d18c-4c3c-bdfb-851673980fe7"
  IID_IDxcLibrary = LibC::GUID.new(0xe5204dc7_u32, 0xd18c_u16, 0x4c3c_u16, StaticArray[0xbd_u8, 0xfb_u8, 0x85_u8, 0x16_u8, 0x73_u8, 0x98_u8, 0xf_u8, 0xe7_u8])
  struct IDxcLibrary
    lpVtbl : IDxcLibraryVTbl*
  end

  struct IDxcOperationResultVTbl
    query_interface : Proc(IDxcOperationResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcOperationResult*, UInt32)
    release : Proc(IDxcOperationResult*, UInt32)
    get_status : Proc(IDxcOperationResult*, HRESULT*, HRESULT)
    get_result : Proc(IDxcOperationResult*, IDxcBlob*, HRESULT)
    get_error_buffer : Proc(IDxcOperationResult*, IDxcBlobEncoding*, HRESULT)
  end

  IDxcOperationResult_GUID = "cedb484a-d4e9-445a-b991-ca21ca157dc2"
  IID_IDxcOperationResult = LibC::GUID.new(0xcedb484a_u32, 0xd4e9_u16, 0x445a_u16, StaticArray[0xb9_u8, 0x91_u8, 0xca_u8, 0x21_u8, 0xca_u8, 0x15_u8, 0x7d_u8, 0xc2_u8])
  struct IDxcOperationResult
    lpVtbl : IDxcOperationResultVTbl*
  end

  struct IDxcCompilerVTbl
    query_interface : Proc(IDxcCompiler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcCompiler*, UInt32)
    release : Proc(IDxcCompiler*, UInt32)
    compile : Proc(IDxcCompiler*, IDxcBlob, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR*, UInt32, DxcDefine*, UInt32, IDxcIncludeHandler, IDxcOperationResult*, HRESULT)
    preprocess : Proc(IDxcCompiler*, IDxcBlob, LibC::LPWSTR, LibC::LPWSTR*, UInt32, DxcDefine*, UInt32, IDxcIncludeHandler, IDxcOperationResult*, HRESULT)
    disassemble : Proc(IDxcCompiler*, IDxcBlob, IDxcBlobEncoding*, HRESULT)
  end

  IDxcCompiler_GUID = "8c210bf3-011f-4422-8d70-6f9acb8db617"
  IID_IDxcCompiler = LibC::GUID.new(0x8c210bf3_u32, 0x11f_u16, 0x4422_u16, StaticArray[0x8d_u8, 0x70_u8, 0x6f_u8, 0x9a_u8, 0xcb_u8, 0x8d_u8, 0xb6_u8, 0x17_u8])
  struct IDxcCompiler
    lpVtbl : IDxcCompilerVTbl*
  end

  struct IDxcCompiler2VTbl
    query_interface : Proc(IDxcCompiler2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcCompiler2*, UInt32)
    release : Proc(IDxcCompiler2*, UInt32)
    compile : Proc(IDxcCompiler2*, IDxcBlob, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR*, UInt32, DxcDefine*, UInt32, IDxcIncludeHandler, IDxcOperationResult*, HRESULT)
    preprocess : Proc(IDxcCompiler2*, IDxcBlob, LibC::LPWSTR, LibC::LPWSTR*, UInt32, DxcDefine*, UInt32, IDxcIncludeHandler, IDxcOperationResult*, HRESULT)
    disassemble : Proc(IDxcCompiler2*, IDxcBlob, IDxcBlobEncoding*, HRESULT)
    compile_with_debug : Proc(IDxcCompiler2*, IDxcBlob, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR*, UInt32, DxcDefine*, UInt32, IDxcIncludeHandler, IDxcOperationResult*, LibC::LPWSTR*, IDxcBlob*, HRESULT)
  end

  IDxcCompiler2_GUID = "a005a9d9-b8bb-4594-b5c9-0e633bec4d37"
  IID_IDxcCompiler2 = LibC::GUID.new(0xa005a9d9_u32, 0xb8bb_u16, 0x4594_u16, StaticArray[0xb5_u8, 0xc9_u8, 0xe_u8, 0x63_u8, 0x3b_u8, 0xec_u8, 0x4d_u8, 0x37_u8])
  struct IDxcCompiler2
    lpVtbl : IDxcCompiler2VTbl*
  end

  struct IDxcLinkerVTbl
    query_interface : Proc(IDxcLinker*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcLinker*, UInt32)
    release : Proc(IDxcLinker*, UInt32)
    register_library : Proc(IDxcLinker*, LibC::LPWSTR, IDxcBlob, HRESULT)
    link : Proc(IDxcLinker*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR*, UInt32, LibC::LPWSTR*, UInt32, IDxcOperationResult*, HRESULT)
  end

  IDxcLinker_GUID = "f1b5be2a-62dd-4327-a1c2-42ac1e1e78e6"
  IID_IDxcLinker = LibC::GUID.new(0xf1b5be2a_u32, 0x62dd_u16, 0x4327_u16, StaticArray[0xa1_u8, 0xc2_u8, 0x42_u8, 0xac_u8, 0x1e_u8, 0x1e_u8, 0x78_u8, 0xe6_u8])
  struct IDxcLinker
    lpVtbl : IDxcLinkerVTbl*
  end

  struct IDxcUtilsVTbl
    query_interface : Proc(IDxcUtils*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcUtils*, UInt32)
    release : Proc(IDxcUtils*, UInt32)
    create_blob_from_blob : Proc(IDxcUtils*, IDxcBlob, UInt32, UInt32, IDxcBlob*, HRESULT)
    create_blob_from_pinned : Proc(IDxcUtils*, Void*, UInt32, DXC_CP, IDxcBlobEncoding*, HRESULT)
    move_to_blob : Proc(IDxcUtils*, Void*, IMalloc, UInt32, DXC_CP, IDxcBlobEncoding*, HRESULT)
    create_blob : Proc(IDxcUtils*, Void*, UInt32, DXC_CP, IDxcBlobEncoding*, HRESULT)
    load_file : Proc(IDxcUtils*, LibC::LPWSTR, DXC_CP*, IDxcBlobEncoding*, HRESULT)
    create_read_only_stream_from_blob : Proc(IDxcUtils*, IDxcBlob, IStream*, HRESULT)
    create_default_include_handler : Proc(IDxcUtils*, IDxcIncludeHandler*, HRESULT)
    get_blob_as_utf8 : Proc(IDxcUtils*, IDxcBlob, IDxcBlobUtf8*, HRESULT)
    get_blob_as_utf16 : Proc(IDxcUtils*, IDxcBlob, IDxcBlobUtf16*, HRESULT)
    get_dxil_container_part : Proc(IDxcUtils*, DxcBuffer*, UInt32, Void**, UInt32*, HRESULT)
    create_reflection : Proc(IDxcUtils*, DxcBuffer*, Guid*, Void**, HRESULT)
    build_arguments : Proc(IDxcUtils*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR*, UInt32, DxcDefine*, UInt32, IDxcCompilerArgs*, HRESULT)
    get_pdb_contents : Proc(IDxcUtils*, IDxcBlob, IDxcBlob*, IDxcBlob*, HRESULT)
  end

  IDxcUtils_GUID = "4605c4cb-2019-492a-ada4-65f20bb7d67f"
  IID_IDxcUtils = LibC::GUID.new(0x4605c4cb_u32, 0x2019_u16, 0x492a_u16, StaticArray[0xad_u8, 0xa4_u8, 0x65_u8, 0xf2_u8, 0xb_u8, 0xb7_u8, 0xd6_u8, 0x7f_u8])
  struct IDxcUtils
    lpVtbl : IDxcUtilsVTbl*
  end

  struct IDxcResultVTbl
    query_interface : Proc(IDxcResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcResult*, UInt32)
    release : Proc(IDxcResult*, UInt32)
    get_status : Proc(IDxcResult*, HRESULT*, HRESULT)
    get_result : Proc(IDxcResult*, IDxcBlob*, HRESULT)
    get_error_buffer : Proc(IDxcResult*, IDxcBlobEncoding*, HRESULT)
    has_output : Proc(IDxcResult*, DXC_OUT_KIND, LibC::BOOL)
    get_output : Proc(IDxcResult*, DXC_OUT_KIND, Guid*, Void**, IDxcBlobUtf16*, HRESULT)
    get_num_outputs : Proc(IDxcResult*, UInt32)
    get_output_by_index : Proc(IDxcResult*, UInt32, DXC_OUT_KIND)
    primary_output : Proc(IDxcResult*, DXC_OUT_KIND)
  end

  IDxcResult_GUID = "58346cda-dde7-4497-9461-6f87af5e0659"
  IID_IDxcResult = LibC::GUID.new(0x58346cda_u32, 0xdde7_u16, 0x4497_u16, StaticArray[0x94_u8, 0x61_u8, 0x6f_u8, 0x87_u8, 0xaf_u8, 0x5e_u8, 0x6_u8, 0x59_u8])
  struct IDxcResult
    lpVtbl : IDxcResultVTbl*
  end

  struct IDxcExtraOutputsVTbl
    query_interface : Proc(IDxcExtraOutputs*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcExtraOutputs*, UInt32)
    release : Proc(IDxcExtraOutputs*, UInt32)
    get_output_count : Proc(IDxcExtraOutputs*, UInt32)
    get_output : Proc(IDxcExtraOutputs*, UInt32, Guid*, Void**, IDxcBlobUtf16*, IDxcBlobUtf16*, HRESULT)
  end

  IDxcExtraOutputs_GUID = "319b37a2-a5c2-494a-a5de-4801b2faf989"
  IID_IDxcExtraOutputs = LibC::GUID.new(0x319b37a2_u32, 0xa5c2_u16, 0x494a_u16, StaticArray[0xa5_u8, 0xde_u8, 0x48_u8, 0x1_u8, 0xb2_u8, 0xfa_u8, 0xf9_u8, 0x89_u8])
  struct IDxcExtraOutputs
    lpVtbl : IDxcExtraOutputsVTbl*
  end

  struct IDxcCompiler3VTbl
    query_interface : Proc(IDxcCompiler3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcCompiler3*, UInt32)
    release : Proc(IDxcCompiler3*, UInt32)
    compile : Proc(IDxcCompiler3*, DxcBuffer*, LibC::LPWSTR*, UInt32, IDxcIncludeHandler, Guid*, Void**, HRESULT)
    disassemble : Proc(IDxcCompiler3*, DxcBuffer*, Guid*, Void**, HRESULT)
  end

  IDxcCompiler3_GUID = "228b4687-5a6a-4730-900c-9702b2203f54"
  IID_IDxcCompiler3 = LibC::GUID.new(0x228b4687_u32, 0x5a6a_u16, 0x4730_u16, StaticArray[0x90_u8, 0xc_u8, 0x97_u8, 0x2_u8, 0xb2_u8, 0x20_u8, 0x3f_u8, 0x54_u8])
  struct IDxcCompiler3
    lpVtbl : IDxcCompiler3VTbl*
  end

  struct IDxcValidatorVTbl
    query_interface : Proc(IDxcValidator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcValidator*, UInt32)
    release : Proc(IDxcValidator*, UInt32)
    validate : Proc(IDxcValidator*, IDxcBlob, UInt32, IDxcOperationResult*, HRESULT)
  end

  IDxcValidator_GUID = "a6e82bd2-1fd7-4826-9811-2857e797f49a"
  IID_IDxcValidator = LibC::GUID.new(0xa6e82bd2_u32, 0x1fd7_u16, 0x4826_u16, StaticArray[0x98_u8, 0x11_u8, 0x28_u8, 0x57_u8, 0xe7_u8, 0x97_u8, 0xf4_u8, 0x9a_u8])
  struct IDxcValidator
    lpVtbl : IDxcValidatorVTbl*
  end

  struct IDxcValidator2VTbl
    query_interface : Proc(IDxcValidator2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcValidator2*, UInt32)
    release : Proc(IDxcValidator2*, UInt32)
    validate : Proc(IDxcValidator2*, IDxcBlob, UInt32, IDxcOperationResult*, HRESULT)
    validate_with_debug : Proc(IDxcValidator2*, IDxcBlob, UInt32, DxcBuffer*, IDxcOperationResult*, HRESULT)
  end

  IDxcValidator2_GUID = "458e1fd1-b1b2-4750-a6e1-9c10f03bed92"
  IID_IDxcValidator2 = LibC::GUID.new(0x458e1fd1_u32, 0xb1b2_u16, 0x4750_u16, StaticArray[0xa6_u8, 0xe1_u8, 0x9c_u8, 0x10_u8, 0xf0_u8, 0x3b_u8, 0xed_u8, 0x92_u8])
  struct IDxcValidator2
    lpVtbl : IDxcValidator2VTbl*
  end

  struct IDxcContainerBuilderVTbl
    query_interface : Proc(IDxcContainerBuilder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcContainerBuilder*, UInt32)
    release : Proc(IDxcContainerBuilder*, UInt32)
    load : Proc(IDxcContainerBuilder*, IDxcBlob, HRESULT)
    add_part : Proc(IDxcContainerBuilder*, UInt32, IDxcBlob, HRESULT)
    remove_part : Proc(IDxcContainerBuilder*, UInt32, HRESULT)
    serialize_container : Proc(IDxcContainerBuilder*, IDxcOperationResult*, HRESULT)
  end

  IDxcContainerBuilder_GUID = "334b1f50-2292-4b35-99a1-25588d8c17fe"
  IID_IDxcContainerBuilder = LibC::GUID.new(0x334b1f50_u32, 0x2292_u16, 0x4b35_u16, StaticArray[0x99_u8, 0xa1_u8, 0x25_u8, 0x58_u8, 0x8d_u8, 0x8c_u8, 0x17_u8, 0xfe_u8])
  struct IDxcContainerBuilder
    lpVtbl : IDxcContainerBuilderVTbl*
  end

  struct IDxcAssemblerVTbl
    query_interface : Proc(IDxcAssembler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcAssembler*, UInt32)
    release : Proc(IDxcAssembler*, UInt32)
    assemble_to_container : Proc(IDxcAssembler*, IDxcBlob, IDxcOperationResult*, HRESULT)
  end

  IDxcAssembler_GUID = "091f7a26-1c1f-4948-904b-e6e3a8a771d5"
  IID_IDxcAssembler = LibC::GUID.new(0x91f7a26_u32, 0x1c1f_u16, 0x4948_u16, StaticArray[0x90_u8, 0x4b_u8, 0xe6_u8, 0xe3_u8, 0xa8_u8, 0xa7_u8, 0x71_u8, 0xd5_u8])
  struct IDxcAssembler
    lpVtbl : IDxcAssemblerVTbl*
  end

  struct IDxcContainerReflectionVTbl
    query_interface : Proc(IDxcContainerReflection*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcContainerReflection*, UInt32)
    release : Proc(IDxcContainerReflection*, UInt32)
    load : Proc(IDxcContainerReflection*, IDxcBlob, HRESULT)
    get_part_count : Proc(IDxcContainerReflection*, UInt32*, HRESULT)
    get_part_kind : Proc(IDxcContainerReflection*, UInt32, UInt32*, HRESULT)
    get_part_content : Proc(IDxcContainerReflection*, UInt32, IDxcBlob*, HRESULT)
    find_first_part_kind : Proc(IDxcContainerReflection*, UInt32, UInt32*, HRESULT)
    get_part_reflection : Proc(IDxcContainerReflection*, UInt32, Guid*, Void**, HRESULT)
  end

  IDxcContainerReflection_GUID = "d2c21b26-8350-4bdc-976a-331ce6f4c54c"
  IID_IDxcContainerReflection = LibC::GUID.new(0xd2c21b26_u32, 0x8350_u16, 0x4bdc_u16, StaticArray[0x97_u8, 0x6a_u8, 0x33_u8, 0x1c_u8, 0xe6_u8, 0xf4_u8, 0xc5_u8, 0x4c_u8])
  struct IDxcContainerReflection
    lpVtbl : IDxcContainerReflectionVTbl*
  end

  struct IDxcOptimizerPassVTbl
    query_interface : Proc(IDxcOptimizerPass*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcOptimizerPass*, UInt32)
    release : Proc(IDxcOptimizerPass*, UInt32)
    get_option_name : Proc(IDxcOptimizerPass*, LibC::LPWSTR*, HRESULT)
    get_description : Proc(IDxcOptimizerPass*, LibC::LPWSTR*, HRESULT)
    get_option_arg_count : Proc(IDxcOptimizerPass*, UInt32*, HRESULT)
    get_option_arg_name : Proc(IDxcOptimizerPass*, UInt32, LibC::LPWSTR*, HRESULT)
    get_option_arg_description : Proc(IDxcOptimizerPass*, UInt32, LibC::LPWSTR*, HRESULT)
  end

  IDxcOptimizerPass_GUID = "ae2cd79f-cc22-453f-9b6b-b124e7a5204c"
  IID_IDxcOptimizerPass = LibC::GUID.new(0xae2cd79f_u32, 0xcc22_u16, 0x453f_u16, StaticArray[0x9b_u8, 0x6b_u8, 0xb1_u8, 0x24_u8, 0xe7_u8, 0xa5_u8, 0x20_u8, 0x4c_u8])
  struct IDxcOptimizerPass
    lpVtbl : IDxcOptimizerPassVTbl*
  end

  struct IDxcOptimizerVTbl
    query_interface : Proc(IDxcOptimizer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcOptimizer*, UInt32)
    release : Proc(IDxcOptimizer*, UInt32)
    get_available_pass_count : Proc(IDxcOptimizer*, UInt32*, HRESULT)
    get_available_pass : Proc(IDxcOptimizer*, UInt32, IDxcOptimizerPass*, HRESULT)
    run_optimizer : Proc(IDxcOptimizer*, IDxcBlob, LibC::LPWSTR*, UInt32, IDxcBlob*, IDxcBlobEncoding*, HRESULT)
  end

  IDxcOptimizer_GUID = "25740e2e-9cba-401b-9119-4fb42f39f270"
  IID_IDxcOptimizer = LibC::GUID.new(0x25740e2e_u32, 0x9cba_u16, 0x401b_u16, StaticArray[0x91_u8, 0x19_u8, 0x4f_u8, 0xb4_u8, 0x2f_u8, 0x39_u8, 0xf2_u8, 0x70_u8])
  struct IDxcOptimizer
    lpVtbl : IDxcOptimizerVTbl*
  end

  struct IDxcVersionInfoVTbl
    query_interface : Proc(IDxcVersionInfo*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcVersionInfo*, UInt32)
    release : Proc(IDxcVersionInfo*, UInt32)
    get_version : Proc(IDxcVersionInfo*, UInt32*, UInt32*, HRESULT)
    get_flags : Proc(IDxcVersionInfo*, UInt32*, HRESULT)
  end

  IDxcVersionInfo_GUID = "b04f5b50-2059-4f12-a8ff-a1e0cde1cc7e"
  IID_IDxcVersionInfo = LibC::GUID.new(0xb04f5b50_u32, 0x2059_u16, 0x4f12_u16, StaticArray[0xa8_u8, 0xff_u8, 0xa1_u8, 0xe0_u8, 0xcd_u8, 0xe1_u8, 0xcc_u8, 0x7e_u8])
  struct IDxcVersionInfo
    lpVtbl : IDxcVersionInfoVTbl*
  end

  struct IDxcVersionInfo2VTbl
    query_interface : Proc(IDxcVersionInfo2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcVersionInfo2*, UInt32)
    release : Proc(IDxcVersionInfo2*, UInt32)
    get_version : Proc(IDxcVersionInfo2*, UInt32*, UInt32*, HRESULT)
    get_flags : Proc(IDxcVersionInfo2*, UInt32*, HRESULT)
    get_commit_info : Proc(IDxcVersionInfo2*, UInt32*, Int8**, HRESULT)
  end

  IDxcVersionInfo2_GUID = "fb6904c4-42f0-4b62-9c46-983af7da7c83"
  IID_IDxcVersionInfo2 = LibC::GUID.new(0xfb6904c4_u32, 0x42f0_u16, 0x4b62_u16, StaticArray[0x9c_u8, 0x46_u8, 0x98_u8, 0x3a_u8, 0xf7_u8, 0xda_u8, 0x7c_u8, 0x83_u8])
  struct IDxcVersionInfo2
    lpVtbl : IDxcVersionInfo2VTbl*
  end

  struct IDxcVersionInfo3VTbl
    query_interface : Proc(IDxcVersionInfo3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcVersionInfo3*, UInt32)
    release : Proc(IDxcVersionInfo3*, UInt32)
    get_custom_version_string : Proc(IDxcVersionInfo3*, Int8**, HRESULT)
  end

  IDxcVersionInfo3_GUID = "5e13e843-9d25-473c-9ad2-03b2d0b44b1e"
  IID_IDxcVersionInfo3 = LibC::GUID.new(0x5e13e843_u32, 0x9d25_u16, 0x473c_u16, StaticArray[0x9a_u8, 0xd2_u8, 0x3_u8, 0xb2_u8, 0xd0_u8, 0xb4_u8, 0x4b_u8, 0x1e_u8])
  struct IDxcVersionInfo3
    lpVtbl : IDxcVersionInfo3VTbl*
  end

  struct IDxcPdbUtilsVTbl
    query_interface : Proc(IDxcPdbUtils*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcPdbUtils*, UInt32)
    release : Proc(IDxcPdbUtils*, UInt32)
    load : Proc(IDxcPdbUtils*, IDxcBlob, HRESULT)
    get_source_count : Proc(IDxcPdbUtils*, UInt32*, HRESULT)
    get_source : Proc(IDxcPdbUtils*, UInt32, IDxcBlobEncoding*, HRESULT)
    get_source_name : Proc(IDxcPdbUtils*, UInt32, UInt8**, HRESULT)
    get_flag_count : Proc(IDxcPdbUtils*, UInt32*, HRESULT)
    get_flag : Proc(IDxcPdbUtils*, UInt32, UInt8**, HRESULT)
    get_arg_count : Proc(IDxcPdbUtils*, UInt32*, HRESULT)
    get_arg : Proc(IDxcPdbUtils*, UInt32, UInt8**, HRESULT)
    get_arg_pair_count : Proc(IDxcPdbUtils*, UInt32*, HRESULT)
    get_arg_pair : Proc(IDxcPdbUtils*, UInt32, UInt8**, UInt8**, HRESULT)
    get_define_count : Proc(IDxcPdbUtils*, UInt32*, HRESULT)
    get_define : Proc(IDxcPdbUtils*, UInt32, UInt8**, HRESULT)
    get_target_profile : Proc(IDxcPdbUtils*, UInt8**, HRESULT)
    get_entry_point : Proc(IDxcPdbUtils*, UInt8**, HRESULT)
    get_main_file_name : Proc(IDxcPdbUtils*, UInt8**, HRESULT)
    get_hash : Proc(IDxcPdbUtils*, IDxcBlob*, HRESULT)
    get_name : Proc(IDxcPdbUtils*, UInt8**, HRESULT)
    is_full_pdb : Proc(IDxcPdbUtils*, LibC::BOOL)
    get_full_pdb : Proc(IDxcPdbUtils*, IDxcBlob*, HRESULT)
    get_version_info : Proc(IDxcPdbUtils*, IDxcVersionInfo*, HRESULT)
    set_compiler : Proc(IDxcPdbUtils*, IDxcCompiler3, HRESULT)
    compile_for_full_pdb : Proc(IDxcPdbUtils*, IDxcResult*, HRESULT)
    override_args : Proc(IDxcPdbUtils*, DxcArgPair*, UInt32, HRESULT)
    override_root_signature : Proc(IDxcPdbUtils*, LibC::LPWSTR, HRESULT)
  end

  IDxcPdbUtils_GUID = "e6c9647e-9d6a-4c3b-b94c-524b5a6c343d"
  IID_IDxcPdbUtils = LibC::GUID.new(0xe6c9647e_u32, 0x9d6a_u16, 0x4c3b_u16, StaticArray[0xb9_u8, 0x4c_u8, 0x52_u8, 0x4b_u8, 0x5a_u8, 0x6c_u8, 0x34_u8, 0x3d_u8])
  struct IDxcPdbUtils
    lpVtbl : IDxcPdbUtilsVTbl*
  end


  # Params # rclsid : Guid* [In],riid : Guid* [In],ppv : Void** [In]
  fun DxcCreateInstance(rclsid : Guid*, riid : Guid*, ppv : Void**) : HRESULT

  # Params # pmalloc : IMalloc [In],rclsid : Guid* [In],riid : Guid* [In],ppv : Void** [In]
  fun DxcCreateInstance2(pmalloc : IMalloc, rclsid : Guid*, riid : Guid*, ppv : Void**) : HRESULT
end
struct LibWin32::IDxcBlob
  def query_interface(this : IDxcBlob*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcBlob*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcBlob*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_buffer_pointer(this : IDxcBlob*) : Void*
    @lpVtbl.value.get_buffer_pointer.call(this)
  end
  def get_buffer_size(this : IDxcBlob*) : LibC::UINT_PTR
    @lpVtbl.value.get_buffer_size.call(this)
  end
end
struct LibWin32::IDxcBlobEncoding
  def query_interface(this : IDxcBlobEncoding*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcBlobEncoding*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcBlobEncoding*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_buffer_pointer(this : IDxcBlobEncoding*) : Void*
    @lpVtbl.value.get_buffer_pointer.call(this)
  end
  def get_buffer_size(this : IDxcBlobEncoding*) : LibC::UINT_PTR
    @lpVtbl.value.get_buffer_size.call(this)
  end
  def get_encoding(this : IDxcBlobEncoding*, pknown : LibC::BOOL*, pcodepage : DXC_CP*) : HRESULT
    @lpVtbl.value.get_encoding.call(this, pknown, pcodepage)
  end
end
struct LibWin32::IDxcBlobUtf16
  def query_interface(this : IDxcBlobUtf16*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcBlobUtf16*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcBlobUtf16*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_buffer_pointer(this : IDxcBlobUtf16*) : Void*
    @lpVtbl.value.get_buffer_pointer.call(this)
  end
  def get_buffer_size(this : IDxcBlobUtf16*) : LibC::UINT_PTR
    @lpVtbl.value.get_buffer_size.call(this)
  end
  def get_encoding(this : IDxcBlobUtf16*, pknown : LibC::BOOL*, pcodepage : DXC_CP*) : HRESULT
    @lpVtbl.value.get_encoding.call(this, pknown, pcodepage)
  end
  def get_string_pointer(this : IDxcBlobUtf16*) : LibC::LPWSTR
    @lpVtbl.value.get_string_pointer.call(this)
  end
  def get_string_length(this : IDxcBlobUtf16*) : LibC::UINT_PTR
    @lpVtbl.value.get_string_length.call(this)
  end
end
struct LibWin32::IDxcBlobUtf8
  def query_interface(this : IDxcBlobUtf8*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcBlobUtf8*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcBlobUtf8*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_buffer_pointer(this : IDxcBlobUtf8*) : Void*
    @lpVtbl.value.get_buffer_pointer.call(this)
  end
  def get_buffer_size(this : IDxcBlobUtf8*) : LibC::UINT_PTR
    @lpVtbl.value.get_buffer_size.call(this)
  end
  def get_encoding(this : IDxcBlobUtf8*, pknown : LibC::BOOL*, pcodepage : DXC_CP*) : HRESULT
    @lpVtbl.value.get_encoding.call(this, pknown, pcodepage)
  end
  def get_string_pointer(this : IDxcBlobUtf8*) : PSTR
    @lpVtbl.value.get_string_pointer.call(this)
  end
  def get_string_length(this : IDxcBlobUtf8*) : LibC::UINT_PTR
    @lpVtbl.value.get_string_length.call(this)
  end
end
struct LibWin32::IDxcIncludeHandler
  def query_interface(this : IDxcIncludeHandler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcIncludeHandler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcIncludeHandler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def load_source(this : IDxcIncludeHandler*, pfilename : LibC::LPWSTR, ppincludesource : IDxcBlob*) : HRESULT
    @lpVtbl.value.load_source.call(this, pfilename, ppincludesource)
  end
end
struct LibWin32::IDxcCompilerArgs
  def query_interface(this : IDxcCompilerArgs*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcCompilerArgs*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcCompilerArgs*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_arguments(this : IDxcCompilerArgs*) : LibC::LPWSTR*
    @lpVtbl.value.get_arguments.call(this)
  end
  def get_count(this : IDxcCompilerArgs*) : UInt32
    @lpVtbl.value.get_count.call(this)
  end
  def add_arguments(this : IDxcCompilerArgs*, parguments : LibC::LPWSTR*, argcount : UInt32) : HRESULT
    @lpVtbl.value.add_arguments.call(this, parguments, argcount)
  end
  def add_arguments_utf8(this : IDxcCompilerArgs*, parguments : PSTR*, argcount : UInt32) : HRESULT
    @lpVtbl.value.add_arguments_utf8.call(this, parguments, argcount)
  end
  def add_defines(this : IDxcCompilerArgs*, pdefines : DxcDefine*, definecount : UInt32) : HRESULT
    @lpVtbl.value.add_defines.call(this, pdefines, definecount)
  end
end
struct LibWin32::IDxcLibrary
  def query_interface(this : IDxcLibrary*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcLibrary*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcLibrary*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_malloc(this : IDxcLibrary*, pmalloc : IMalloc) : HRESULT
    @lpVtbl.value.set_malloc.call(this, pmalloc)
  end
  def create_blob_from_blob(this : IDxcLibrary*, pblob : IDxcBlob, offset : UInt32, length : UInt32, ppresult : IDxcBlob*) : HRESULT
    @lpVtbl.value.create_blob_from_blob.call(this, pblob, offset, length, ppresult)
  end
  def create_blob_from_file(this : IDxcLibrary*, pfilename : LibC::LPWSTR, codepage : DXC_CP*, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.create_blob_from_file.call(this, pfilename, codepage, pblobencoding)
  end
  def create_blob_with_encoding_from_pinned(this : IDxcLibrary*, ptext : Void*, size : UInt32, codepage : DXC_CP, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.create_blob_with_encoding_from_pinned.call(this, ptext, size, codepage, pblobencoding)
  end
  def create_blob_with_encoding_on_heap_copy(this : IDxcLibrary*, ptext : Void*, size : UInt32, codepage : DXC_CP, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.create_blob_with_encoding_on_heap_copy.call(this, ptext, size, codepage, pblobencoding)
  end
  def create_blob_with_encoding_on_malloc(this : IDxcLibrary*, ptext : Void*, pimalloc : IMalloc, size : UInt32, codepage : DXC_CP, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.create_blob_with_encoding_on_malloc.call(this, ptext, pimalloc, size, codepage, pblobencoding)
  end
  def create_include_handler(this : IDxcLibrary*, ppresult : IDxcIncludeHandler*) : HRESULT
    @lpVtbl.value.create_include_handler.call(this, ppresult)
  end
  def create_stream_from_blob_read_only(this : IDxcLibrary*, pblob : IDxcBlob, ppstream : IStream*) : HRESULT
    @lpVtbl.value.create_stream_from_blob_read_only.call(this, pblob, ppstream)
  end
  def get_blob_as_utf8(this : IDxcLibrary*, pblob : IDxcBlob, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.get_blob_as_utf8.call(this, pblob, pblobencoding)
  end
  def get_blob_as_utf16(this : IDxcLibrary*, pblob : IDxcBlob, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.get_blob_as_utf16.call(this, pblob, pblobencoding)
  end
end
struct LibWin32::IDxcOperationResult
  def query_interface(this : IDxcOperationResult*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcOperationResult*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcOperationResult*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_status(this : IDxcOperationResult*, pstatus : HRESULT*) : HRESULT
    @lpVtbl.value.get_status.call(this, pstatus)
  end
  def get_result(this : IDxcOperationResult*, ppresult : IDxcBlob*) : HRESULT
    @lpVtbl.value.get_result.call(this, ppresult)
  end
  def get_error_buffer(this : IDxcOperationResult*, pperrors : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.get_error_buffer.call(this, pperrors)
  end
end
struct LibWin32::IDxcCompiler
  def query_interface(this : IDxcCompiler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcCompiler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcCompiler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def compile(this : IDxcCompiler*, psource : IDxcBlob, psourcename : LibC::LPWSTR, pentrypoint : LibC::LPWSTR, ptargetprofile : LibC::LPWSTR, parguments : LibC::LPWSTR*, argcount : UInt32, pdefines : DxcDefine*, definecount : UInt32, pincludehandler : IDxcIncludeHandler, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.compile.call(this, psource, psourcename, pentrypoint, ptargetprofile, parguments, argcount, pdefines, definecount, pincludehandler, ppresult)
  end
  def preprocess(this : IDxcCompiler*, psource : IDxcBlob, psourcename : LibC::LPWSTR, parguments : LibC::LPWSTR*, argcount : UInt32, pdefines : DxcDefine*, definecount : UInt32, pincludehandler : IDxcIncludeHandler, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.preprocess.call(this, psource, psourcename, parguments, argcount, pdefines, definecount, pincludehandler, ppresult)
  end
  def disassemble(this : IDxcCompiler*, psource : IDxcBlob, ppdisassembly : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.disassemble.call(this, psource, ppdisassembly)
  end
end
struct LibWin32::IDxcCompiler2
  def query_interface(this : IDxcCompiler2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcCompiler2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcCompiler2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def compile(this : IDxcCompiler2*, psource : IDxcBlob, psourcename : LibC::LPWSTR, pentrypoint : LibC::LPWSTR, ptargetprofile : LibC::LPWSTR, parguments : LibC::LPWSTR*, argcount : UInt32, pdefines : DxcDefine*, definecount : UInt32, pincludehandler : IDxcIncludeHandler, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.compile.call(this, psource, psourcename, pentrypoint, ptargetprofile, parguments, argcount, pdefines, definecount, pincludehandler, ppresult)
  end
  def preprocess(this : IDxcCompiler2*, psource : IDxcBlob, psourcename : LibC::LPWSTR, parguments : LibC::LPWSTR*, argcount : UInt32, pdefines : DxcDefine*, definecount : UInt32, pincludehandler : IDxcIncludeHandler, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.preprocess.call(this, psource, psourcename, parguments, argcount, pdefines, definecount, pincludehandler, ppresult)
  end
  def disassemble(this : IDxcCompiler2*, psource : IDxcBlob, ppdisassembly : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.disassemble.call(this, psource, ppdisassembly)
  end
  def compile_with_debug(this : IDxcCompiler2*, psource : IDxcBlob, psourcename : LibC::LPWSTR, pentrypoint : LibC::LPWSTR, ptargetprofile : LibC::LPWSTR, parguments : LibC::LPWSTR*, argcount : UInt32, pdefines : DxcDefine*, definecount : UInt32, pincludehandler : IDxcIncludeHandler, ppresult : IDxcOperationResult*, ppdebugblobname : LibC::LPWSTR*, ppdebugblob : IDxcBlob*) : HRESULT
    @lpVtbl.value.compile_with_debug.call(this, psource, psourcename, pentrypoint, ptargetprofile, parguments, argcount, pdefines, definecount, pincludehandler, ppresult, ppdebugblobname, ppdebugblob)
  end
end
struct LibWin32::IDxcLinker
  def query_interface(this : IDxcLinker*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcLinker*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcLinker*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_library(this : IDxcLinker*, plibname : LibC::LPWSTR, plib : IDxcBlob) : HRESULT
    @lpVtbl.value.register_library.call(this, plibname, plib)
  end
  def link(this : IDxcLinker*, pentryname : LibC::LPWSTR, ptargetprofile : LibC::LPWSTR, plibnames : LibC::LPWSTR*, libcount : UInt32, parguments : LibC::LPWSTR*, argcount : UInt32, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.link.call(this, pentryname, ptargetprofile, plibnames, libcount, parguments, argcount, ppresult)
  end
end
struct LibWin32::IDxcUtils
  def query_interface(this : IDxcUtils*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcUtils*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcUtils*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_blob_from_blob(this : IDxcUtils*, pblob : IDxcBlob, offset : UInt32, length : UInt32, ppresult : IDxcBlob*) : HRESULT
    @lpVtbl.value.create_blob_from_blob.call(this, pblob, offset, length, ppresult)
  end
  def create_blob_from_pinned(this : IDxcUtils*, pdata : Void*, size : UInt32, codepage : DXC_CP, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.create_blob_from_pinned.call(this, pdata, size, codepage, pblobencoding)
  end
  def move_to_blob(this : IDxcUtils*, pdata : Void*, pimalloc : IMalloc, size : UInt32, codepage : DXC_CP, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.move_to_blob.call(this, pdata, pimalloc, size, codepage, pblobencoding)
  end
  def create_blob(this : IDxcUtils*, pdata : Void*, size : UInt32, codepage : DXC_CP, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.create_blob.call(this, pdata, size, codepage, pblobencoding)
  end
  def load_file(this : IDxcUtils*, pfilename : LibC::LPWSTR, pcodepage : DXC_CP*, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.load_file.call(this, pfilename, pcodepage, pblobencoding)
  end
  def create_read_only_stream_from_blob(this : IDxcUtils*, pblob : IDxcBlob, ppstream : IStream*) : HRESULT
    @lpVtbl.value.create_read_only_stream_from_blob.call(this, pblob, ppstream)
  end
  def create_default_include_handler(this : IDxcUtils*, ppresult : IDxcIncludeHandler*) : HRESULT
    @lpVtbl.value.create_default_include_handler.call(this, ppresult)
  end
  def get_blob_as_utf8(this : IDxcUtils*, pblob : IDxcBlob, pblobencoding : IDxcBlobUtf8*) : HRESULT
    @lpVtbl.value.get_blob_as_utf8.call(this, pblob, pblobencoding)
  end
  def get_blob_as_utf16(this : IDxcUtils*, pblob : IDxcBlob, pblobencoding : IDxcBlobUtf16*) : HRESULT
    @lpVtbl.value.get_blob_as_utf16.call(this, pblob, pblobencoding)
  end
  def get_dxil_container_part(this : IDxcUtils*, pshader : DxcBuffer*, dxcpart : UInt32, pppartdata : Void**, ppartsizeinbytes : UInt32*) : HRESULT
    @lpVtbl.value.get_dxil_container_part.call(this, pshader, dxcpart, pppartdata, ppartsizeinbytes)
  end
  def create_reflection(this : IDxcUtils*, pdata : DxcBuffer*, iid : Guid*, ppvreflection : Void**) : HRESULT
    @lpVtbl.value.create_reflection.call(this, pdata, iid, ppvreflection)
  end
  def build_arguments(this : IDxcUtils*, psourcename : LibC::LPWSTR, pentrypoint : LibC::LPWSTR, ptargetprofile : LibC::LPWSTR, parguments : LibC::LPWSTR*, argcount : UInt32, pdefines : DxcDefine*, definecount : UInt32, ppargs : IDxcCompilerArgs*) : HRESULT
    @lpVtbl.value.build_arguments.call(this, psourcename, pentrypoint, ptargetprofile, parguments, argcount, pdefines, definecount, ppargs)
  end
  def get_pdb_contents(this : IDxcUtils*, ppdbblob : IDxcBlob, pphash : IDxcBlob*, ppcontainer : IDxcBlob*) : HRESULT
    @lpVtbl.value.get_pdb_contents.call(this, ppdbblob, pphash, ppcontainer)
  end
end
struct LibWin32::IDxcResult
  def query_interface(this : IDxcResult*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcResult*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcResult*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_status(this : IDxcResult*, pstatus : HRESULT*) : HRESULT
    @lpVtbl.value.get_status.call(this, pstatus)
  end
  def get_result(this : IDxcResult*, ppresult : IDxcBlob*) : HRESULT
    @lpVtbl.value.get_result.call(this, ppresult)
  end
  def get_error_buffer(this : IDxcResult*, pperrors : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.get_error_buffer.call(this, pperrors)
  end
  def has_output(this : IDxcResult*, dxcoutkind : DXC_OUT_KIND) : LibC::BOOL
    @lpVtbl.value.has_output.call(this, dxcoutkind)
  end
  def get_output(this : IDxcResult*, dxcoutkind : DXC_OUT_KIND, iid : Guid*, ppvobject : Void**, ppoutputname : IDxcBlobUtf16*) : HRESULT
    @lpVtbl.value.get_output.call(this, dxcoutkind, iid, ppvobject, ppoutputname)
  end
  def get_num_outputs(this : IDxcResult*) : UInt32
    @lpVtbl.value.get_num_outputs.call(this)
  end
  def get_output_by_index(this : IDxcResult*, index : UInt32) : DXC_OUT_KIND
    @lpVtbl.value.get_output_by_index.call(this, index)
  end
  def primary_output(this : IDxcResult*) : DXC_OUT_KIND
    @lpVtbl.value.primary_output.call(this)
  end
end
struct LibWin32::IDxcExtraOutputs
  def query_interface(this : IDxcExtraOutputs*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcExtraOutputs*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcExtraOutputs*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_output_count(this : IDxcExtraOutputs*) : UInt32
    @lpVtbl.value.get_output_count.call(this)
  end
  def get_output(this : IDxcExtraOutputs*, uindex : UInt32, iid : Guid*, ppvobject : Void**, ppoutputtype : IDxcBlobUtf16*, ppoutputname : IDxcBlobUtf16*) : HRESULT
    @lpVtbl.value.get_output.call(this, uindex, iid, ppvobject, ppoutputtype, ppoutputname)
  end
end
struct LibWin32::IDxcCompiler3
  def query_interface(this : IDxcCompiler3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcCompiler3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcCompiler3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def compile(this : IDxcCompiler3*, psource : DxcBuffer*, parguments : LibC::LPWSTR*, argcount : UInt32, pincludehandler : IDxcIncludeHandler, riid : Guid*, ppresult : Void**) : HRESULT
    @lpVtbl.value.compile.call(this, psource, parguments, argcount, pincludehandler, riid, ppresult)
  end
  def disassemble(this : IDxcCompiler3*, pobject : DxcBuffer*, riid : Guid*, ppresult : Void**) : HRESULT
    @lpVtbl.value.disassemble.call(this, pobject, riid, ppresult)
  end
end
struct LibWin32::IDxcValidator
  def query_interface(this : IDxcValidator*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcValidator*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcValidator*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def validate(this : IDxcValidator*, pshader : IDxcBlob, flags : UInt32, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.validate.call(this, pshader, flags, ppresult)
  end
end
struct LibWin32::IDxcValidator2
  def query_interface(this : IDxcValidator2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcValidator2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcValidator2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def validate(this : IDxcValidator2*, pshader : IDxcBlob, flags : UInt32, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.validate.call(this, pshader, flags, ppresult)
  end
  def validate_with_debug(this : IDxcValidator2*, pshader : IDxcBlob, flags : UInt32, poptdebugbitcode : DxcBuffer*, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.validate_with_debug.call(this, pshader, flags, poptdebugbitcode, ppresult)
  end
end
struct LibWin32::IDxcContainerBuilder
  def query_interface(this : IDxcContainerBuilder*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcContainerBuilder*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcContainerBuilder*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def load(this : IDxcContainerBuilder*, pdxilcontainerheader : IDxcBlob) : HRESULT
    @lpVtbl.value.load.call(this, pdxilcontainerheader)
  end
  def add_part(this : IDxcContainerBuilder*, fourcc : UInt32, psource : IDxcBlob) : HRESULT
    @lpVtbl.value.add_part.call(this, fourcc, psource)
  end
  def remove_part(this : IDxcContainerBuilder*, fourcc : UInt32) : HRESULT
    @lpVtbl.value.remove_part.call(this, fourcc)
  end
  def serialize_container(this : IDxcContainerBuilder*, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.serialize_container.call(this, ppresult)
  end
end
struct LibWin32::IDxcAssembler
  def query_interface(this : IDxcAssembler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcAssembler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcAssembler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def assemble_to_container(this : IDxcAssembler*, pshader : IDxcBlob, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.assemble_to_container.call(this, pshader, ppresult)
  end
end
struct LibWin32::IDxcContainerReflection
  def query_interface(this : IDxcContainerReflection*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcContainerReflection*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcContainerReflection*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def load(this : IDxcContainerReflection*, pcontainer : IDxcBlob) : HRESULT
    @lpVtbl.value.load.call(this, pcontainer)
  end
  def get_part_count(this : IDxcContainerReflection*, presult : UInt32*) : HRESULT
    @lpVtbl.value.get_part_count.call(this, presult)
  end
  def get_part_kind(this : IDxcContainerReflection*, idx : UInt32, presult : UInt32*) : HRESULT
    @lpVtbl.value.get_part_kind.call(this, idx, presult)
  end
  def get_part_content(this : IDxcContainerReflection*, idx : UInt32, ppresult : IDxcBlob*) : HRESULT
    @lpVtbl.value.get_part_content.call(this, idx, ppresult)
  end
  def find_first_part_kind(this : IDxcContainerReflection*, kind : UInt32, presult : UInt32*) : HRESULT
    @lpVtbl.value.find_first_part_kind.call(this, kind, presult)
  end
  def get_part_reflection(this : IDxcContainerReflection*, idx : UInt32, iid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.get_part_reflection.call(this, idx, iid, ppvobject)
  end
end
struct LibWin32::IDxcOptimizerPass
  def query_interface(this : IDxcOptimizerPass*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcOptimizerPass*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcOptimizerPass*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_option_name(this : IDxcOptimizerPass*, ppresult : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_option_name.call(this, ppresult)
  end
  def get_description(this : IDxcOptimizerPass*, ppresult : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_description.call(this, ppresult)
  end
  def get_option_arg_count(this : IDxcOptimizerPass*, pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_option_arg_count.call(this, pcount)
  end
  def get_option_arg_name(this : IDxcOptimizerPass*, argindex : UInt32, ppresult : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_option_arg_name.call(this, argindex, ppresult)
  end
  def get_option_arg_description(this : IDxcOptimizerPass*, argindex : UInt32, ppresult : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_option_arg_description.call(this, argindex, ppresult)
  end
end
struct LibWin32::IDxcOptimizer
  def query_interface(this : IDxcOptimizer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcOptimizer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcOptimizer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_available_pass_count(this : IDxcOptimizer*, pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_available_pass_count.call(this, pcount)
  end
  def get_available_pass(this : IDxcOptimizer*, index : UInt32, ppresult : IDxcOptimizerPass*) : HRESULT
    @lpVtbl.value.get_available_pass.call(this, index, ppresult)
  end
  def run_optimizer(this : IDxcOptimizer*, pblob : IDxcBlob, ppoptions : LibC::LPWSTR*, optioncount : UInt32, poutputmodule : IDxcBlob*, ppoutputtext : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.run_optimizer.call(this, pblob, ppoptions, optioncount, poutputmodule, ppoutputtext)
  end
end
struct LibWin32::IDxcVersionInfo
  def query_interface(this : IDxcVersionInfo*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcVersionInfo*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcVersionInfo*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_version(this : IDxcVersionInfo*, pmajor : UInt32*, pminor : UInt32*) : HRESULT
    @lpVtbl.value.get_version.call(this, pmajor, pminor)
  end
  def get_flags(this : IDxcVersionInfo*, pflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.call(this, pflags)
  end
end
struct LibWin32::IDxcVersionInfo2
  def query_interface(this : IDxcVersionInfo2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcVersionInfo2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcVersionInfo2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_version(this : IDxcVersionInfo2*, pmajor : UInt32*, pminor : UInt32*) : HRESULT
    @lpVtbl.value.get_version.call(this, pmajor, pminor)
  end
  def get_flags(this : IDxcVersionInfo2*, pflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.call(this, pflags)
  end
  def get_commit_info(this : IDxcVersionInfo2*, pcommitcount : UInt32*, pcommithash : Int8**) : HRESULT
    @lpVtbl.value.get_commit_info.call(this, pcommitcount, pcommithash)
  end
end
struct LibWin32::IDxcVersionInfo3
  def query_interface(this : IDxcVersionInfo3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcVersionInfo3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcVersionInfo3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_custom_version_string(this : IDxcVersionInfo3*, pversionstring : Int8**) : HRESULT
    @lpVtbl.value.get_custom_version_string.call(this, pversionstring)
  end
end
struct LibWin32::IDxcPdbUtils
  def query_interface(this : IDxcPdbUtils*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDxcPdbUtils*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDxcPdbUtils*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def load(this : IDxcPdbUtils*, ppdbordxil : IDxcBlob) : HRESULT
    @lpVtbl.value.load.call(this, ppdbordxil)
  end
  def get_source_count(this : IDxcPdbUtils*, pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_source_count.call(this, pcount)
  end
  def get_source(this : IDxcPdbUtils*, uindex : UInt32, ppresult : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.get_source.call(this, uindex, ppresult)
  end
  def get_source_name(this : IDxcPdbUtils*, uindex : UInt32, presult : UInt8**) : HRESULT
    @lpVtbl.value.get_source_name.call(this, uindex, presult)
  end
  def get_flag_count(this : IDxcPdbUtils*, pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_flag_count.call(this, pcount)
  end
  def get_flag(this : IDxcPdbUtils*, uindex : UInt32, presult : UInt8**) : HRESULT
    @lpVtbl.value.get_flag.call(this, uindex, presult)
  end
  def get_arg_count(this : IDxcPdbUtils*, pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_arg_count.call(this, pcount)
  end
  def get_arg(this : IDxcPdbUtils*, uindex : UInt32, presult : UInt8**) : HRESULT
    @lpVtbl.value.get_arg.call(this, uindex, presult)
  end
  def get_arg_pair_count(this : IDxcPdbUtils*, pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_arg_pair_count.call(this, pcount)
  end
  def get_arg_pair(this : IDxcPdbUtils*, uindex : UInt32, pname : UInt8**, pvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_arg_pair.call(this, uindex, pname, pvalue)
  end
  def get_define_count(this : IDxcPdbUtils*, pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_define_count.call(this, pcount)
  end
  def get_define(this : IDxcPdbUtils*, uindex : UInt32, presult : UInt8**) : HRESULT
    @lpVtbl.value.get_define.call(this, uindex, presult)
  end
  def get_target_profile(this : IDxcPdbUtils*, presult : UInt8**) : HRESULT
    @lpVtbl.value.get_target_profile.call(this, presult)
  end
  def get_entry_point(this : IDxcPdbUtils*, presult : UInt8**) : HRESULT
    @lpVtbl.value.get_entry_point.call(this, presult)
  end
  def get_main_file_name(this : IDxcPdbUtils*, presult : UInt8**) : HRESULT
    @lpVtbl.value.get_main_file_name.call(this, presult)
  end
  def get_hash(this : IDxcPdbUtils*, ppresult : IDxcBlob*) : HRESULT
    @lpVtbl.value.get_hash.call(this, ppresult)
  end
  def get_name(this : IDxcPdbUtils*, presult : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, presult)
  end
  def is_full_pdb(this : IDxcPdbUtils*) : LibC::BOOL
    @lpVtbl.value.is_full_pdb.call(this)
  end
  def get_full_pdb(this : IDxcPdbUtils*, ppfullpdb : IDxcBlob*) : HRESULT
    @lpVtbl.value.get_full_pdb.call(this, ppfullpdb)
  end
  def get_version_info(this : IDxcPdbUtils*, ppversioninfo : IDxcVersionInfo*) : HRESULT
    @lpVtbl.value.get_version_info.call(this, ppversioninfo)
  end
  def set_compiler(this : IDxcPdbUtils*, pcompiler : IDxcCompiler3) : HRESULT
    @lpVtbl.value.set_compiler.call(this, pcompiler)
  end
  def compile_for_full_pdb(this : IDxcPdbUtils*, ppresult : IDxcResult*) : HRESULT
    @lpVtbl.value.compile_for_full_pdb.call(this, ppresult)
  end
  def override_args(this : IDxcPdbUtils*, pargpairs : DxcArgPair*, unumargpairs : UInt32) : HRESULT
    @lpVtbl.value.override_args.call(this, pargpairs, unumargpairs)
  end
  def override_root_signature(this : IDxcPdbUtils*, prootsignature : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.override_root_signature.call(this, prootsignature)
  end
end
