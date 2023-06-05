require "../../foundation.cr"
require "../../system/com.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:dxcompiler.dll")]
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

  struct IDxcBlobUtf8
    lpVtbl : IDxcBlobUtf8VTbl*
  end

  struct IDxcIncludeHandlerVTbl
    query_interface : Proc(IDxcIncludeHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcIncludeHandler*, UInt32)
    release : Proc(IDxcIncludeHandler*, UInt32)
    load_source : Proc(IDxcIncludeHandler*, LibC::LPWSTR, IDxcBlob*, HRESULT)
  end

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

  struct IDxcCompiler3
    lpVtbl : IDxcCompiler3VTbl*
  end

  struct IDxcValidatorVTbl
    query_interface : Proc(IDxcValidator*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcValidator*, UInt32)
    release : Proc(IDxcValidator*, UInt32)
    validate : Proc(IDxcValidator*, IDxcBlob, UInt32, IDxcOperationResult*, HRESULT)
  end

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

  struct IDxcContainerBuilder
    lpVtbl : IDxcContainerBuilderVTbl*
  end

  struct IDxcAssemblerVTbl
    query_interface : Proc(IDxcAssembler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcAssembler*, UInt32)
    release : Proc(IDxcAssembler*, UInt32)
    assemble_to_container : Proc(IDxcAssembler*, IDxcBlob, IDxcOperationResult*, HRESULT)
  end

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

  struct IDxcVersionInfo2
    lpVtbl : IDxcVersionInfo2VTbl*
  end

  struct IDxcVersionInfo3VTbl
    query_interface : Proc(IDxcVersionInfo3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDxcVersionInfo3*, UInt32)
    release : Proc(IDxcVersionInfo3*, UInt32)
    get_custom_version_string : Proc(IDxcVersionInfo3*, Int8**, HRESULT)
  end

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

  struct IDxcPdbUtils
    lpVtbl : IDxcPdbUtilsVTbl*
  end


  # Params # rclsid : Guid* [In],riid : Guid* [In],ppv : Void** [In]
  fun DxcCreateInstance(rclsid : Guid*, riid : Guid*, ppv : Void**) : HRESULT

  # Params # pmalloc : IMalloc [In],rclsid : Guid* [In],riid : Guid* [In],ppv : Void** [In]
  fun DxcCreateInstance2(pmalloc : IMalloc, rclsid : Guid*, riid : Guid*, ppv : Void**) : HRESULT
end
