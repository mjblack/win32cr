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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_buffer_pointer : UInt64
    get_buffer_size : UInt64
  end

  IDxcBlob_GUID = "8ba5fb08-5195-40e2-ac58-0d989c3a0102"
  IID_IDxcBlob = LibC::GUID.new(0x8ba5fb08_u32, 0x5195_u16, 0x40e2_u16, StaticArray[0xac_u8, 0x58_u8, 0xd_u8, 0x98_u8, 0x9c_u8, 0x3a_u8, 0x1_u8, 0x2_u8])
  struct IDxcBlob
    lpVtbl : IDxcBlobVTbl*
  end

  struct IDxcBlobEncodingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_buffer_pointer : UInt64
    get_buffer_size : UInt64
    get_encoding : UInt64
  end

  IDxcBlobEncoding_GUID = "7241d424-2646-4191-97c0-98e96e42fc68"
  IID_IDxcBlobEncoding = LibC::GUID.new(0x7241d424_u32, 0x2646_u16, 0x4191_u16, StaticArray[0x97_u8, 0xc0_u8, 0x98_u8, 0xe9_u8, 0x6e_u8, 0x42_u8, 0xfc_u8, 0x68_u8])
  struct IDxcBlobEncoding
    lpVtbl : IDxcBlobEncodingVTbl*
  end

  struct IDxcBlobUtf16VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_buffer_pointer : UInt64
    get_buffer_size : UInt64
    get_encoding : UInt64
    get_string_pointer : UInt64
    get_string_length : UInt64
  end

  IDxcBlobUtf16_GUID = "a3f84eab-0faa-497e-a39c-ee6ed60b2d84"
  IID_IDxcBlobUtf16 = LibC::GUID.new(0xa3f84eab_u32, 0xfaa_u16, 0x497e_u16, StaticArray[0xa3_u8, 0x9c_u8, 0xee_u8, 0x6e_u8, 0xd6_u8, 0xb_u8, 0x2d_u8, 0x84_u8])
  struct IDxcBlobUtf16
    lpVtbl : IDxcBlobUtf16VTbl*
  end

  struct IDxcBlobUtf8VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_buffer_pointer : UInt64
    get_buffer_size : UInt64
    get_encoding : UInt64
    get_string_pointer : UInt64
    get_string_length : UInt64
  end

  IDxcBlobUtf8_GUID = "3da636c9-ba71-4024-a301-30cbf125305b"
  IID_IDxcBlobUtf8 = LibC::GUID.new(0x3da636c9_u32, 0xba71_u16, 0x4024_u16, StaticArray[0xa3_u8, 0x1_u8, 0x30_u8, 0xcb_u8, 0xf1_u8, 0x25_u8, 0x30_u8, 0x5b_u8])
  struct IDxcBlobUtf8
    lpVtbl : IDxcBlobUtf8VTbl*
  end

  struct IDxcIncludeHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    load_source : UInt64
  end

  IDxcIncludeHandler_GUID = "7f61fc7d-950d-467f-b3e3-3c02fb49187c"
  IID_IDxcIncludeHandler = LibC::GUID.new(0x7f61fc7d_u32, 0x950d_u16, 0x467f_u16, StaticArray[0xb3_u8, 0xe3_u8, 0x3c_u8, 0x2_u8, 0xfb_u8, 0x49_u8, 0x18_u8, 0x7c_u8])
  struct IDxcIncludeHandler
    lpVtbl : IDxcIncludeHandlerVTbl*
  end

  struct IDxcCompilerArgsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_arguments : UInt64
    get_count : UInt64
    add_arguments : UInt64
    add_arguments_utf8 : UInt64
    add_defines : UInt64
  end

  IDxcCompilerArgs_GUID = "73effe2a-70dc-45f8-9690-eff64c02429d"
  IID_IDxcCompilerArgs = LibC::GUID.new(0x73effe2a_u32, 0x70dc_u16, 0x45f8_u16, StaticArray[0x96_u8, 0x90_u8, 0xef_u8, 0xf6_u8, 0x4c_u8, 0x2_u8, 0x42_u8, 0x9d_u8])
  struct IDxcCompilerArgs
    lpVtbl : IDxcCompilerArgsVTbl*
  end

  struct IDxcLibraryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_malloc : UInt64
    create_blob_from_blob : UInt64
    create_blob_from_file : UInt64
    create_blob_with_encoding_from_pinned : UInt64
    create_blob_with_encoding_on_heap_copy : UInt64
    create_blob_with_encoding_on_malloc : UInt64
    create_include_handler : UInt64
    create_stream_from_blob_read_only : UInt64
    get_blob_as_utf8 : UInt64
    get_blob_as_utf16 : UInt64
  end

  IDxcLibrary_GUID = "e5204dc7-d18c-4c3c-bdfb-851673980fe7"
  IID_IDxcLibrary = LibC::GUID.new(0xe5204dc7_u32, 0xd18c_u16, 0x4c3c_u16, StaticArray[0xbd_u8, 0xfb_u8, 0x85_u8, 0x16_u8, 0x73_u8, 0x98_u8, 0xf_u8, 0xe7_u8])
  struct IDxcLibrary
    lpVtbl : IDxcLibraryVTbl*
  end

  struct IDxcOperationResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_status : UInt64
    get_result : UInt64
    get_error_buffer : UInt64
  end

  IDxcOperationResult_GUID = "cedb484a-d4e9-445a-b991-ca21ca157dc2"
  IID_IDxcOperationResult = LibC::GUID.new(0xcedb484a_u32, 0xd4e9_u16, 0x445a_u16, StaticArray[0xb9_u8, 0x91_u8, 0xca_u8, 0x21_u8, 0xca_u8, 0x15_u8, 0x7d_u8, 0xc2_u8])
  struct IDxcOperationResult
    lpVtbl : IDxcOperationResultVTbl*
  end

  struct IDxcCompilerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    compile : UInt64
    preprocess : UInt64
    disassemble : UInt64
  end

  IDxcCompiler_GUID = "8c210bf3-011f-4422-8d70-6f9acb8db617"
  IID_IDxcCompiler = LibC::GUID.new(0x8c210bf3_u32, 0x11f_u16, 0x4422_u16, StaticArray[0x8d_u8, 0x70_u8, 0x6f_u8, 0x9a_u8, 0xcb_u8, 0x8d_u8, 0xb6_u8, 0x17_u8])
  struct IDxcCompiler
    lpVtbl : IDxcCompilerVTbl*
  end

  struct IDxcCompiler2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    compile : UInt64
    preprocess : UInt64
    disassemble : UInt64
    compile_with_debug : UInt64
  end

  IDxcCompiler2_GUID = "a005a9d9-b8bb-4594-b5c9-0e633bec4d37"
  IID_IDxcCompiler2 = LibC::GUID.new(0xa005a9d9_u32, 0xb8bb_u16, 0x4594_u16, StaticArray[0xb5_u8, 0xc9_u8, 0xe_u8, 0x63_u8, 0x3b_u8, 0xec_u8, 0x4d_u8, 0x37_u8])
  struct IDxcCompiler2
    lpVtbl : IDxcCompiler2VTbl*
  end

  struct IDxcLinkerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_library : UInt64
    link : UInt64
  end

  IDxcLinker_GUID = "f1b5be2a-62dd-4327-a1c2-42ac1e1e78e6"
  IID_IDxcLinker = LibC::GUID.new(0xf1b5be2a_u32, 0x62dd_u16, 0x4327_u16, StaticArray[0xa1_u8, 0xc2_u8, 0x42_u8, 0xac_u8, 0x1e_u8, 0x1e_u8, 0x78_u8, 0xe6_u8])
  struct IDxcLinker
    lpVtbl : IDxcLinkerVTbl*
  end

  struct IDxcUtilsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_blob_from_blob : UInt64
    create_blob_from_pinned : UInt64
    move_to_blob : UInt64
    create_blob : UInt64
    load_file : UInt64
    create_read_only_stream_from_blob : UInt64
    create_default_include_handler : UInt64
    get_blob_as_utf8 : UInt64
    get_blob_as_utf16 : UInt64
    get_dxil_container_part : UInt64
    create_reflection : UInt64
    build_arguments : UInt64
    get_pdb_contents : UInt64
  end

  IDxcUtils_GUID = "4605c4cb-2019-492a-ada4-65f20bb7d67f"
  IID_IDxcUtils = LibC::GUID.new(0x4605c4cb_u32, 0x2019_u16, 0x492a_u16, StaticArray[0xad_u8, 0xa4_u8, 0x65_u8, 0xf2_u8, 0xb_u8, 0xb7_u8, 0xd6_u8, 0x7f_u8])
  struct IDxcUtils
    lpVtbl : IDxcUtilsVTbl*
  end

  struct IDxcResultVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_status : UInt64
    get_result : UInt64
    get_error_buffer : UInt64
    has_output : UInt64
    get_output : UInt64
    get_num_outputs : UInt64
    get_output_by_index : UInt64
    primary_output : UInt64
  end

  IDxcResult_GUID = "58346cda-dde7-4497-9461-6f87af5e0659"
  IID_IDxcResult = LibC::GUID.new(0x58346cda_u32, 0xdde7_u16, 0x4497_u16, StaticArray[0x94_u8, 0x61_u8, 0x6f_u8, 0x87_u8, 0xaf_u8, 0x5e_u8, 0x6_u8, 0x59_u8])
  struct IDxcResult
    lpVtbl : IDxcResultVTbl*
  end

  struct IDxcExtraOutputsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_output_count : UInt64
    get_output : UInt64
  end

  IDxcExtraOutputs_GUID = "319b37a2-a5c2-494a-a5de-4801b2faf989"
  IID_IDxcExtraOutputs = LibC::GUID.new(0x319b37a2_u32, 0xa5c2_u16, 0x494a_u16, StaticArray[0xa5_u8, 0xde_u8, 0x48_u8, 0x1_u8, 0xb2_u8, 0xfa_u8, 0xf9_u8, 0x89_u8])
  struct IDxcExtraOutputs
    lpVtbl : IDxcExtraOutputsVTbl*
  end

  struct IDxcCompiler3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    compile : UInt64
    disassemble : UInt64
  end

  IDxcCompiler3_GUID = "228b4687-5a6a-4730-900c-9702b2203f54"
  IID_IDxcCompiler3 = LibC::GUID.new(0x228b4687_u32, 0x5a6a_u16, 0x4730_u16, StaticArray[0x90_u8, 0xc_u8, 0x97_u8, 0x2_u8, 0xb2_u8, 0x20_u8, 0x3f_u8, 0x54_u8])
  struct IDxcCompiler3
    lpVtbl : IDxcCompiler3VTbl*
  end

  struct IDxcValidatorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    validate : UInt64
  end

  IDxcValidator_GUID = "a6e82bd2-1fd7-4826-9811-2857e797f49a"
  IID_IDxcValidator = LibC::GUID.new(0xa6e82bd2_u32, 0x1fd7_u16, 0x4826_u16, StaticArray[0x98_u8, 0x11_u8, 0x28_u8, 0x57_u8, 0xe7_u8, 0x97_u8, 0xf4_u8, 0x9a_u8])
  struct IDxcValidator
    lpVtbl : IDxcValidatorVTbl*
  end

  struct IDxcValidator2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    validate : UInt64
    validate_with_debug : UInt64
  end

  IDxcValidator2_GUID = "458e1fd1-b1b2-4750-a6e1-9c10f03bed92"
  IID_IDxcValidator2 = LibC::GUID.new(0x458e1fd1_u32, 0xb1b2_u16, 0x4750_u16, StaticArray[0xa6_u8, 0xe1_u8, 0x9c_u8, 0x10_u8, 0xf0_u8, 0x3b_u8, 0xed_u8, 0x92_u8])
  struct IDxcValidator2
    lpVtbl : IDxcValidator2VTbl*
  end

  struct IDxcContainerBuilderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    load : UInt64
    add_part : UInt64
    remove_part : UInt64
    serialize_container : UInt64
  end

  IDxcContainerBuilder_GUID = "334b1f50-2292-4b35-99a1-25588d8c17fe"
  IID_IDxcContainerBuilder = LibC::GUID.new(0x334b1f50_u32, 0x2292_u16, 0x4b35_u16, StaticArray[0x99_u8, 0xa1_u8, 0x25_u8, 0x58_u8, 0x8d_u8, 0x8c_u8, 0x17_u8, 0xfe_u8])
  struct IDxcContainerBuilder
    lpVtbl : IDxcContainerBuilderVTbl*
  end

  struct IDxcAssemblerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    assemble_to_container : UInt64
  end

  IDxcAssembler_GUID = "091f7a26-1c1f-4948-904b-e6e3a8a771d5"
  IID_IDxcAssembler = LibC::GUID.new(0x91f7a26_u32, 0x1c1f_u16, 0x4948_u16, StaticArray[0x90_u8, 0x4b_u8, 0xe6_u8, 0xe3_u8, 0xa8_u8, 0xa7_u8, 0x71_u8, 0xd5_u8])
  struct IDxcAssembler
    lpVtbl : IDxcAssemblerVTbl*
  end

  struct IDxcContainerReflectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    load : UInt64
    get_part_count : UInt64
    get_part_kind : UInt64
    get_part_content : UInt64
    find_first_part_kind : UInt64
    get_part_reflection : UInt64
  end

  IDxcContainerReflection_GUID = "d2c21b26-8350-4bdc-976a-331ce6f4c54c"
  IID_IDxcContainerReflection = LibC::GUID.new(0xd2c21b26_u32, 0x8350_u16, 0x4bdc_u16, StaticArray[0x97_u8, 0x6a_u8, 0x33_u8, 0x1c_u8, 0xe6_u8, 0xf4_u8, 0xc5_u8, 0x4c_u8])
  struct IDxcContainerReflection
    lpVtbl : IDxcContainerReflectionVTbl*
  end

  struct IDxcOptimizerPassVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_option_name : UInt64
    get_description : UInt64
    get_option_arg_count : UInt64
    get_option_arg_name : UInt64
    get_option_arg_description : UInt64
  end

  IDxcOptimizerPass_GUID = "ae2cd79f-cc22-453f-9b6b-b124e7a5204c"
  IID_IDxcOptimizerPass = LibC::GUID.new(0xae2cd79f_u32, 0xcc22_u16, 0x453f_u16, StaticArray[0x9b_u8, 0x6b_u8, 0xb1_u8, 0x24_u8, 0xe7_u8, 0xa5_u8, 0x20_u8, 0x4c_u8])
  struct IDxcOptimizerPass
    lpVtbl : IDxcOptimizerPassVTbl*
  end

  struct IDxcOptimizerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_available_pass_count : UInt64
    get_available_pass : UInt64
    run_optimizer : UInt64
  end

  IDxcOptimizer_GUID = "25740e2e-9cba-401b-9119-4fb42f39f270"
  IID_IDxcOptimizer = LibC::GUID.new(0x25740e2e_u32, 0x9cba_u16, 0x401b_u16, StaticArray[0x91_u8, 0x19_u8, 0x4f_u8, 0xb4_u8, 0x2f_u8, 0x39_u8, 0xf2_u8, 0x70_u8])
  struct IDxcOptimizer
    lpVtbl : IDxcOptimizerVTbl*
  end

  struct IDxcVersionInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_version : UInt64
    get_flags : UInt64
  end

  IDxcVersionInfo_GUID = "b04f5b50-2059-4f12-a8ff-a1e0cde1cc7e"
  IID_IDxcVersionInfo = LibC::GUID.new(0xb04f5b50_u32, 0x2059_u16, 0x4f12_u16, StaticArray[0xa8_u8, 0xff_u8, 0xa1_u8, 0xe0_u8, 0xcd_u8, 0xe1_u8, 0xcc_u8, 0x7e_u8])
  struct IDxcVersionInfo
    lpVtbl : IDxcVersionInfoVTbl*
  end

  struct IDxcVersionInfo2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_version : UInt64
    get_flags : UInt64
    get_commit_info : UInt64
  end

  IDxcVersionInfo2_GUID = "fb6904c4-42f0-4b62-9c46-983af7da7c83"
  IID_IDxcVersionInfo2 = LibC::GUID.new(0xfb6904c4_u32, 0x42f0_u16, 0x4b62_u16, StaticArray[0x9c_u8, 0x46_u8, 0x98_u8, 0x3a_u8, 0xf7_u8, 0xda_u8, 0x7c_u8, 0x83_u8])
  struct IDxcVersionInfo2
    lpVtbl : IDxcVersionInfo2VTbl*
  end

  struct IDxcVersionInfo3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_custom_version_string : UInt64
  end

  IDxcVersionInfo3_GUID = "5e13e843-9d25-473c-9ad2-03b2d0b44b1e"
  IID_IDxcVersionInfo3 = LibC::GUID.new(0x5e13e843_u32, 0x9d25_u16, 0x473c_u16, StaticArray[0x9a_u8, 0xd2_u8, 0x3_u8, 0xb2_u8, 0xd0_u8, 0xb4_u8, 0x4b_u8, 0x1e_u8])
  struct IDxcVersionInfo3
    lpVtbl : IDxcVersionInfo3VTbl*
  end

  struct IDxcPdbUtilsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    load : UInt64
    get_source_count : UInt64
    get_source : UInt64
    get_source_name : UInt64
    get_flag_count : UInt64
    get_flag : UInt64
    get_arg_count : UInt64
    get_arg : UInt64
    get_arg_pair_count : UInt64
    get_arg_pair : UInt64
    get_define_count : UInt64
    get_define : UInt64
    get_target_profile : UInt64
    get_entry_point : UInt64
    get_main_file_name : UInt64
    get_hash : UInt64
    get_name : UInt64
    is_full_pdb : UInt64
    get_full_pdb : UInt64
    get_version_info : UInt64
    set_compiler : UInt64
    compile_for_full_pdb : UInt64
    override_args : UInt64
    override_root_signature : UInt64
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
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_buffer_pointer : Void*
    @lpVtbl.value.get_buffer_pointer.unsafe_as(Proc(Void**)).call
  end
  def get_buffer_size : LibC::UINT_PTR
    @lpVtbl.value.get_buffer_size.unsafe_as(Proc(LibC::UINT_PTR)).call
  end
