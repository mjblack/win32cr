require "./../../foundation.cr"
require "./../direct3_d.cr"
require "./../direct3_d11.cr"
require "./../direct3_d10.cr"

module Win32cr::Graphics::Direct3D::Fxc
  alias Pd3dcompile = Proc(Void*, LibC::UIntPtrT, Win32cr::Foundation::PSTR, Win32cr::Graphics::Direct3D::D3D_SHADER_MACRO*, Void*, Win32cr::Foundation::PSTR, Win32cr::Foundation::PSTR, UInt32, UInt32, Void**, Void**, Win32cr::Foundation::HRESULT)*

  alias Pd3dpreprocess = Proc(Void*, LibC::UIntPtrT, Win32cr::Foundation::PSTR, Win32cr::Graphics::Direct3D::D3D_SHADER_MACRO*, Void*, Void**, Void**, Win32cr::Foundation::HRESULT)*

  alias Pd3ddisassemble = Proc(Void*, LibC::UIntPtrT, UInt32, Win32cr::Foundation::PSTR, Void**, Win32cr::Foundation::HRESULT)*

  D3DCOMPILER_DLL_W = "d3dcompiler_47.dll"
  D3DCOMPILER_DLL_A = "d3dcompiler_47.dll"
  D3D_COMPILER_VERSION = 47_u32
  D3DCOMPILE_DEBUG = 1_u32
  D3DCOMPILE_SKIP_VALIDATION = 2_u32
  D3DCOMPILE_SKIP_OPTIMIZATION = 4_u32
  D3DCOMPILE_PACK_MATRIX_ROW_MAJOR = 8_u32
  D3DCOMPILE_PACK_MATRIX_COLUMN_MAJOR = 16_u32
  D3DCOMPILE_PARTIAL_PRECISION = 32_u32
  D3DCOMPILE_FORCE_VS_SOFTWARE_NO_OPT = 64_u32
  D3DCOMPILE_FORCE_PS_SOFTWARE_NO_OPT = 128_u32
  D3DCOMPILE_NO_PRESHADER = 256_u32
  D3DCOMPILE_AVOID_FLOW_CONTROL = 512_u32
  D3DCOMPILE_PREFER_FLOW_CONTROL = 1024_u32
  D3DCOMPILE_ENABLE_STRICTNESS = 2048_u32
  D3DCOMPILE_ENABLE_BACKWARDS_COMPATIBILITY = 4096_u32
  D3DCOMPILE_IEEE_STRICTNESS = 8192_u32
  D3DCOMPILE_OPTIMIZATION_LEVEL0 = 16384_u32
  D3DCOMPILE_OPTIMIZATION_LEVEL1 = 0_u32
  D3DCOMPILE_OPTIMIZATION_LEVEL3 = 32768_u32
  D3DCOMPILE_RESERVED16 = 65536_u32
  D3DCOMPILE_RESERVED17 = 131072_u32
  D3DCOMPILE_WARNINGS_ARE_ERRORS = 262144_u32
  D3DCOMPILE_RESOURCES_MAY_ALIAS = 524288_u32
  D3DCOMPILE_ENABLE_UNBOUNDED_DESCRIPTOR_TABLES = 1048576_u32
  D3DCOMPILE_ALL_RESOURCES_BOUND = 2097152_u32
  D3DCOMPILE_DEBUG_NAME_FOR_SOURCE = 4194304_u32
  D3DCOMPILE_DEBUG_NAME_FOR_BINARY = 8388608_u32
  D3DCOMPILE_EFFECT_CHILD_EFFECT = 1_u32
  D3DCOMPILE_EFFECT_ALLOW_SLOW_OPS = 2_u32
  D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_LATEST = 0_u32
  D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_0 = 16_u32
  D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_1 = 32_u32
  D3DCOMPILE_SECDATA_MERGE_UAV_SLOTS = 1_u32
  D3DCOMPILE_SECDATA_PRESERVE_TEMPLATE_SLOTS = 2_u32
  D3DCOMPILE_SECDATA_REQUIRE_TEMPLATE_MATCH = 4_u32
  D3D_DISASM_ENABLE_COLOR_CODE = 1_u32
  D3D_DISASM_ENABLE_DEFAULT_VALUE_PRINTS = 2_u32
  D3D_DISASM_ENABLE_INSTRUCTION_NUMBERING = 4_u32
  D3D_DISASM_ENABLE_INSTRUCTION_CYCLE = 8_u32
  D3D_DISASM_DISABLE_DEBUG_INFO = 16_u32
  D3D_DISASM_ENABLE_INSTRUCTION_OFFSET = 32_u32
  D3D_DISASM_INSTRUCTION_ONLY = 64_u32
  D3D_DISASM_PRINT_HEX_LITERALS = 128_u32
  D3D_GET_INST_OFFSETS_INCLUDE_NON_EXECUTABLE = 1_u32
  D3D_COMPRESS_SHADER_KEEP_ALL_PARTS = 1_u32

  enum D3DCOMPILER_STRIP_FLAGS
    D3DCOMPILER_STRIP_REFLECTION_DATA = 1_i32
    D3DCOMPILER_STRIP_DEBUG_INFO = 2_i32
    D3DCOMPILER_STRIP_TEST_BLOBS = 4_i32
    D3DCOMPILER_STRIP_PRIVATE_DATA = 8_i32
    D3DCOMPILER_STRIP_ROOT_SIGNATURE = 16_i32
    D3DCOMPILER_STRIP_FORCE_DWORD = 2147483647_i32
  end
  enum D3D_BLOB_PART
    D3D_BLOB_INPUT_SIGNATURE_BLOB = 0_i32
    D3D_BLOB_OUTPUT_SIGNATURE_BLOB = 1_i32
    D3D_BLOB_INPUT_AND_OUTPUT_SIGNATURE_BLOB = 2_i32
    D3D_BLOB_PATCH_CONSTANT_SIGNATURE_BLOB = 3_i32
    D3D_BLOB_ALL_SIGNATURE_BLOB = 4_i32
    D3D_BLOB_DEBUG_INFO = 5_i32
    D3D_BLOB_LEGACY_SHADER = 6_i32
    D3D_BLOB_XNA_PREPASS_SHADER = 7_i32
    D3D_BLOB_XNA_SHADER = 8_i32
    D3D_BLOB_PDB = 9_i32
    D3D_BLOB_PRIVATE_DATA = 10_i32
    D3D_BLOB_ROOT_SIGNATURE = 11_i32
    D3D_BLOB_DEBUG_NAME = 12_i32
    D3D_BLOB_TEST_ALTERNATE_SHADER = 32768_i32
    D3D_BLOB_TEST_COMPILE_DETAILS = 32769_i32
    D3D_BLOB_TEST_COMPILE_PERF = 32770_i32
    D3D_BLOB_TEST_COMPILE_REPORT = 32771_i32
  end

  @[Extern]
  record D3D_SHADER_DATA,
    pBytecode : Void*,
    bytecode_length : LibC::UIntPtrT

  @[Link("d3dcompiler_47")]
  lib C
    fun D3DReadFileToBlob(pFileName : Win32cr::Foundation::PWSTR, ppContents : Void**) : Win32cr::Foundation::HRESULT

    fun D3DWriteBlobToFile(pBlob : Void*, pFileName : Win32cr::Foundation::PWSTR, bOverwrite : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    fun D3DCompile(pSrcData : Void*, src_data_size : LibC::UIntPtrT, pSourceName : Win32cr::Foundation::PSTR, pDefines : Win32cr::Graphics::Direct3D::D3D_SHADER_MACRO*, pInclude : Void*, pEntrypoint : Win32cr::Foundation::PSTR, pTarget : Win32cr::Foundation::PSTR, flags1 : UInt32, flags2 : UInt32, ppCode : Void**, ppErrorMsgs : Void**) : Win32cr::Foundation::HRESULT

    fun D3DCompile2(pSrcData : Void*, src_data_size : LibC::UIntPtrT, pSourceName : Win32cr::Foundation::PSTR, pDefines : Win32cr::Graphics::Direct3D::D3D_SHADER_MACRO*, pInclude : Void*, pEntrypoint : Win32cr::Foundation::PSTR, pTarget : Win32cr::Foundation::PSTR, flags1 : UInt32, flags2 : UInt32, secondary_data_flags : UInt32, pSecondaryData : Void*, secondary_data_size : LibC::UIntPtrT, ppCode : Void**, ppErrorMsgs : Void**) : Win32cr::Foundation::HRESULT

    fun D3DCompileFromFile(pFileName : Win32cr::Foundation::PWSTR, pDefines : Win32cr::Graphics::Direct3D::D3D_SHADER_MACRO*, pInclude : Void*, pEntrypoint : Win32cr::Foundation::PSTR, pTarget : Win32cr::Foundation::PSTR, flags1 : UInt32, flags2 : UInt32, ppCode : Void**, ppErrorMsgs : Void**) : Win32cr::Foundation::HRESULT

    fun D3DPreprocess(pSrcData : Void*, src_data_size : LibC::UIntPtrT, pSourceName : Win32cr::Foundation::PSTR, pDefines : Win32cr::Graphics::Direct3D::D3D_SHADER_MACRO*, pInclude : Void*, ppCodeText : Void**, ppErrorMsgs : Void**) : Win32cr::Foundation::HRESULT

    fun D3DGetDebugInfo(pSrcData : Void*, src_data_size : LibC::UIntPtrT, ppDebugInfo : Void**) : Win32cr::Foundation::HRESULT

    fun D3DReflect(pSrcData : Void*, src_data_size : LibC::UIntPtrT, pInterface : LibC::GUID*, ppReflector : Void**) : Win32cr::Foundation::HRESULT

    fun D3DReflectLibrary(pSrcData : Void*, src_data_size : LibC::UIntPtrT, riid : LibC::GUID*, ppReflector : Void**) : Win32cr::Foundation::HRESULT

    fun D3DDisassemble(pSrcData : Void*, src_data_size : LibC::UIntPtrT, flags : UInt32, szComments : Win32cr::Foundation::PSTR, ppDisassembly : Void**) : Win32cr::Foundation::HRESULT

    fun D3DDisassembleRegion(pSrcData : Void*, src_data_size : LibC::UIntPtrT, flags : UInt32, szComments : Win32cr::Foundation::PSTR, start_byte_offset : LibC::UIntPtrT, num_insts : LibC::UIntPtrT, pFinishByteOffset : LibC::UIntPtrT*, ppDisassembly : Void**) : Win32cr::Foundation::HRESULT

    fun D3DCreateLinker(ppLinker : Void**) : Win32cr::Foundation::HRESULT

    fun D3DLoadModule(pSrcData : Void*, cbSrcDataSize : LibC::UIntPtrT, ppModule : Void**) : Win32cr::Foundation::HRESULT

    fun D3DCreateFunctionLinkingGraph(uFlags : UInt32, ppFunctionLinkingGraph : Void**) : Win32cr::Foundation::HRESULT

    fun D3DGetTraceInstructionOffsets(pSrcData : Void*, src_data_size : LibC::UIntPtrT, flags : UInt32, start_inst_index : LibC::UIntPtrT, num_insts : LibC::UIntPtrT, pOffsets : LibC::UIntPtrT*, pTotalInsts : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT

    fun D3DGetInputSignatureBlob(pSrcData : Void*, src_data_size : LibC::UIntPtrT, ppSignatureBlob : Void**) : Win32cr::Foundation::HRESULT

    fun D3DGetOutputSignatureBlob(pSrcData : Void*, src_data_size : LibC::UIntPtrT, ppSignatureBlob : Void**) : Win32cr::Foundation::HRESULT

    fun D3DGetInputAndOutputSignatureBlob(pSrcData : Void*, src_data_size : LibC::UIntPtrT, ppSignatureBlob : Void**) : Win32cr::Foundation::HRESULT

    fun D3DStripShader(pShaderBytecode : Void*, bytecode_length : LibC::UIntPtrT, uStripFlags : UInt32, ppStrippedBlob : Void**) : Win32cr::Foundation::HRESULT

    fun D3DGetBlobPart(pSrcData : Void*, src_data_size : LibC::UIntPtrT, part : Win32cr::Graphics::Direct3D::Fxc::D3D_BLOB_PART, flags : UInt32, ppPart : Void**) : Win32cr::Foundation::HRESULT

    fun D3DSetBlobPart(pSrcData : Void*, src_data_size : LibC::UIntPtrT, part : Win32cr::Graphics::Direct3D::Fxc::D3D_BLOB_PART, flags : UInt32, pPart : Void*, part_size : LibC::UIntPtrT, ppNewShader : Void**) : Win32cr::Foundation::HRESULT

    fun D3DCreateBlob(size : LibC::UIntPtrT, ppBlob : Void**) : Win32cr::Foundation::HRESULT

    fun D3DCompressShaders(uNumShaders : UInt32, pShaderData : Win32cr::Graphics::Direct3D::Fxc::D3D_SHADER_DATA*, uFlags : UInt32, ppCompressedData : Void**) : Win32cr::Foundation::HRESULT

    fun D3DDecompressShaders(pSrcData : Void*, src_data_size : LibC::UIntPtrT, uNumShaders : UInt32, uStartIndex : UInt32, pIndices : UInt32*, uFlags : UInt32, ppShaders : Void**, pTotalShaders : UInt32*) : Win32cr::Foundation::HRESULT

    fun D3DDisassemble10Effect(pEffect : Void*, flags : UInt32, ppDisassembly : Void**) : Win32cr::Foundation::HRESULT

  end
end