end
struct LibWin32::IDxcBlobEncoding
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_buffer_pointer : Void*
    @lpVtbl.value.get_buffer_pointer.unsafe_as(Proc(Void**)).call
  end
  def get_buffer_size : LibC::UINT_PTR
    @lpVtbl.value.get_buffer_size.unsafe_as(Proc(LibC::UINT_PTR)).call
  end
  def get_encoding(pknown : LibC::BOOL*, pcodepage : DXC_CP*) : HRESULT
    @lpVtbl.value.get_encoding.unsafe_as(Proc(LibC::BOOL*, DXC_CP*, HRESULT)).call(pknown, pcodepage)
  end
end
struct LibWin32::IDxcBlobUtf16
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_buffer_pointer : Void*
    @lpVtbl.value.get_buffer_pointer.unsafe_as(Proc(Void**)).call
  end
  def get_buffer_size : LibC::UINT_PTR
    @lpVtbl.value.get_buffer_size.unsafe_as(Proc(LibC::UINT_PTR)).call
  end
  def get_encoding(pknown : LibC::BOOL*, pcodepage : DXC_CP*) : HRESULT
    @lpVtbl.value.get_encoding.unsafe_as(Proc(LibC::BOOL*, DXC_CP*, HRESULT)).call(pknown, pcodepage)
  end
  def get_string_pointer : LibC::LPWSTR
    @lpVtbl.value.get_string_pointer.unsafe_as(Proc(LibC::LPWSTR)).call
  end
  def get_string_length : LibC::UINT_PTR
    @lpVtbl.value.get_string_length.unsafe_as(Proc(LibC::UINT_PTR)).call
  end
end
struct LibWin32::IDxcBlobUtf8
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_buffer_pointer : Void*
    @lpVtbl.value.get_buffer_pointer.unsafe_as(Proc(Void**)).call
  end
  def get_buffer_size : LibC::UINT_PTR
    @lpVtbl.value.get_buffer_size.unsafe_as(Proc(LibC::UINT_PTR)).call
  end
  def get_encoding(pknown : LibC::BOOL*, pcodepage : DXC_CP*) : HRESULT
    @lpVtbl.value.get_encoding.unsafe_as(Proc(LibC::BOOL*, DXC_CP*, HRESULT)).call(pknown, pcodepage)
  end
  def get_string_pointer : PSTR
    @lpVtbl.value.get_string_pointer.unsafe_as(Proc(PSTR)).call
  end
  def get_string_length : LibC::UINT_PTR
    @lpVtbl.value.get_string_length.unsafe_as(Proc(LibC::UINT_PTR)).call
  end
end
struct LibWin32::IDxcIncludeHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def load_source(pfilename : LibC::LPWSTR, ppincludesource : IDxcBlob*) : HRESULT
    @lpVtbl.value.load_source.unsafe_as(Proc(LibC::LPWSTR, IDxcBlob*, HRESULT)).call(pfilename, ppincludesource)
  end
end
struct LibWin32::IDxcCompilerArgs
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_arguments : LibC::LPWSTR*
    @lpVtbl.value.get_arguments.unsafe_as(Proc(LibC::LPWSTR**)).call
  end
  def get_count : UInt32
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32)).call
  end
  def add_arguments(parguments : LibC::LPWSTR*, argcount : UInt32) : HRESULT
    @lpVtbl.value.add_arguments.unsafe_as(Proc(LibC::LPWSTR*, UInt32, HRESULT)).call(parguments, argcount)
  end
  def add_arguments_utf8(parguments : PSTR*, argcount : UInt32) : HRESULT
    @lpVtbl.value.add_arguments_utf8.unsafe_as(Proc(PSTR*, UInt32, HRESULT)).call(parguments, argcount)
  end
  def add_defines(pdefines : DxcDefine*, definecount : UInt32) : HRESULT
    @lpVtbl.value.add_defines.unsafe_as(Proc(DxcDefine*, UInt32, HRESULT)).call(pdefines, definecount)
  end
end
struct LibWin32::IDxcLibrary
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_malloc(pmalloc : IMalloc) : HRESULT
    @lpVtbl.value.set_malloc.unsafe_as(Proc(IMalloc, HRESULT)).call(pmalloc)
  end
  def create_blob_from_blob(pblob : IDxcBlob, offset : UInt32, length : UInt32, ppresult : IDxcBlob*) : HRESULT
    @lpVtbl.value.create_blob_from_blob.unsafe_as(Proc(IDxcBlob, UInt32, UInt32, IDxcBlob*, HRESULT)).call(pblob, offset, length, ppresult)
  end
  def create_blob_from_file(pfilename : LibC::LPWSTR, codepage : DXC_CP*, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.create_blob_from_file.unsafe_as(Proc(LibC::LPWSTR, DXC_CP*, IDxcBlobEncoding*, HRESULT)).call(pfilename, codepage, pblobencoding)
  end
  def create_blob_with_encoding_from_pinned(ptext : Void*, size : UInt32, codepage : DXC_CP, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.create_blob_with_encoding_from_pinned.unsafe_as(Proc(Void*, UInt32, DXC_CP, IDxcBlobEncoding*, HRESULT)).call(ptext, size, codepage, pblobencoding)
  end
  def create_blob_with_encoding_on_heap_copy(ptext : Void*, size : UInt32, codepage : DXC_CP, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.create_blob_with_encoding_on_heap_copy.unsafe_as(Proc(Void*, UInt32, DXC_CP, IDxcBlobEncoding*, HRESULT)).call(ptext, size, codepage, pblobencoding)
  end
  def create_blob_with_encoding_on_malloc(ptext : Void*, pimalloc : IMalloc, size : UInt32, codepage : DXC_CP, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.create_blob_with_encoding_on_malloc.unsafe_as(Proc(Void*, IMalloc, UInt32, DXC_CP, IDxcBlobEncoding*, HRESULT)).call(ptext, pimalloc, size, codepage, pblobencoding)
  end
  def create_include_handler(ppresult : IDxcIncludeHandler*) : HRESULT
    @lpVtbl.value.create_include_handler.unsafe_as(Proc(IDxcIncludeHandler*, HRESULT)).call(ppresult)
  end
  def create_stream_from_blob_read_only(pblob : IDxcBlob, ppstream : IStream*) : HRESULT
    @lpVtbl.value.create_stream_from_blob_read_only.unsafe_as(Proc(IDxcBlob, IStream*, HRESULT)).call(pblob, ppstream)
  end
  def get_blob_as_utf8(pblob : IDxcBlob, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.get_blob_as_utf8.unsafe_as(Proc(IDxcBlob, IDxcBlobEncoding*, HRESULT)).call(pblob, pblobencoding)
  end
  def get_blob_as_utf16(pblob : IDxcBlob, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.get_blob_as_utf16.unsafe_as(Proc(IDxcBlob, IDxcBlobEncoding*, HRESULT)).call(pblob, pblobencoding)
  end
end
struct LibWin32::IDxcOperationResult
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_status(pstatus : HRESULT*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(HRESULT*, HRESULT)).call(pstatus)
  end
  def get_result(ppresult : IDxcBlob*) : HRESULT
    @lpVtbl.value.get_result.unsafe_as(Proc(IDxcBlob*, HRESULT)).call(ppresult)
  end
  def get_error_buffer(pperrors : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.get_error_buffer.unsafe_as(Proc(IDxcBlobEncoding*, HRESULT)).call(pperrors)
  end
end
struct LibWin32::IDxcCompiler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def compile(psource : IDxcBlob, psourcename : LibC::LPWSTR, pentrypoint : LibC::LPWSTR, ptargetprofile : LibC::LPWSTR, parguments : LibC::LPWSTR*, argcount : UInt32, pdefines : DxcDefine*, definecount : UInt32, pincludehandler : IDxcIncludeHandler, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.compile.unsafe_as(Proc(IDxcBlob, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR*, UInt32, DxcDefine*, UInt32, IDxcIncludeHandler, IDxcOperationResult*, HRESULT)).call(psource, psourcename, pentrypoint, ptargetprofile, parguments, argcount, pdefines, definecount, pincludehandler, ppresult)
  end
  def preprocess(psource : IDxcBlob, psourcename : LibC::LPWSTR, parguments : LibC::LPWSTR*, argcount : UInt32, pdefines : DxcDefine*, definecount : UInt32, pincludehandler : IDxcIncludeHandler, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.preprocess.unsafe_as(Proc(IDxcBlob, LibC::LPWSTR, LibC::LPWSTR*, UInt32, DxcDefine*, UInt32, IDxcIncludeHandler, IDxcOperationResult*, HRESULT)).call(psource, psourcename, parguments, argcount, pdefines, definecount, pincludehandler, ppresult)
  end
  def disassemble(psource : IDxcBlob, ppdisassembly : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.disassemble.unsafe_as(Proc(IDxcBlob, IDxcBlobEncoding*, HRESULT)).call(psource, ppdisassembly)
  end
end
struct LibWin32::IDxcCompiler2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def compile(psource : IDxcBlob, psourcename : LibC::LPWSTR, pentrypoint : LibC::LPWSTR, ptargetprofile : LibC::LPWSTR, parguments : LibC::LPWSTR*, argcount : UInt32, pdefines : DxcDefine*, definecount : UInt32, pincludehandler : IDxcIncludeHandler, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.compile.unsafe_as(Proc(IDxcBlob, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR*, UInt32, DxcDefine*, UInt32, IDxcIncludeHandler, IDxcOperationResult*, HRESULT)).call(psource, psourcename, pentrypoint, ptargetprofile, parguments, argcount, pdefines, definecount, pincludehandler, ppresult)
  end
  def preprocess(psource : IDxcBlob, psourcename : LibC::LPWSTR, parguments : LibC::LPWSTR*, argcount : UInt32, pdefines : DxcDefine*, definecount : UInt32, pincludehandler : IDxcIncludeHandler, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.preprocess.unsafe_as(Proc(IDxcBlob, LibC::LPWSTR, LibC::LPWSTR*, UInt32, DxcDefine*, UInt32, IDxcIncludeHandler, IDxcOperationResult*, HRESULT)).call(psource, psourcename, parguments, argcount, pdefines, definecount, pincludehandler, ppresult)
  end
  def disassemble(psource : IDxcBlob, ppdisassembly : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.disassemble.unsafe_as(Proc(IDxcBlob, IDxcBlobEncoding*, HRESULT)).call(psource, ppdisassembly)
  end
  def compile_with_debug(psource : IDxcBlob, psourcename : LibC::LPWSTR, pentrypoint : LibC::LPWSTR, ptargetprofile : LibC::LPWSTR, parguments : LibC::LPWSTR*, argcount : UInt32, pdefines : DxcDefine*, definecount : UInt32, pincludehandler : IDxcIncludeHandler, ppresult : IDxcOperationResult*, ppdebugblobname : LibC::LPWSTR*, ppdebugblob : IDxcBlob*) : HRESULT
    @lpVtbl.value.compile_with_debug.unsafe_as(Proc(IDxcBlob, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR*, UInt32, DxcDefine*, UInt32, IDxcIncludeHandler, IDxcOperationResult*, LibC::LPWSTR*, IDxcBlob*, HRESULT)).call(psource, psourcename, pentrypoint, ptargetprofile, parguments, argcount, pdefines, definecount, pincludehandler, ppresult, ppdebugblobname, ppdebugblob)
  end
end
struct LibWin32::IDxcLinker
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_library(plibname : LibC::LPWSTR, plib : IDxcBlob) : HRESULT
    @lpVtbl.value.register_library.unsafe_as(Proc(LibC::LPWSTR, IDxcBlob, HRESULT)).call(plibname, plib)
  end
  def link(pentryname : LibC::LPWSTR, ptargetprofile : LibC::LPWSTR, plibnames : LibC::LPWSTR*, libcount : UInt32, parguments : LibC::LPWSTR*, argcount : UInt32, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.link.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR*, UInt32, LibC::LPWSTR*, UInt32, IDxcOperationResult*, HRESULT)).call(pentryname, ptargetprofile, plibnames, libcount, parguments, argcount, ppresult)
  end
end
struct LibWin32::IDxcUtils
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_blob_from_blob(pblob : IDxcBlob, offset : UInt32, length : UInt32, ppresult : IDxcBlob*) : HRESULT
    @lpVtbl.value.create_blob_from_blob.unsafe_as(Proc(IDxcBlob, UInt32, UInt32, IDxcBlob*, HRESULT)).call(pblob, offset, length, ppresult)
  end
  def create_blob_from_pinned(pdata : Void*, size : UInt32, codepage : DXC_CP, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.create_blob_from_pinned.unsafe_as(Proc(Void*, UInt32, DXC_CP, IDxcBlobEncoding*, HRESULT)).call(pdata, size, codepage, pblobencoding)
  end
  def move_to_blob(pdata : Void*, pimalloc : IMalloc, size : UInt32, codepage : DXC_CP, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.move_to_blob.unsafe_as(Proc(Void*, IMalloc, UInt32, DXC_CP, IDxcBlobEncoding*, HRESULT)).call(pdata, pimalloc, size, codepage, pblobencoding)
  end
  def create_blob(pdata : Void*, size : UInt32, codepage : DXC_CP, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.create_blob.unsafe_as(Proc(Void*, UInt32, DXC_CP, IDxcBlobEncoding*, HRESULT)).call(pdata, size, codepage, pblobencoding)
  end
  def load_file(pfilename : LibC::LPWSTR, pcodepage : DXC_CP*, pblobencoding : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.load_file.unsafe_as(Proc(LibC::LPWSTR, DXC_CP*, IDxcBlobEncoding*, HRESULT)).call(pfilename, pcodepage, pblobencoding)
  end
  def create_read_only_stream_from_blob(pblob : IDxcBlob, ppstream : IStream*) : HRESULT
    @lpVtbl.value.create_read_only_stream_from_blob.unsafe_as(Proc(IDxcBlob, IStream*, HRESULT)).call(pblob, ppstream)
  end
  def create_default_include_handler(ppresult : IDxcIncludeHandler*) : HRESULT
    @lpVtbl.value.create_default_include_handler.unsafe_as(Proc(IDxcIncludeHandler*, HRESULT)).call(ppresult)
  end
  def get_blob_as_utf8(pblob : IDxcBlob, pblobencoding : IDxcBlobUtf8*) : HRESULT
    @lpVtbl.value.get_blob_as_utf8.unsafe_as(Proc(IDxcBlob, IDxcBlobUtf8*, HRESULT)).call(pblob, pblobencoding)
  end
  def get_blob_as_utf16(pblob : IDxcBlob, pblobencoding : IDxcBlobUtf16*) : HRESULT
    @lpVtbl.value.get_blob_as_utf16.unsafe_as(Proc(IDxcBlob, IDxcBlobUtf16*, HRESULT)).call(pblob, pblobencoding)
  end
  def get_dxil_container_part(pshader : DxcBuffer*, dxcpart : UInt32, pppartdata : Void**, ppartsizeinbytes : UInt32*) : HRESULT
    @lpVtbl.value.get_dxil_container_part.unsafe_as(Proc(DxcBuffer*, UInt32, Void**, UInt32*, HRESULT)).call(pshader, dxcpart, pppartdata, ppartsizeinbytes)
  end
  def create_reflection(pdata : DxcBuffer*, iid : Guid*, ppvreflection : Void**) : HRESULT
    @lpVtbl.value.create_reflection.unsafe_as(Proc(DxcBuffer*, Guid*, Void**, HRESULT)).call(pdata, iid, ppvreflection)
  end
  def build_arguments(psourcename : LibC::LPWSTR, pentrypoint : LibC::LPWSTR, ptargetprofile : LibC::LPWSTR, parguments : LibC::LPWSTR*, argcount : UInt32, pdefines : DxcDefine*, definecount : UInt32, ppargs : IDxcCompilerArgs*) : HRESULT
    @lpVtbl.value.build_arguments.unsafe_as(Proc(LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR*, UInt32, DxcDefine*, UInt32, IDxcCompilerArgs*, HRESULT)).call(psourcename, pentrypoint, ptargetprofile, parguments, argcount, pdefines, definecount, ppargs)
  end
  def get_pdb_contents(ppdbblob : IDxcBlob, pphash : IDxcBlob*, ppcontainer : IDxcBlob*) : HRESULT
    @lpVtbl.value.get_pdb_contents.unsafe_as(Proc(IDxcBlob, IDxcBlob*, IDxcBlob*, HRESULT)).call(ppdbblob, pphash, ppcontainer)
  end
end
struct LibWin32::IDxcResult
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_status(pstatus : HRESULT*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(HRESULT*, HRESULT)).call(pstatus)
  end
  def get_result(ppresult : IDxcBlob*) : HRESULT
    @lpVtbl.value.get_result.unsafe_as(Proc(IDxcBlob*, HRESULT)).call(ppresult)
  end
  def get_error_buffer(pperrors : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.get_error_buffer.unsafe_as(Proc(IDxcBlobEncoding*, HRESULT)).call(pperrors)
  end
  def has_output(dxcoutkind : DXC_OUT_KIND) : LibC::BOOL
    @lpVtbl.value.has_output.unsafe_as(Proc(DXC_OUT_KIND, LibC::BOOL)).call(dxcoutkind)
  end
  def get_output(dxcoutkind : DXC_OUT_KIND, iid : Guid*, ppvobject : Void**, ppoutputname : IDxcBlobUtf16*) : HRESULT
    @lpVtbl.value.get_output.unsafe_as(Proc(DXC_OUT_KIND, Guid*, Void**, IDxcBlobUtf16*, HRESULT)).call(dxcoutkind, iid, ppvobject, ppoutputname)
  end
  def get_num_outputs : UInt32
    @lpVtbl.value.get_num_outputs.unsafe_as(Proc(UInt32)).call
  end
  def get_output_by_index(index : UInt32) : DXC_OUT_KIND
    @lpVtbl.value.get_output_by_index.unsafe_as(Proc(UInt32, DXC_OUT_KIND)).call(index)
  end
  def primary_output : DXC_OUT_KIND
    @lpVtbl.value.primary_output.unsafe_as(Proc(DXC_OUT_KIND)).call
  end
end
struct LibWin32::IDxcExtraOutputs
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_output_count : UInt32
    @lpVtbl.value.get_output_count.unsafe_as(Proc(UInt32)).call
  end
  def get_output(uindex : UInt32, iid : Guid*, ppvobject : Void**, ppoutputtype : IDxcBlobUtf16*, ppoutputname : IDxcBlobUtf16*) : HRESULT
    @lpVtbl.value.get_output.unsafe_as(Proc(UInt32, Guid*, Void**, IDxcBlobUtf16*, IDxcBlobUtf16*, HRESULT)).call(uindex, iid, ppvobject, ppoutputtype, ppoutputname)
  end
end
struct LibWin32::IDxcCompiler3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def compile(psource : DxcBuffer*, parguments : LibC::LPWSTR*, argcount : UInt32, pincludehandler : IDxcIncludeHandler, riid : Guid*, ppresult : Void**) : HRESULT
    @lpVtbl.value.compile.unsafe_as(Proc(DxcBuffer*, LibC::LPWSTR*, UInt32, IDxcIncludeHandler, Guid*, Void**, HRESULT)).call(psource, parguments, argcount, pincludehandler, riid, ppresult)
  end
  def disassemble(pobject : DxcBuffer*, riid : Guid*, ppresult : Void**) : HRESULT
    @lpVtbl.value.disassemble.unsafe_as(Proc(DxcBuffer*, Guid*, Void**, HRESULT)).call(pobject, riid, ppresult)
  end
end
struct LibWin32::IDxcValidator
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def validate(pshader : IDxcBlob, flags : UInt32, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.validate.unsafe_as(Proc(IDxcBlob, UInt32, IDxcOperationResult*, HRESULT)).call(pshader, flags, ppresult)
  end
end
struct LibWin32::IDxcValidator2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def validate(pshader : IDxcBlob, flags : UInt32, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.validate.unsafe_as(Proc(IDxcBlob, UInt32, IDxcOperationResult*, HRESULT)).call(pshader, flags, ppresult)
  end
  def validate_with_debug(pshader : IDxcBlob, flags : UInt32, poptdebugbitcode : DxcBuffer*, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.validate_with_debug.unsafe_as(Proc(IDxcBlob, UInt32, DxcBuffer*, IDxcOperationResult*, HRESULT)).call(pshader, flags, poptdebugbitcode, ppresult)
  end
end
struct LibWin32::IDxcContainerBuilder
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def load(pdxilcontainerheader : IDxcBlob) : HRESULT
    @lpVtbl.value.load.unsafe_as(Proc(IDxcBlob, HRESULT)).call(pdxilcontainerheader)
  end
  def add_part(fourcc : UInt32, psource : IDxcBlob) : HRESULT
    @lpVtbl.value.add_part.unsafe_as(Proc(UInt32, IDxcBlob, HRESULT)).call(fourcc, psource)
  end
  def remove_part(fourcc : UInt32) : HRESULT
    @lpVtbl.value.remove_part.unsafe_as(Proc(UInt32, HRESULT)).call(fourcc)
  end
  def serialize_container(ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.serialize_container.unsafe_as(Proc(IDxcOperationResult*, HRESULT)).call(ppresult)
  end
end
struct LibWin32::IDxcAssembler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def assemble_to_container(pshader : IDxcBlob, ppresult : IDxcOperationResult*) : HRESULT
    @lpVtbl.value.assemble_to_container.unsafe_as(Proc(IDxcBlob, IDxcOperationResult*, HRESULT)).call(pshader, ppresult)
  end
end
struct LibWin32::IDxcContainerReflection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def load(pcontainer : IDxcBlob) : HRESULT
    @lpVtbl.value.load.unsafe_as(Proc(IDxcBlob, HRESULT)).call(pcontainer)
  end
  def get_part_count(presult : UInt32*) : HRESULT
    @lpVtbl.value.get_part_count.unsafe_as(Proc(UInt32*, HRESULT)).call(presult)
  end
  def get_part_kind(idx : UInt32, presult : UInt32*) : HRESULT
    @lpVtbl.value.get_part_kind.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(idx, presult)
  end
  def get_part_content(idx : UInt32, ppresult : IDxcBlob*) : HRESULT
    @lpVtbl.value.get_part_content.unsafe_as(Proc(UInt32, IDxcBlob*, HRESULT)).call(idx, ppresult)
  end
  def find_first_part_kind(kind : UInt32, presult : UInt32*) : HRESULT
    @lpVtbl.value.find_first_part_kind.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(kind, presult)
  end
  def get_part_reflection(idx : UInt32, iid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.get_part_reflection.unsafe_as(Proc(UInt32, Guid*, Void**, HRESULT)).call(idx, iid, ppvobject)
  end
end
struct LibWin32::IDxcOptimizerPass
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_option_name(ppresult : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_option_name.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppresult)
  end
  def get_description(ppresult : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(LibC::LPWSTR*, HRESULT)).call(ppresult)
  end
  def get_option_arg_count(pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_option_arg_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcount)
  end
  def get_option_arg_name(argindex : UInt32, ppresult : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_option_arg_name.unsafe_as(Proc(UInt32, LibC::LPWSTR*, HRESULT)).call(argindex, ppresult)
  end
  def get_option_arg_description(argindex : UInt32, ppresult : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_option_arg_description.unsafe_as(Proc(UInt32, LibC::LPWSTR*, HRESULT)).call(argindex, ppresult)
  end
end
struct LibWin32::IDxcOptimizer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_available_pass_count(pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_available_pass_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcount)
  end
  def get_available_pass(index : UInt32, ppresult : IDxcOptimizerPass*) : HRESULT
    @lpVtbl.value.get_available_pass.unsafe_as(Proc(UInt32, IDxcOptimizerPass*, HRESULT)).call(index, ppresult)
  end
  def run_optimizer(pblob : IDxcBlob, ppoptions : LibC::LPWSTR*, optioncount : UInt32, poutputmodule : IDxcBlob*, ppoutputtext : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.run_optimizer.unsafe_as(Proc(IDxcBlob, LibC::LPWSTR*, UInt32, IDxcBlob*, IDxcBlobEncoding*, HRESULT)).call(pblob, ppoptions, optioncount, poutputmodule, ppoutputtext)
  end
end
struct LibWin32::IDxcVersionInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_version(pmajor : UInt32*, pminor : UInt32*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pmajor, pminor)
  end
  def get_flags(pflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pflags)
  end
end
struct LibWin32::IDxcVersionInfo2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_version(pmajor : UInt32*, pminor : UInt32*) : HRESULT
    @lpVtbl.value.get_version.unsafe_as(Proc(UInt32*, UInt32*, HRESULT)).call(pmajor, pminor)
  end
  def get_flags(pflags : UInt32*) : HRESULT
    @lpVtbl.value.get_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pflags)
  end
  def get_commit_info(pcommitcount : UInt32*, pcommithash : Int8**) : HRESULT
    @lpVtbl.value.get_commit_info.unsafe_as(Proc(UInt32*, Int8**, HRESULT)).call(pcommitcount, pcommithash)
  end
end
struct LibWin32::IDxcVersionInfo3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_custom_version_string(pversionstring : Int8**) : HRESULT
    @lpVtbl.value.get_custom_version_string.unsafe_as(Proc(Int8**, HRESULT)).call(pversionstring)
  end
end
struct LibWin32::IDxcPdbUtils
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def load(ppdbordxil : IDxcBlob) : HRESULT
    @lpVtbl.value.load.unsafe_as(Proc(IDxcBlob, HRESULT)).call(ppdbordxil)
  end
  def get_source_count(pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_source_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcount)
  end
  def get_source(uindex : UInt32, ppresult : IDxcBlobEncoding*) : HRESULT
    @lpVtbl.value.get_source.unsafe_as(Proc(UInt32, IDxcBlobEncoding*, HRESULT)).call(uindex, ppresult)
  end
  def get_source_name(uindex : UInt32, presult : UInt8**) : HRESULT
    @lpVtbl.value.get_source_name.unsafe_as(Proc(UInt32, UInt8**, HRESULT)).call(uindex, presult)
  end
  def get_flag_count(pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_flag_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcount)
  end
  def get_flag(uindex : UInt32, presult : UInt8**) : HRESULT
    @lpVtbl.value.get_flag.unsafe_as(Proc(UInt32, UInt8**, HRESULT)).call(uindex, presult)
  end
  def get_arg_count(pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_arg_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcount)
  end
  def get_arg(uindex : UInt32, presult : UInt8**) : HRESULT
    @lpVtbl.value.get_arg.unsafe_as(Proc(UInt32, UInt8**, HRESULT)).call(uindex, presult)
  end
  def get_arg_pair_count(pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_arg_pair_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcount)
  end
  def get_arg_pair(uindex : UInt32, pname : UInt8**, pvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_arg_pair.unsafe_as(Proc(UInt32, UInt8**, UInt8**, HRESULT)).call(uindex, pname, pvalue)
  end
  def get_define_count(pcount : UInt32*) : HRESULT
    @lpVtbl.value.get_define_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pcount)
  end
  def get_define(uindex : UInt32, presult : UInt8**) : HRESULT
    @lpVtbl.value.get_define.unsafe_as(Proc(UInt32, UInt8**, HRESULT)).call(uindex, presult)
  end
  def get_target_profile(presult : UInt8**) : HRESULT
    @lpVtbl.value.get_target_profile.unsafe_as(Proc(UInt8**, HRESULT)).call(presult)
  end
  def get_entry_point(presult : UInt8**) : HRESULT
    @lpVtbl.value.get_entry_point.unsafe_as(Proc(UInt8**, HRESULT)).call(presult)
  end
  def get_main_file_name(presult : UInt8**) : HRESULT
    @lpVtbl.value.get_main_file_name.unsafe_as(Proc(UInt8**, HRESULT)).call(presult)
  end
  def get_hash(ppresult : IDxcBlob*) : HRESULT
    @lpVtbl.value.get_hash.unsafe_as(Proc(IDxcBlob*, HRESULT)).call(ppresult)
  end
  def get_name(presult : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(presult)
  end
  def is_full_pdb : LibC::BOOL
    @lpVtbl.value.is_full_pdb.unsafe_as(Proc(LibC::BOOL)).call
  end
  def get_full_pdb(ppfullpdb : IDxcBlob*) : HRESULT
    @lpVtbl.value.get_full_pdb.unsafe_as(Proc(IDxcBlob*, HRESULT)).call(ppfullpdb)
  end
  def get_version_info(ppversioninfo : IDxcVersionInfo*) : HRESULT
    @lpVtbl.value.get_version_info.unsafe_as(Proc(IDxcVersionInfo*, HRESULT)).call(ppversioninfo)
  end
  def set_compiler(pcompiler : IDxcCompiler3) : HRESULT
    @lpVtbl.value.set_compiler.unsafe_as(Proc(IDxcCompiler3, HRESULT)).call(pcompiler)
  end
  def compile_for_full_pdb(ppresult : IDxcResult*) : HRESULT
    @lpVtbl.value.compile_for_full_pdb.unsafe_as(Proc(IDxcResult*, HRESULT)).call(ppresult)
  end
  def override_args(pargpairs : DxcArgPair*, unumargpairs : UInt32) : HRESULT
    @lpVtbl.value.override_args.unsafe_as(Proc(DxcArgPair*, UInt32, HRESULT)).call(pargpairs, unumargpairs)
  end
  def override_root_signature(prootsignature : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.override_root_signature.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(prootsignature)
  end
end
